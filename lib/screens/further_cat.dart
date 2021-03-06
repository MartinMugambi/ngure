import 'package:book_app/models/categories.dart';
import 'package:book_app/provider/ad_provider.dart';
import 'package:book_app/screens/book_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FurtherCat extends StatelessWidget {
  static const routeName = './further_cat';

  @override
  Widget build(BuildContext context) {
    final index = ModalRoute.of(context).settings.arguments as int;
    final cats = Categories.categories[index];

    return Scaffold(
      appBar: AppBar(
        title: Text(Categories.categories[index]['category']),
      ),
      body: ListView.builder(
        itemCount: cats['further'].length,
        itemBuilder: (context, i) {
          return Column(
            children: [
              ListTile(
                onTap: () {
                  //Categories.addCategory(cats['further'][i]);
                  Navigator.of(context).pushNamed(
                    BookInfoOne.routeName,
                  );
                },
                title: Text(
                  cats['further'][i],
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Divider(),
              ),
            ],
          );
        },
      ),
    );
  }
}
