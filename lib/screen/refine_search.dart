import 'package:tiutiu/features/refine_search/controller/filter_controller.dart';
import 'package:tiutiu/core/constants/firebase_env_path.dart';
import 'package:tiutiu/core/utils/routes/routes_name.dart';
import 'package:tiutiu/features/system/controllers.dart';
import 'package:tiutiu/Widgets/load_dark_screen.dart';
import 'package:tiutiu/screen/selection_page.dart';
import 'package:tiutiu/core/data/dummy_data.dart';
import 'package:tiutiu/core/Custom/icons.dart';
import 'package:tiutiu/Widgets/button.dart';
import 'package:tiutiu/Widgets/badge.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final FilterController _refineSearchController = Get.find();

class RefineSearch extends StatefulWidget {
  @override
  _RefineSearchState createState() => _RefineSearchState();
}

class _RefineSearchState extends State<RefineSearch> {
  bool? isRefiningSearch = false;
  bool? isPetDisappeared = false;
  int? selectedKind;

  List petsType = ['Cachorro', 'Gato', 'Pássaro', 'Hamster', 'Outro'];

  void changeIsRefineSearchStatus(bool status) {
    setState(() {
      isRefiningSearch = status;
    });
  }

  void changePetKind(bool value) {
    _refineSearchController.isDisappeared = value;
  }

  void handleSelectedKind(int index) {
    _refineSearchController.clearRefineSelections();
    if (index == 0) petsController.petType = 'Todos';
    petsController.petType = petsType[index - 1];
    _refineSearchController.filterTypeTextSelected = petsType[index];
  }

  @override
  void didChangeDependencies() {
    selectedKind = _refineSearchController.typeSelected;
    // adsProvider = Provider.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    List listOptions = [
      {
        'title': 'Raça',
        'valueSelected': _refineSearchController.breedSelected,
        'selectionPaitle': 'Selecione as Raças',
        'selectionPageList': DummyData.breed[selectedKind!],
        'onValueSelected': (String value) {
          _refineSearchController.breedSelected = value;
        },
        'clearFunction': () {
          _refineSearchController.breedSelected = '';
        }
      },
      {
        'title': 'Tamanho',
        'valueSelected': _refineSearchController.sizeSelected,
        'selectionPaitle': 'Tamanhos',
        'selectionPageList': DummyData.size,
        'onValueSelected': (String value) {
          _refineSearchController.sizeSelected = value;
        },
        'clearFunction': () {
          _refineSearchController.sizeSelected = '';
        }
      },
      {
        'title': 'Idade',
        'valueSelected': _refineSearchController.ageSelected,
        'selectionPaitle': 'Idades',
        'selectionPageList': DummyData.ages,
        'onValueSelected': (String value) {
          print('value $value');
          if (value == '-1 .ageYear') {
            _refineSearchController.ageSelected = 'Menos de 1 .ageYear';
          } else if (value == '10+ anos') {
            _refineSearchController.ageSelected = 'Mais de 10 anos';
          } else {
            _refineSearchController.ageSelected = value;
          }
        },
        'clearFunction': () {
          _refineSearchController.ageSelected = '';
        }
      },
      {
        'title': 'Sexo',
        'valueSelected': _refineSearchController.genderSelected,
        'selectionPaitle': 'Sexo',
        'selectionPageList': ['Macho', 'Fêmea'],
        'onValueSelected': (String value) {
          _refineSearchController.genderSelected = value;
        },
        'clearFunction': () {
          _refineSearchController.genderSelected = '';
        }
      },
      {
        'title': 'Saúde',
        'valueSelected': _refineSearchController.healthSelected,
        'selectionPaitle': 'Estado de saúde',
        'selectionPageList': DummyData.health,
        'onValueSelected': (String value) {
          _refineSearchController.healthSelected = value;
        },
        'clearFunction': () {
          _refineSearchController.healthSelected = '';
        }
      },
      {
        'title': 'Numa distância de até',
        'valueSelected': _refineSearchController.distancieSelected,
        'selectionPaitle': 'Numa distância de até',
        'selectionPageList': DummyData.distancies,
        'onValueSelected': (String value) {
          _refineSearchController.distancieSelected = value;
        },
        'clearFunction': () {
          _refineSearchController.distancieSelected = '';
        }
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Refine sua busca',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment(-1, 1),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 15.0),
                    child: Text(
                      'Tipo de PET',
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Colors.black),
                    ),
                  ),
                ),
                _PetSelector(
                  handleSelectedKind: handleSelectedKind,
                  selectedKind: petsController.petType == 'Todos'
                      ? 0
                      : petsType.indexOf(petsController.petType) + 1,
                ),
                Stack(
                  children: [
                    Column(
                      children: listOptions.map((optionTile) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: _SelecterTile(
                            titleTile: optionTile['title'],
                            valueSelected: optionTile['valueSelected'],
                            clear: optionTile['clearFunction'],
                            onTap: petsController.petType == 'Todos'
                                ? null
                                : () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return SelectionPage(
                                            title:
                                                optionTile['selectionPaitle'],
                                            list:
                                                optionTile['selectionPageList'],
                                            valueSelected:
                                                optionTile['valueSelected'],
                                          );
                                        },
                                      ),
                                    ).then((value) {
                                      if (value != null) {
                                        optionTile['onValueSelected'](value);
                                      }
                                    });
                                  },
                          ),
                        );
                      }).toList(),
                    ),
                    petsController.petType == 'Todos'
                        ? Container(color: Colors.black12, height: 328)
                        : Container(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'Desaparecido ?',
                        style: TextStyle(fontSize: 18),
                      ),
                      Checkbox(
                        value: _refineSearchController.isDisappeared,
                        onChanged: (value) {
                          changePetKind(value!);
                        },
                      ),
                      Text(
                        'Sim',
                        style: TextStyle(fontSize: 18),
                      ),
                      Checkbox(
                        value: !_refineSearchController.isDisappeared,
                        onChanged: (value) {
                          changePetKind(!value!);
                        },
                      ),
                      Text(
                        'Não',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonWide(
                    color: isRefiningSearch! ? Colors.grey : Colors.purple,
                    text: 'BUSCAR',
                    action: isRefiningSearch!
                        ? null
                        : () async {
                            petsController.petKind =
                                _refineSearchController.isDisappeared
                                    ? FirebaseEnvPath.disappeared
                                    : FirebaseEnvPath.donate;
                            _refineSearchController.searchHomeTypeInitialValue =
                                petsController.petType;
                            petsController.breedSelected =
                                _refineSearchController.breedSelected;
                            petsController.sizeSelected =
                                _refineSearchController.sizeSelected;
                            petsController.ageSelected =
                                _refineSearchController.ageSelected;
                            petsController.genderSelected =
                                _refineSearchController.genderSelected;
                            petsController.healthSelected =
                                _refineSearchController.healthSelected;
                            petsController.isFiltering =
                                petsController.petType == 'Todos'
                                    ? false
                                    : true;

                            Navigator.pushNamed(context, Routes.home,
                                arguments: _refineSearchController.isDisappeared
                                    ? 1
                                    : 0);
                          },
                  ),
                ),
                // adsProvider.getCanShowAds
                // // ? adsProvider.bannerAdMob(adId: adsProvider.bottomAdId)
                // : Container(),
              ],
            ),
          ),
          LoadDarkScreen(
            show: isRefiningSearch!,
            message: 'Refinando resultados...',
          )
        ],
      ),
    );
  }
}

