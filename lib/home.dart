import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project2/imagedetail.dart';
import 'package:project2/imagelibrary.dart';
import 'contact.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String gambar1 = "images/gambar1.png";
  List<String> gambar = [
    "images/gambar1.png",
    "images/gambar2.jpg",
    "images/gambar3.jpg"
  ];

  void updateBackground(int index) {
    setState(() {
      if (gambar1.isNotEmpty) {
        gambar1 = gambar[index];
        return gambar1;
      } else {
        return 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Home",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.blue,
                height: 200,
                child: ListView(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: CircleAvatar(
                          child: Icon(Icons.people),
                          backgroundColor: Colors.white,
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "Your Name",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                selected: true,
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text("Image Library"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ImageLibrary()));
                },
              ),
              ListTile(
                leading: Icon(Icons.video_library),
                title: Text("Video Library"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.contacts),
                title: Text("Contacts"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>Contact()
                    ));
                },
              ),
            ],
          ),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Card(
                  elevation: 7.0,
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.people),
                    ),
                    title: Text(
                      "Mahmud",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("Designer"),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: gambar.length,
                itemBuilder: (BuildContext context, int index) {
                  String gambarr = gambar[index];
                  String text = "Halo";
                  return InkWell(
                      onTap: () {
                        updateBackground(index);
                      },
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Card(
                              elevation: 7.0,
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(gambar[index]))),
                                width: 250,
                                child: Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    children: <Widget>[
                                      CircleAvatar(
                                        child: Icon(Icons.image),
                                      )
                                    ],
                                  ),
                                ),
                              ))));
                },
              ))
            ],
          ),
        ));
  }
}
