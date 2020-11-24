import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';

class FavoritesPage extends KFDrawerContent {
  FavoritesPage({
    Key key,
  });

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            widget.onMenuPressed( );
          },
        ),
        title: Text(
          "Favoritos",
        ),
      ),
    );
  }
}
