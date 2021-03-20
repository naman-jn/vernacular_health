import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vernacular_health/animator.dart';
import 'package:vernacular_health/data/content.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Map content = Content().getContentLanguage();
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[100],
          body: Column(
            children: [
              Material(
                child: Container(
                  width: width,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.indigo[700],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 18.0, left: 20.0),
                        child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            )),
                      ),
                      Flexible(
                        child: Text(
                          content['heading'],
                          style: TextStyle(fontSize: 21.0, color: Colors.white),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      DetailTile(
                        text: content['what']['title'],
                        content: content['what']['body'],
                      ),
                      DetailTile(
                        text: content['stats']['title'],
                        content: content['stats']['body'],
                      ),
                      DetailTile(
                        text: content['causes']['title'],
                        content: content['causes']['body'],
                      ),
                      DetailTile(
                        text: content['genetic']['title'],
                        content: content['genetic']['body'],
                      ),
                      DetailTile(
                        text: content['treatments']['title'],
                        content: content['treatments']['body'],
                      ),
                      DetailTile(
                        text: content['outlook']['title'],
                        content: content['outlook']['body'],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class DetailTile extends StatelessWidget {
  final String text;
  final String content;
  const DetailTile({Key key, @required this.text, @required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(
      dividerColor: Colors.transparent,
      accentColor: Colors.indigo,
      unselectedWidgetColor: Colors.indigo,
    );
    return WidgetAnimator(
      Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        padding: EdgeInsets.only(right: 7),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Theme(
          data: theme,
          child: ExpansionTile(
            tilePadding: EdgeInsets.zero,
            title: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 16,
                    ),
                    Flexible(
                        child: Text(
                      "$text",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.indigo,
                          fontWeight: FontWeight.w600),
                    )),
                  ],
                )),
            children: [
              Column(
                children: [
                  Container(
                    color: Colors.indigo,
                    height: 1,
                    width: 270,
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 10, right: 5, bottom: 5, top: 15),
                    child: Text(
                      content,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 14, color: Colors.black.withOpacity(0.7)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
