import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:tiutiu/Widgets/popup_message.dart';
import 'package:tiutiu/providers/auth2.dart';
import 'package:tiutiu/providers/user_provider.dart';
import 'package:tiutiu/screen/my_account.dart';
import 'package:tiutiu/screen/pets_list.dart';
import '../Widgets/floating_button_option.dart';
import '../utils/routes.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final ACTIVED_COLOR = Color(0XFF32CD32);
  final DESACTIVED_COLOR = Color(0XFF808080);

  UserProvider userProvider;
  Authentication auth;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    userProvider = Provider.of<UserProvider>(context, listen: false);
    auth = Provider.of<Authentication>(context, listen: false);
    setUserMetaData();
    super.didChangeDependencies();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<bool> leaveApplication() async {
    var answer = false;
    return showDialog(
      context: context,
      builder: (_) => Consumer<Authentication>(
        builder: (context, auth, child) {
          return PopUpMessage(
            title: 'Logout',
            message: 'Deseja realmente sair?',
            confirmAction: () {
              setState(() {
                answer = true;
              });
              Navigator.pop(context);
              auth.signOut();
            },
            confirmText: 'Sim',
            denyAction: () {
              Navigator.pop(context);
            },
            denyText: 'Não',
          );
        },
      ),
    ).then((value) {
      print('Answer: $answer');
      return answer;
    });
  }

  void setUserMetaData() async {
    final CollectionReference usersEntrepreneur =
        FirebaseFirestore.instance.collection('Users');
    DocumentSnapshot doc =
        await usersEntrepreneur.doc(auth.firebaseUser.uid).get();

    userProvider.changeUserReference(doc.reference);
    userProvider.changePhotoUrl(doc.data()['photoURL']);
    userProvider.changeWhatsapp(doc.data()['phoneNumber']);
    userProvider.changeDisplayName(doc.data()['displayName']);
    userProvider.changeTelefone(doc.data()['landline']);
    userProvider.changeBetterContact(doc.data()['betterContact']);
  }

  @override
  Widget build(BuildContext context) {
    var _screens = <Widget>[PetsList(), MyAccount()];

    // var iconsChildren = [
    //   Column(
    //     children: <Widget>[
    //       IconButton(
    //         color: _selectedIndex == 0 ? ACTIVED_COLOR : DESACTIVED_COLOR,
    //         icon: Icon(Icons.menu),
    //         onPressed: () {
    //           _onItemTapped(0);
    //         },
    //       ),
    //       Text('P/ Adoção',
    //           style: TextStyle(
    //             color: _selectedIndex == 0 ? ACTIVED_COLOR : DESACTIVED_COLOR,
    //           ))
    //     ],
    //   ),
    //   Column(
    //     children: <Widget>[
    //       IconButton(
    //         color: _selectedIndex == 1 ? ACTIVED_COLOR : DESACTIVED_COLOR,
    //         icon: Icon(Icons.assignment_late),
    //         onPressed: () {
    //           _onItemTapped(1);
    //         },
    //       ),
    //       Text('Desaparecidos',
    //           style: TextStyle(
    //             color: _selectedIndex == 1 ? ACTIVED_COLOR : DESACTIVED_COLOR,
    //           ))
    //     ],
    //   ),
    // ];

    return WillPopScope(
      onWillPop: leaveApplication,
      child: Scaffold(
        backgroundColor: Colors.greenAccent,
        body:
            // FutureBuilder(
            //     future: Provider.of<Location>(context, listen: false).setLocation(),
            //     builder: (_, AsyncSnapshot snapshot) {
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return LoadingPage();
            //       }
            //       return
            Center(
          child: _screens.elementAt(_selectedIndex),
        ),
        // }),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.blueGrey,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              title: Text('PETS'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('Minha Conta'),
            )
          ],          
        ),
        floatingActionButton: _selectedIndex == 1 ? null : SpeedDial(
          marginRight: 18,
          marginBottom: 20,
          animatedIcon: AnimatedIcons.add_event,
          animatedIconTheme: IconThemeData(size: 22.0),
          visible: MediaQuery.of(context).orientation == Orientation.portrait,
          closeManually: false,
          curve: Curves.bounceIn,
          overlayOpacity: 0.5,
          onOpen: () {
            print('OPENING DIAL');
          },
          onClose: () {
            print('DIAL CLOSED');
          },
          tooltip: 'Adicionar PET',
          heroTag: 'speed-dial-hero-tag',
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
          elevation: 8.0,
          shape: CircleBorder(),
          children: [
            SpeedDialChild(
              child: FloatingButtonOption(image: 'assets/dogCat2.png'),
              label: 'Adicionar Desaparecido',
              backgroundColor: Theme.of(context).accentColor,
              labelStyle: TextStyle(fontSize: 14.0),
              onTap: () {
                Navigator.pushNamed(context, Routes.CHOOSE_LOCATION,
                    arguments: {'kind': 'Disappeared'});
              },
            ),
            SpeedDialChild(
              child: FloatingButtonOption(image: 'assets/pata2.jpg'),
              label: 'Doar PET',
              backgroundColor: Theme.of(context).primaryColor,
              labelStyle: TextStyle(fontSize: 14.0),
              onTap: () {
                Navigator.pushNamed(context, Routes.CHOOSE_LOCATION,
                    arguments: {'kind': 'Donate'});
              },
            ),
          ],
        ),
      ),
    );
  }
}
