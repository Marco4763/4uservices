import 'package:flutter/material.dart';

class CategoryAdapter extends StatefulWidget {
  final String linkUrl, title;

  const CategoryAdapter({
    Key key,
    this.linkUrl,
    this.title,
  }) : super(key: key);

  @override
  _CategoryAdapterState createState() => _CategoryAdapterState();
}

class _CategoryAdapterState extends State<CategoryAdapter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      margin: EdgeInsets.all(0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Image(
                fit: BoxFit.scaleDown,
                image: NetworkImage("${widget.linkUrl}"),
              ),
            ),
          ),
          Text(
            '${widget.title}',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.black,
              fontFamily: "RubrikMedium",
              fontSize: 10.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