class _PetSelector extends StatelessWidget {
  _PetSelector({
    this.handleSelectedKind,
    this.selectedKind,
  });
  final Function(int)? handleSelectedKind;
  final int? selectedKind;

  final List selector = [
    {'Todos': Icons.all_inclusive},
    {'Cachorro': Tiutiu.dog},
    {'Gato': Tiutiu.cat},
    {'Pássaro': Tiutiu.twitter_bird},
    {'Hamster': Tiutiu.hamster},
    {'Outro': Tiutiu.question},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120,
        child: ListView.builder(
          key: UniqueKey(),
          scrollDirection: Axis.horizontal,
          itemCount: selector.length,
          itemBuilder: (_, index) {
            return Card(
              margin:
                  const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0)),
              elevation: index == selectedKind ? 6.0 : null,
              child: InkWell(
                onTap: () {
                  handleSelectedKind!(index);
                },
                child: Container(
                  color: index == selectedKind
                      ? Theme.of(context).primaryColor
                      : null,
                  width: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        selector[index].values.first,
                        size: 40,
                        color:
                            index == selectedKind ? Colors.white : Colors.black,
                      ),
                      SizedBox(height: 10),
                      Text(
                        selector[index].keys.first,
                        style: TextStyle(
                          fontWeight:
                              index == selectedKind ? FontWeight.bold : null,
                          color: index == selectedKind
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _SelecterTile extends StatefulWidget {
  _SelecterTile({
    this.titleTile,
    this.valueSelected,
    this.onTap,
    this.clear,
  });

  final String? titleTile;
  final String? valueSelected;
  final Function()? onTap;
  final Function()? clear;

  @override
  __SelecterTileState createState() => __SelecterTileState();
}

class __SelecterTileState extends State<_SelecterTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Text(
                    widget.titleTile!,
                    style: TextStyle(fontSize: 18),
                  ),
                  Spacer(),
                  widget.valueSelected != null &&
                          widget.valueSelected!.isNotEmpty
                      ? Container(
                          height: 20,
                          child: Badge(text: widget.valueSelected),
                        )
                      : Container(),
                  Spacer(),
                  widget.valueSelected != null &&
                          widget.valueSelected!.isNotEmpty
                      ? TextButton(
                          child: Text('Limpar'),
                          onPressed: () => widget.clear?.call(),
                        )
                      : Icon(Tiutiu.plus_squared_alt),
                ],
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
