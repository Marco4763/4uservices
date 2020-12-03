import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';

class ServicesPage extends KFDrawerContent {
  ServicesPage({
    Key key,
  });
  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            widget.onMenuPressed();
          },
        ),
        title: Text(
          "Serviços",
        ),
      ),
    );
  }
}

