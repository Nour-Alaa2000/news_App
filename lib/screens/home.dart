import 'package:flutter/material.dart';
import 'package:news_app/screens/news.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';

import 'home_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = 'Home';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
        image: DecorationImage(image: AssetImage('assets/images/pattern.png'),fit: BoxFit.fill)
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
        drawer: HomeDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          shape: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              )),
          title: Text(
            'News App',
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: FutureBuilder(
          future: ApiManager.getsources(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Something Went Wrong'));
            }
            var sourceslist = snapshot.data?.sources ?? [];
            if (sourceslist.isEmpty) {
              return Center(child: Text('no sources'));
            }
            return NewsScreen(sources:sourceslist,);
          },
        ),
      ),
    );
  }
}
