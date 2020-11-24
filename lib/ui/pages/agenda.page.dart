import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';

class AgendaPage extends KFDrawerContent {
  AgendaPage({
    Key key,
  });

  @override
  _AgendaPageState createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
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
          "Agenda",
        ),
      ),
    );
  }
}
