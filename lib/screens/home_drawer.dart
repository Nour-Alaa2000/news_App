import 'package:flutter/material.dart';
import 'package:news_app/screens/home.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Text('News App ',style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
              textAlign:TextAlign.center,),
            ),
          ),
          SizedBox(height: 20,),
          InkWell(
            onTap:() {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
            child: Row(
              children: [
                Icon(Icons.list,color: Colors.black,
                    size: 30,),
                SizedBox(width: 20),
                Text('Categories',style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),)
              ],
            ),
          ),
          SizedBox(height: 10,),
          InkWell(
            onTap:() {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
            child: Row(
              children: [
                Icon(Icons.settings,color: Colors.black,
                  size: 30,),
                SizedBox(width: 20),
                Text('Setting',style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
