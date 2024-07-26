import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/source_response.dart';

import '../../../models/NewsResponse.dart';

class ApiManager{

 static Future<SourceResponse> getsources() async{
    //https://newsapi.org/v2/top-headlines/sources?apiKey=3962fa875afa47ed8cae1092ccae47e1
    Uri url=Uri.https('newsapi.org', //base url
    '/v2/top-headlines/sources',     //end point
      // {'apiKey':'3962fa875afa47ed8cae1092ccae47e1'}  //parameters  as map
    );
    http.Response response=await http.get(url,headers:  {'X-Api-Key':'3962fa875afa47ed8cae1092ccae47e1'});
    // string to json
    Map<String,dynamic> json = jsonDecode(response.body);
   return SourceResponse.fromJson(json);
  }
 static Future<NewsResponse>getNewsData(String sourceId)async{
   
   Uri url =Uri.https('newsapi.org','/v2/everything',
       {'sources':sourceId}  );
   http.Response response=await http.get(url,headers:  {'X-Api-Key':'3962fa875afa47ed8cae1092ccae47e1'});
   Map<String,dynamic> json = jsonDecode(response.body);
   return NewsResponse.fromJson(json);
  }
}