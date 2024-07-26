import 'package:flutter/material.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';

import '../models/source_response.dart';

class NewsScreen extends StatefulWidget {
  List<Sources> sources = [];

  NewsScreen({super.key, required this.sources});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sources.length,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TabBar(
                dividerColor: Colors.transparent,
                  onTap: (value) {
                    index = value;
                    setState(() {});
                  },
                  indicator: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  tabs: widget.sources
                      .map((e) => Container(
                            padding: EdgeInsets.all(8),
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.green),
                                borderRadius: BorderRadius.circular(20)),
                            child: Tab(
                              text: e.name,
                            ),
                          ))
                      .toList()),
            )),
        SizedBox(height: 20,),
        FutureBuilder(
            future: ApiManager.getNewsData(widget.sources[index].id ?? ''),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Something Went Wrong'));
              }
              var articleslist = snapshot.data?.articles ?? [];
              if (articleslist.isEmpty) {
                return Center(child: Text('No Articles'));
              }
              return Expanded(
                child: ListView.separated(
                  separatorBuilder:  (context, index) {
                    return Divider();
                  },
                  itemBuilder: (context, index) {
                    return Text(articleslist[index].title ?? '');
                  },
                  itemCount: articleslist.length,
                ),
              );
            })
      ],
    );
  }
}
