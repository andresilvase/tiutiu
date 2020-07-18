import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiutiu/providers/auth.dart';
import 'package:tiutiu/screen/auth_screen.dart';
import 'package:tiutiu/screen/home.dart';

class AuthOrHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 
    return Consumer<Auth>(
      builder: (context, auth, child) {
        return FutureBuilder(
          future: auth.tryLogin(),
          builder: (_, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Center(child: Text("Ocorreu um erro! ${snapshot.error}"));
            } else {
              return auth.isAuth ? Home() : AuthScreen();
            }
          },
        );
      },
    );
  }
}
