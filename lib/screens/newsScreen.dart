import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../api/apiService.dart';
import 'package:intl/intl.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen({Key key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List articles;
  double screenHeight;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: FutureBuilder(
              future: ApiService().getCancerNews(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  articles = snapshot.data['articles'];
                  return Container(
                      padding: EdgeInsets.all(7),
                      height: screenHeight,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  icon: Icon(
                                    Icons.arrow_back,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }),
                              Text(
                                'Latest Updates',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: ListView.builder(
                                itemCount: articles.length,
                                itemBuilder: (context, index) {
                                  var article = articles[index];
                                  String date = article['publishedAt']
                                      .toString()
                                      .substring(0, 10);
                                  date = DateFormat.yMMMMd()
                                      .format(DateTime.parse(date));
                                  return InkWell(
                                    onTap: () {
                                      launch(article['url']);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 5),
                                      child: Row(
                                        children: [
                                          if (article['urlToImage'] != null)
                                            Container(
                                              width: 70,
                                              height: 70,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                      article['urlToImage'],
                                                    ),
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  article['title'],
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  date,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ));
                } else
                  return Center(
                    child: CircularProgressIndicator(),
                  );
              }),
        ),
      ),
    );
  }
}
