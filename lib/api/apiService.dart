import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  Future<Map<String, dynamic>> getCancerNews() async {
    String apiKey = 'f80bc951ef2349e8af475682ccfec00f';
    Map<String, dynamic> newsArticles;
    try {
      String url =
          "https://newsapi.org/v2/everything?qinTitle=cancer&sources=the-hindu,techcrunch,news24,cbs-news&sortBy=publishedAt&apiKey=$apiKey";
      http.Response r = await http.get(url);
      newsArticles = jsonDecode(r.body);
    } catch (e) {
      print("error $e");
    }
    print(newsArticles['articles']);

    return newsArticles;
  }
}
