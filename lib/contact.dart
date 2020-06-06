import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_launch/flutter_launch.dart';

class Contact extends StatefulWidget{
  @override 
  _ContactState createState() =>_ContactState();
}

class _ContactState extends State<Contact> {
List<String>nama=['Ubay', 
                  'rafly', 
                  'amri', 
                  'sinta', 
                  'faizal', 
                  'Asep', 
                  'Maulana', 
                  'Abror', 
                  'fahmi', 
                  'frans'];
List<String>nomor=['+62 388857234',
                   '+62 81218860714', 
                   '+62 99689998321', 
                   '+62 83819000500', 
                   '+62 8119571927', 
                   '+62 85861539820',
                   '+62 8571886971',
                   '+62 82191311900' ];
@override
launchTelp(String _nomors) async{
  String  url='tel:$_nomors';
  if(await canLaunch(url)){
    await launch (url)
  }else{
    throw 'could not launch $url';
  }
}
launchSms(String _nomors) async{
  String  url='sms:$_nomors';
  if(await canLaunch(url)){
    await launch (url)
  }else{
    throw 'could not launch $url';
  }
}

_launchWA(String _nomor) async{
    await FlutterLaunch.launchWathsApp(phone: "$_nomors", message: "Hello Zheyenk");
}
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            title: Text("Contact"),
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('image/image1.jpg',
              fit: BoxFit.fill,
              ),
            ),
          ),
          SliverList(
            String: _nomor= (nomor['index']),
            String: _nama= (nomor['index']),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.25,
                  child: ListTile( 
                          title: Text("Mahmud"),
                          trailing: Icon(Icons.people),
                        );,
                )
                Action:<Widget>[
                  IconSlideAction(
                      caption: 'Call',
                      color:Colors.grey
                      icon: Icons.call,
                      onTap<>{
                        launchTelp(_nomor)
                      },
                  ),
                  IconSlideAction(
                      caption: 'Message',
                      color:Colors.grey
                      icon: Icons.message,
                      onTap<>{},
                  )
                ],
                secondaryAction <widget>[
                  IconSlideAction(
                      caption: 'Whatsapp',
                      color:Colors.grey
                      icon: Icons.call,
                      onTap<>{ _launchWA(_nomor)},
                  ),
                  IconSlideAction(
                      caption: 'Email',
                      color:Colors.grey
                      icon: Icons.call,
                      onTap<>{},
                  )
                ]
              }, childCount: nomor.length,
            ),
          )
        ]
      )
    );
  }
}