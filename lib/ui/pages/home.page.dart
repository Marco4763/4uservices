import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';

class HomePage extends KFDrawerContent {
  HomePage({
    Key key,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.square_grid_2x2),
          onPressed: () {
            widget.onMenuPressed( );
          },
        ),
        title: Text(
          "4uServices",
        ),
      ),
    );
  }
}
