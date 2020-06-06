import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'home.dart';

class ImageLibrary extends StatefulWidget {
  @override
  _ImageState createState() => _ImageState();
}

class _ImageState extends State<ImageLibrary> {
  List<String> gambar = [
    "images/gambar1.png",
    "images/gambar2.jpg",
    "images/gambar3.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Image Library"),
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
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text("Image Library"),
                selected: true,
                onTap: () {
                  Navigator.pop(context);
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
                onTap: () {},
              ),
            ],
          ),
        ),
        body: GridView.builder(
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
                onTap: () {
                  return showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Image(
                            image: AssetImage(gambar[index]),
                          ),
                        );
                      });
                },
                child: Card(
                    elevation: 7.0,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(gambar[index]),
                              fit: BoxFit.fill)),
                    )));
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
        ));
  }
}
