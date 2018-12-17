//https://medium.com/@tonyowen/flutter-pageview-zoom-transition-98c380632b2d

import 'dart:math';
import 'package:flutter/material.dart';


const double SCALE_FRACTION = 0.7;
const double FULL_SCALE = 1.0;
const double PAGER_HEIGHT = 200.0;

class SectionPage extends StatefulWidget {
  @override
  _SectionsPageState createState() => _SectionsPageState();
}

class _SectionsPageState extends State<SectionPage> {

  double viewPortFraction = 0.5;
  
  PageController pageController;
  
  int currentPage = 2;
  
  List<String> listOfSections = <String>[
    'Test1', 'Test2', 'Test3'
  ];
  
  double page = 2.0;
  
  @override
  void initState() {
    pageController = PageController(initialPage: currentPage, 
        viewportFraction: viewPortFraction);
    super.initState();
  }

@override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        const SizedBox(height: PAGER_HEIGHT,),
        Container(
          height: PAGER_HEIGHT,
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification){
              if (notification is ScrollUpdateNotification) {
                setState(() {
                  page = pageController.page;
                });
              }
            },
              child: PageView.builder(
                onPageChanged: (int pos) {
                  setState(() {
                    currentPage = pos;
                  });
                },
                  physics: const BouncingScrollPhysics(),
                  controller: pageController,
                  itemCount: listOfSections.length,
                  itemBuilder: (BuildContext context, int index) {
                    final double scale =  max(SCALE_FRACTION, (FULL_SCALE - (index - page).abs()) + viewPortFraction);
                    return circleOffer(listOfSections[index], scale);
                  })),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(listOfSections[currentPage],
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20),),
        )

      ],
    );
  }

  Widget circleOffer(String text, double scale) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: const EdgeInsets.all(1),
        height: PAGER_HEIGHT * scale,
        width: PAGER_HEIGHT * scale,
        child: Card(
          elevation: 4,
          clipBehavior: Clip.antiAlias,
          shape: CircleBorder(side: BorderSide(color: Colors.grey.shade200,
              width: 5)),
          child: Align(
            alignment: Alignment.center,
            child : Text(text + ' 45',
          style: const TextStyle(fontSize: 20),),
        ),
        ),
      ),
    );
  }
}
