import 'package:book_app/screens/my_post.dart';
import 'package:book_app/tabs_screen.dart/home_tab.dart';
import 'package:flutter/material.dart';

class AdsScreen extends StatefulWidget {
  @override
  _AdsScreenState createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Ads Screen',
            style: TextStyle(
              fontFamily: 'Poppins-Regular',
            ),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'My Post',
              ),
              Tab(
                text: 'Sold Books',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MyPost(),
            Icon(Icons.directions_transit),
          ],
        ),
      ),
    );
  }
}
