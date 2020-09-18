import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:provider/provider.dart';
import 'package:tiutiu/Widgets/background.dart';
import 'package:tiutiu/Widgets/card_list.dart';
import 'package:tiutiu/providers/favorites_provider.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  FavoritesProvider favoritesProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    favoritesProvider = Provider.of(context, listen: false);
    favoritesProvider.loadFavoritesReference();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: Text(
          'Favoritos',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => favoritesProvider.loadFavoritesReference(),
        child: Stack(
          children: [
            Background(),
            Container(
              child: StreamBuilder(
                stream: favoritesProvider.favoritesPETSList,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LoadingBumpingLine.circle(
                            backgroundColor: Colors.black,
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Carregando favoritos',
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                .copyWith(color: Colors.black),
                          )
                        ],
                      ),
                    );
                  }
                  if (snapshot.data.isEmpty) {
                    return Center(
                      child: Text(
                        'Nenhum PET Favoritado',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline1.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w100,
                            ),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (_, index) {
                      return CardList(
                        petInfo: snapshot.data[index],
                        kind: snapshot.data[index].kind,
                        favorite: true,
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
