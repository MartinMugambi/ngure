import 'package:book_app/models/categories.dart';
import 'package:book_app/widgets/add.dart';
import 'package:flutter/material.dart';

class AddBook extends StatefulWidget {
  @override
  _AddBookState createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sell a book',
          style: TextStyle(
            fontFamily: 'Poppins-Regular',
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select the type of book you want to sell',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.grey[700],
                fontFamily: 'Poppins',
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: Categories.categories.length,
                itemBuilder: (context, index) {
                  return CategoryItem(index);
                },
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
