import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImageDetail extends StatefulWidget {
  final String gambarrr;
  final String text;
  ImageDetail({Key key, this.gambarrr, this.text}) : super(key: key);

  @override
  _ImageDetailState createState() => _ImageDetailState(gambarrr, text);
}

class _ImageDetailState extends State<ImageDetail> {
  String gambarrr;
  String text;
  _ImageDetailState(this.gambarrr, this.text);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Image Detail"),
        ),
        body: Column(
          children: <Widget>[Image.asset("$gambarrr"), Text("$text")],
        ));
  }
}
