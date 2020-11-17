import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiutiu/Custom/icons.dart';
import 'package:tiutiu/backend/Controller/user_controller.dart';
import 'package:tiutiu/backend/Model/pet_model.dart';
import 'package:tiutiu/backend/Model/user_model.dart';
import 'package:tiutiu/providers/auth2.dart';
import 'package:tiutiu/providers/favorites_provider.dart';
import 'package:tiutiu/providers/location.dart' as provider_location;
import 'package:tiutiu/providers/pets_provider.dart';
import 'package:tiutiu/providers/user_provider.dart';
import 'package:tiutiu/screen/pet_detail.dart';
import 'package:tiutiu/utils/math_functions.dart';
import 'package:tiutiu/utils/other_functions.dart';

// ignore: must_be_immutable
class CardList extends StatefulWidget {
  CardList({
    this.petInfo,
    this.donate = true,
    this.kind,
    this.favorite = false,
  });

  final Pet petInfo;
  final String kind;
  final bool donate;
  bool favorite;

  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  UserProvider userProvider;

  Future loadOwner(DocumentReference doc, {Authentication auth}) async {
    final owner = await doc.get();
    if (auth != null) {
      if (auth.firebaseUser.uid == owner.data()['uid']) {
        Map map = {'displayName': 'Você'};
        return Future.value(map);
      }
    }
    return Future.value(owner.data());
  }

  @override
  void didChangeDependencies() {
    userProvider = Provider.of<UserProvider>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    UserController user = UserController();
    Authentication auth = Provider.of(context, listen: false);
    FavoritesProvider favoritesProvider = Provider.of(context);

    List<String> distanceText = OtherFunctions.distanceCalculate(
      context,
      widget.petInfo.latitude,
      widget.petInfo.longitude,
    );

    return Stack(
      children: [
        InkWell(
          onTap: () async {
            if (userProvider.uid != null &&
                userProvider.uid != widget.petInfo.ownerId) {
              PetsProvider().increaseViews(
                actualViews: widget.petInfo.views ?? 1,
                petReference: widget.petInfo.petReference,
              );
            }
            final user = await loadOwner(widget.petInfo.ownerReference);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return PetDetails(
                    petOwner: User.fromMap(user),
                    isMine: User.fromMap(user).id == auth.firebaseUser?.uid,
                    pet: widget.petInfo,
                    kind: widget.petInfo.kind.toUpperCase(),
                  );
                },
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    border: Border.all(
                      style: BorderStyle.solid,
                      color: Colors.grey,
                    ),
                  ),
                  height: 190,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: FadeInImage(
                      placeholder: AssetImage('assets/fadeIn.jpg'),
                      image: NetworkImage(widget.petInfo.toMap()['avatar']),
                      height: 1000,
                      width: 1000,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                      border: Border.all(
                          style: BorderStyle.solid, color: Colors.grey)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: width - 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.petInfo.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                        fontSize: 25),
                              ),
                              SizedBox(height: 10),
                              Text(
                                widget.petInfo.breed,
                              ),
                              SizedBox(height: 10),
                              StreamBuilder(
                                  stream: UserController().getUserSnapshot(
                                      widget.petInfo.ownerReference),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                            ConnectionState.waiting ||
                                        snapshot.data == null) {
                                      return Text('');
                                    }

                                    String announcerName = snapshot.data
                                                .data()['uid'] ==
                                            userProvider.uid
                                        ? 'Você'
                                        : snapshot.data.data()['displayName'];
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '$announcerName está ${widget.kind.toUpperCase() == 'DONATE' ? 'doando' : 'procurando'}.',
                                          textAlign: TextAlign.left,
                                          overflow: TextOverflow.fade,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1
                                              .copyWith(
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black,
                                              ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 16.0, bottom: 2.0),
                                          child: Row(
                                            children: [
                                              Icon(Tiutiu.eye,
                                                  size: 14, color: Colors.grey),
                                              Text(
                                                  '  ${widget.petInfo.views ?? 1} visualizações',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.w700)),
                                              SizedBox(width: 30),
                                              Icon(
                                                  widget.petInfo.kind ==
                                                          'Donate'
                                                      ? Icons.favorite
                                                      : Icons.info,
                                                  size: 14,
                                                  color: Colors.grey),
                                              StreamBuilder(
                                                  stream: PetsProvider()
                                                      .loadInfoOrInterested(
                                                          kind: widget
                                                              .petInfo.kind,
                                                          petReference: widget
                                                              .petInfo
                                                              .petReference),
                                                  builder: (context, snapshot) {
                                                    return Text(
                                                        '  ${snapshot.data?.docs?.length ?? 0} ${widget.petInfo.kind == 'Donate' ? 'interessados' : 'informações'}',
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700));
                                                  }),
                                            ],
                                          ),
                                        )
                                      ],
                                    );
                                  }),
                            ],
                          ),
                        ),
                        Spacer(),
                        Column(
                          children: [
                            IconButton(
                              icon: widget.favorite
                                  ? Icon(
                                      favoritesProvider.getFavoritesPETSIDList
                                              .contains(
                                                  widget.petInfo.toMap()['id'])
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      size: 40,
                                      color: Colors.red,
                                    )
                                  : Icon(Tiutiu.location_arrow,
                                      size: 25,
                                      color: Theme.of(context).primaryColor),
                              onPressed: !widget.favorite
                                  ? null
                                  : () {
                                      if (favoritesProvider
                                          .getFavoritesPETSIDList
                                          .contains(
                                              widget.petInfo.toMap()['id'])) {
                                        user.favorite(
                                            userProvider.userReference,
                                            widget.petInfo
                                                .toMap()['petReference'],
                                            false);
                                        favoritesProvider.handleFavorite(
                                            widget.petInfo.toMap()['id']);
                                      } else {
                                        user.favorite(
                                            userProvider.userReference,
                                            widget.petInfo
                                                .toMap()['petReference'],
                                            true);
                                        favoritesProvider
                                            .loadFavoritesReference();
                                        favoritesProvider.handleFavorite(
                                            widget.petInfo.toMap()['id']);
                                      }
                                    },
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 7.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        '${distanceText[0]}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1
                                            .copyWith(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
