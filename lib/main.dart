

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}
var tstyle = TextStyle(color: Colors.white.withOpacity(0.6),
    fontSize: 50
);
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var padding = EdgeInsets.symmetric(horizontal: 18,vertical: 5);
  double gap =10;

 int _index = 0;
  List<Color> colors = [
    Colors.purple,
    Colors.pink,
    Colors.grey[600],
    Colors.teal
  ];

  List<Text> text = [
    Text('Home', style:tstyle ),
    Text('Like',style: tstyle,),
    Text('Search',style: tstyle,),
    Text('User',style: tstyle,),
  ];
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        appBar: AppBar(
          brightness: Brightness.light,
          title: Text(
            'GoogleNavBar',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body:PageView.builder(
          itemCount: 4,
            controller: controller,
            onPageChanged: (page){
              setState(() {
                _index= page;
              });
            },
            itemBuilder:(context,position){
              return Container(
                color: colors[position],
                child:Center(child: text[position]),
              );
            }),
        bottomNavigationBar: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(100)),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: -10,
                    blurRadius: 60,
                    color: Colors.black.withOpacity(0.4),
                    offset: Offset(0,25),
                  )
                ]
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3,vertical: 3),
              child: GNav(
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 900),
                tabs: [
                  GButton(
                    gap: gap,
                    icon: LineIcons.home,
                    iconColor: Colors.black,
                    iconActiveColor: Colors.purple,
                    text: 'Home',
                    textColor: Colors.purple,
                    backgroundColor: Colors.purple.withOpacity(0.2),
                    iconSize: 24,
                    padding: padding,
                  ),
                  GButton(
                    gap: gap,
                    icon: LineIcons.heart_o,
                    iconColor: Colors.black,
                    iconActiveColor: Colors.pink,
                    text: 'Like',
                    textColor: Colors.pink,
                    backgroundColor: Colors.pink.withOpacity(0.2),
                    iconSize: 24,
                    padding: padding,
                  ),
                  GButton(
                    gap: gap,
                    icon: LineIcons.search,
                    iconColor: Colors.black,
                    iconActiveColor: Colors.grey,
                    text: 'Search',
                    textColor: Colors.grey,
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    iconSize: 24,
                    padding: padding,
                  ),
                  GButton(
                    gap: gap,
                    icon: LineIcons.user,
                    iconColor: Colors.black,
                    iconActiveColor: Colors.teal,
                    text: 'Home',
                    textColor: Colors.teal,
                    backgroundColor: Colors.teal.withOpacity(0.2),
                    iconSize: 24,
                    padding: padding,
                  ),
                ],
                selectedIndex: _index,
                onTabChange: (index){
                  setState(() {
                    _index =index;
                  });
                  controller.jumpToPage(index);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}


