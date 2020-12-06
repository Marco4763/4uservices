import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:uservices/ui/pages/agenda.page.dart';
import 'package:uservices/ui/pages/favorites.page.dart';
import 'package:uservices/ui/pages/home.page.dart';
import 'package:uservices/ui/pages/profile.page.dart';
import 'package:uservices/ui/pages/serviceprovider/service.provider.home.page.dart';
import 'package:uservices/ui/pages/serviceprovider/service.provider.worker.page.dart';

class ServiceMenuPage extends StatefulWidget {
  ServiceMenuPage({Key key, this.profile}) : super (key : key);
  final dynamic profile;
  @override
  _ServiceMenuPageState createState() => _ServiceMenuPageState();
}

class _ServiceMenuPageState extends State<ServiceMenuPage> with TickerProviderStateMixin {
  KFDrawerController _drawerController;

  @override
  void initState() {
    super.initState();
    _drawerController = KFDrawerController(
      initialPage: ServiceProviderHomePage(),
      items: [
        KFDrawerItem(
          text: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.person_pin, size: 100,),
              ),
              Text(widget.profile.data[0].nome,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "ExtraBold",
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            "Menu",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "SemiBold",
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
          icon: Icon(
            CupertinoIcons.home,
            color: Colors.white,
          ),
          page: ServiceProviderHomePage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            "Funcionario",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "SemiBold",
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
          icon: Icon(
            CupertinoIcons.person_alt_circle,
            color: Colors.white,
          ),
          page: ServiceProviderWorkerPage(id: widget.profile.data[0].objectId,),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            "Agenda",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "SemiBold",
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
          icon: Icon(
            CupertinoIcons.calendar,
            color: Colors.white,
          ),
          page: AgendaPage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            "Favoritos",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "SemiBold",
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
          icon: Icon(
            CupertinoIcons.suit_heart,
            color: Colors.white,
          ),
          page: FavoritesPage(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KFDrawer(
        controller: _drawerController,
        header: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            width: MediaQuery.of(context).size.width * 0.6,
            child: Image.asset(
              'assets/images/logo.png',
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
        footer: KFDrawerItem(
          text: Text(
            "Terminar Sessão",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Bold",
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.of(context).push(CupertinoPageRoute(
              fullscreenDialog: true,
              builder: (BuildContext context) {
                return ServiceMenuPage();
              },
            ));
          },
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.orange,
              Colors.deepOrange,
            ],
            tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }
}
