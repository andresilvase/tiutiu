import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:tiutiu/Widgets/card_list.dart';
import 'package:tiutiu/Widgets/custom_input_search.dart';
import 'package:tiutiu/Widgets/error_page.dart';
import 'package:tiutiu/Widgets/input_search.dart';
import 'package:tiutiu/Widgets/loading_page.dart';
import 'package:tiutiu/core/data/dummy_data.dart';
import 'package:tiutiu/features/pets/model/pet_model.dart';
import 'package:tiutiu/features/refine_search/controller/refine_search_controller.dart';
import 'package:tiutiu/providers/pets_provider.dart';
import 'package:tiutiu/core/constants/firebase_env_path.dart';
import 'package:tiutiu/utils/constantes.dart';
import 'package:tiutiu/utils/other_functions.dart';
import 'package:tiutiu/core/utils/routes/routes_name.dart';
import 'package:tiutiu/utils/string_extension.dart';

final RefineSearchController _refineSearchController = Get.find();

class DonateDisappearedList extends StatefulWidget {
  DonateDisappearedList({
    this.stream,
  });
  final Stream<List<Pet>>? stream;

  @override
  _DonateDisappearedListState createState() => _DonateDisappearedListState();
}

class _DonateDisappearedListState extends State<DonateDisappearedList> {
  bool filtering = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  late ScrollController _scrollController;
  GlobalKey dataKey = GlobalKey();
  late PetsProvider petsProvider;

  // AdsProvider adsProvider;
  // late Location location;

  void showSnackBar(String content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
        duration: Duration(milliseconds: 1500),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    // adsProvider = Provider.of(context);

    petsProvider = Provider.of<PetsProvider>(context);
    // location = Provider.of<Location>(context);

    super.didChangeDependencies();
  }

  @override
  void initState() {
    _scrollController = new ScrollController();
    super.initState();
  }

  List<Pet> filterResultsByAgeOver10(List<Pet> petsListResult) {
    List<Pet> newPetList = [];

    for (int i = 0; i < petsListResult.length; i++) {
      if (petsListResult[i].ano! >= 10) {
        newPetList.add(petsListResult[i]);
      }
    }

    return newPetList;
  }

  int orderByPostDate(Pet a, Pet b) {
    return DateTime.parse(b.createdAt!).millisecondsSinceEpoch -
        DateTime.parse(a.createdAt!).millisecondsSinceEpoch;
  }

  int orderByName(Pet a, Pet b) {
    List<int> aname = a.name!.codeUnits;
    List<int> bname = b.name!.codeUnits;

    int i = 0;
    while (i < bname.length) {
      if (bname[i] < aname[i]) {
        return 1;
      } else if (bname[i] == aname[i]) {
        i++;
        if (i >= aname.length) {
          return 1;
        }
      } else {
        return -1;
      }
    }
    return 1;
  }

  int orderByAge(Pet a, Pet b) {
    if (a.ano == b.ano) return a.meses! - b.meses!;
    return a.ano! - b.ano!;
  }

  List<Pet> showAdminCards(List<Pet> petCards) {
    for (int i = 0; i < petCards.length; i++) {
      if (petCards[i].ownerId == Constantes.ADMIN_ID &&
          DateTime.now()
                  .difference(DateTime.parse(petCards[i].createdAt!))
                  .inDays >
              2) {
        petCards.removeAt(i);
      } else if (petCards[i].ownerId == Constantes.ADMIN_ID) {
        Pet pet = petCards[i];
        petCards.removeAt(i);
        petCards.insert(0, pet);
      }
    }

    return petCards;
  }

