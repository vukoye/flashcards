//https://medium.com/@tonyowen/flutter-pageview-zoom-transition-98c380632b2d

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flashcards/data/section.dart';

const double SCALE_FRACTION = 0.7;
const double FULL_SCALE = 1.0;
const double PAGER_HEIGHT = 300.0;
const double PAGER_WIDTH = 150.0;

class SectionPage extends StatefulWidget {
  @override
  _SectionsPageState createState() => _SectionsPageState();
}

class _SectionsPageState extends State<SectionPage> {

  double viewPortFraction = 0.8;

  PageController pageController;

  int currentPage = 0;

//  List<String> listOfSections3 = <String>[
//    'Test1', 'Test2', 'Test3'
//  ];

  List<Section> listOfSections = <Section>[
    Section(name: 'Section 1',
        color: Colors.green[200].value,
        tags: <String>['Tag1', 'Tag2']),
    Section(name: 'Section 2', color: Colors.red[200].value, tags:
    <String>['Tag1', 'Tag2']),
    Section(name: 'Section 3', color: Colors.blue[200].value, tags:
    <String>['Tag1', 'Tag2']),

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
        Container(
          height: 450,
          child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification) {
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
                    final double scale = max(SCALE_FRACTION,
                        (FULL_SCALE - (index - page).abs()) + viewPortFraction);
                    return createSectionCard(listOfSections[index], scale);
                  })
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(listOfSections[currentPage].name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20),),
        )

      ],
    );
  }


  Widget createSectionCard(Section section, double scale) {
    return Align(
        alignment: Alignment.center,
        child: Transform.scale(
          scale: scale,
            child: Container(
              margin: const EdgeInsets.all(1),
              height: PAGER_HEIGHT,
              width: PAGER_WIDTH,
              child: Card(
                  color: Color(section.color),
                  elevation: 4,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                      Text(section.name),
                  Wrap(
                      spacing: 8,
                      runSpacing: 4.0,
                      children: List < Widget>.generate(section.tags.length, (
                      int
                      index) {
                    return Chip(

                      label: Text(section.tags[index]),
                    );
                  })
              )

              ],
            )
        )
    ),)
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
            child: Text(text + ' 45',
              style: const TextStyle(fontSize: 20),),
          ),
        ),
      ),
    );
  }
}