  @override
  Widget build(BuildContext context) {
    final marginTop = MediaQuery.of(context).size.height / 1.15;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.blueGrey[50],
      body: ListView(
        children: [
          FilterCard(),
          StreamBuilder<List<Pet>>(
            stream: (petsProvider.getIsFilteringByBreed ||
                    petsProvider.getIsFilteringByName)
                ? petsProvider.typingSearchResult
                : widget.stream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Padding(
                  padding: EdgeInsets.only(top: height / 4.5),
                  child: LoadingPage(
                    messageLoading: 'Carregando PETS perto de você...',
                    circle: true,
                    textColor: Colors.black26,
                  ),
                );
              }

              if (snapshot.hasError) {
                return ErrorPage();
              }

              List<Pet> petsList = OtherFunctions.filterResultsByDistancie(
                context,
                snapshot.data,
                'null',
              );

              if (petsProvider.getAgeSelected.isNotEmpty &&
                  petsProvider.getAgeSelected == 'Mais de 10 anos') {
                petsList = filterResultsByAgeOver10(snapshot.data);
              }

              switch (petsProvider.getOrderType) {
                case 'Nome':
                  petsList.sort(orderByName);
                  break;
                case 'Idade':
                  petsList.sort(orderByAge);
                  break;
                default:
                  petsList.sort(orderByPostDate);
              }

              petsList = showAdminCards(petsList);

              if (snapshot.data == null || petsList.length == 0) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.search);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: height / 3.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Nenhum PET encontrado',
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.headline1!.copyWith(
                                    color: Colors.black,
                                  ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Verifique seus filtros de busca.',
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.headline1!.copyWith(
                                    color: Colors.blueAccent,
                                  ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return Container(
                height: marginTop,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 20,
                      alignment: Alignment(-0.9, 1),
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      margin: const EdgeInsets.only(bottom: 10, top: 5),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Text(
                                '${petsList.length} ',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black26,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 2.0),
                                child: Text(
                                  'encontrados',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black26,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 3.0),
                                child: Text(
                                  'ordenar por:  ',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black26,
                                  ),
                                ),
                              ),
                              StreamBuilder<Object>(
                                stream: petsProvider.orderType,
                                builder: (context, snapshot) {
                                  return CustomDropdownButtonSearch(
                                    colorText: Colors.black54,
                                    fontSize: 13,
                                    initialValue: petsProvider.getOrderType,
                                    isExpanded: false,
                                    withPipe: false,
                                    itemList: petsProvider.getOrderTypeList,
                                    label: '',
                                    onChange: (String text) {
                                      petsProvider.changeOrderType(
                                        text,
                                        'null',
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        key: UniqueKey(),
                        controller: _scrollController,
                        itemCount: petsList.length + 1,
                        itemBuilder: (_, index) {
                          if (index == petsList.length) {
                            return petsList.length > 1
                                ? InkWell(
                                    onTap: () {
                                      _scrollController.animateTo(
                                          0 * height / 3,
                                          duration: new Duration(seconds: 2),
                                          curve: Curves.ease);
                                    },
                                    child: Container(
                                      height: 280,
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          children: [
                                            // adsProvider.getCanShowAds
                                            // ? adsProvider.bannerAdMob(
                                            // adId: adsProvider.topAdId,
                                            //     medium_banner: true)
                                            // : Container(),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0, bottom: 24.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                      'Voltar ao topo'
                                                          .toUpperCase(),
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontWeight:
                                                              FontWeight.w700)),
                                                  Icon(
                                                      Icons.arrow_drop_up_sharp,
                                                      color: Colors.blue)
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : Container();
                          }

                          return CardList(
                            donate:
                                petsList[index].kind == FirebaseEnvPath.donate,
                            kind: petsList[index].kind,
                            petInfo: petsList[index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _StateFilter extends StatefulWidget {
  _StateFilter({
    this.petsProvider,
  });

  final PetsProvider? petsProvider;

  @override
  _StateFilterState createState() => _StateFilterState();
}

class _StateFilterState extends State<_StateFilter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 7.0, left: 24),
              child: Text(
                'Resultados de ',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Colors.black26,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: StreamBuilder<String>(builder: (context, snapshot) {
                return Container(
                  height: 20,
                  alignment: Alignment.center,
                  child: DropdownButton<String>(
                    underline: Container(),
                    value: 'null',
                    onChanged: (value) async {
                      if (value == 'Brasil') {
                        value = null;
                      }

                      widget.petsProvider!.reloadList(state: value);
                    },
                    items: DummyData.statesName
                        .map<DropdownMenuItem<String>>((String e) {
                      return DropdownMenuItem<String>(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            e.trim(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        value: e,
                      );
                    }).toList(),
                  ),
                );
              }),
            ),
          ],
        ),
      ],
    );
  }
}

class _HomeSearch extends StatelessWidget {
  _HomeSearch({
    this.petsProvider,
  });

  final PetsProvider? petsProvider;

  void handleSearchType(String searchType) {
    switch (searchType) {
      case 'Nome do PET':
        petsProvider!.changeIsFilteringByBreed(false);
        _refineSearchController.changeSearchPetByTypeOnHome(false);
        _refineSearchController.changeSearchHomeTypeInitialValue(searchType);
        break;
      case 'Tipo':
        petsProvider!.changeIsFilteringByBreed(false);
        petsProvider!.changeIsFilteringByName(false);
        _refineSearchController.changeSearchPetByTypeOnHome(true);
        _refineSearchController.changeSearchHomeTypeInitialValue(searchType);
        handleSearchOptions(
          _refineSearchController.searchHomeTypeInitialValue,
        );
        break;
      default:
        petsProvider!.changeIsFilteringByName(false);
        _refineSearchController.changeSearchPetByTypeOnHome(false);
        _refineSearchController.changeSearchHomeTypeInitialValue(searchType);
    }
  }

  void handleSearchOptions(String searchOption) {
    petsProvider!.clearOthersFilters();
    _refineSearchController.changeSearchHomePetTypeInitialValue(searchOption);
    petsProvider!.changePetType(searchOption);

    if (searchOption == 'Todos') {
      _refineSearchController.clearRefineSelections();
      switch (petsProvider!.getPetKind) {
        case FirebaseEnvPath.donate:
          _refineSearchController.changeIsHomeFilteringByDonate(false);
          _refineSearchController.changeHomePetTypeFilterByDonate(searchOption);
          petsProvider!.changeIsFiltering(false);
          petsProvider!.loadDonatePETS(
            state: _refineSearchController.stateOfResultSearch,
          );
          break;
        case FirebaseEnvPath.disappeared:
          _refineSearchController.changeIsHomeFilteringByDisappeared(false);
          _refineSearchController
              .changeHomePetTypeFilterByDisappeared(searchOption);
          petsProvider!.changeIsFiltering(false);
          petsProvider!.loadDisappearedPETS(
              state: _refineSearchController.stateOfResultSearch);
          break;
      }
    } else {
      switch (petsProvider!.getPetKind) {
        case FirebaseEnvPath.donate:
          _refineSearchController.changeIsHomeFilteringByDonate(true);
          _refineSearchController.changeHomePetTypeFilterByDonate(searchOption);
          petsProvider!.changeIsFiltering(true);
          petsProvider!.loadDonatePETS(
              state: _refineSearchController.stateOfResultSearch);
          break;
        case FirebaseEnvPath.disappeared:
          _refineSearchController.changeIsHomeFilteringByDisappeared(true);
          _refineSearchController
              .changeHomePetTypeFilterByDisappeared(searchOption);
          petsProvider!.changeIsFiltering(true);
          petsProvider!.loadDisappearedPETS(
              state: _refineSearchController.stateOfResultSearch);
          break;
      }
    }
  }

  void handleOnTextSearchChange(String textSearch) {
    if (_refineSearchController.searchHomeTypeInitialValue == 'Nome do PET') {
      petsProvider!.changeIsFilteringByName(true);
      petsProvider!.clearOthersFilters();
      petsProvider!.changePetName(textSearch);
    } else {
      petsProvider!.changeIsFilteringByBreed(true);
      petsProvider!.clearOthersFilters();
      petsProvider!.changeBreedSelected(textSearch);
    }
    petsProvider!.changeIsFiltering(true);
    performTypingSearch(textSearch);
  }

  void performTypingSearch(String text) {
    petsProvider!.changeTypingSearchResult([]);

    List<Pet> oldPetList = petsProvider!.getPetKind == FirebaseEnvPath.donate
        ? petsProvider!.getPetsDonate
        : petsProvider!.getPetsDisappeared;
    if (text.trim().removeAccent().isNotEmpty) {
      List<Pet> newPetList = [];
      for (Pet pet in oldPetList) {
        if (petsProvider!.getIsFilteringByName &&
            pet.name!.toLowerCase().contains(text.removeAccent().toLowerCase()))
          newPetList.add(pet);
        if (petsProvider!.getIsFilteringByBreed &&
            pet.breed!
                .toLowerCase()
                .contains(text.removeAccent().toLowerCase()))
          newPetList.add(pet);
      }
      petsProvider!.changeTypingSearchResult(newPetList);
    }
    if (text.trim().removeAccent().isEmpty)
      petsProvider!.changeTypingSearchResult(oldPetList);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
        builder: (context, snapshotSearchHomeInitialValue) {
      return StreamBuilder<List<String>>(
          builder: (context, snapshotsnapshotSearchHomeValues) {
        return StreamBuilder<String>(
            builder: (context, snapshotHomePetTypeInitialValue) {
          return StreamBuilder<List<String>>(
              builder: (context, snapshotHomePetTypeValues) {
            return StreamBuilder<bool>(
                builder: (context, snapshotSearchPetByTypeOnHome) {
              return CustomInput(
                searchInitialValue: snapshotSearchHomeInitialValue.data ?? '',
                searchValues: snapshotsnapshotSearchHomeValues.data ?? [''],
                searchPetTypeInitialValue:
                    snapshotHomePetTypeInitialValue.data ?? '',
                searchPetTypeValues: snapshotHomePetTypeValues.data ?? [''],
                isType: snapshotSearchPetByTypeOnHome.data ?? false,
                onDropdownTypeChange: handleSearchType,
                onDropdownHomeSearchOptionsChange: handleSearchOptions,
                onChanged: handleOnTextSearchChange,
              );
            });
          });
        });
      });
    });
  }
}

class FilterCard extends StatefulWidget {
  FilterCard({
    this.petsProvider,
  });

  final PetsProvider? petsProvider;

  @override
  _FilterCardState createState() => _FilterCardState();
}

class _FilterCardState extends State<FilterCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: _isExpanded ? 240 : 48,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Filtrar resultado"),
                    Icon(_isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.expand_more),
                  ],
                ),
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: _isExpanded ? 170 : 0,
              child: ListView(
                children: [
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: _StateFilter(
                      petsProvider: widget.petsProvider,
                    ),
                  ),
                  Divider(),
                  _HomeSearch(
                    petsProvider: widget.petsProvider,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Divider(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
