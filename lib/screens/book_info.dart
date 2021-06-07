import 'package:book_app/widgets/book_info_form.dart';
import 'package:flutter/material.dart';

class BookInfoOne extends StatefulWidget {
  static const routeName = './book_info';
  @override
  _BookInfoOneState createState() => _BookInfoOneState();
}

class _BookInfoOneState extends State<BookInfoOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Tell us more!'),
      ),
      body: BookInfoForm(),
      // bottomNavigationBar: BottomButton(
      //   'Next',
      //   () {},
      //   Icons.arrow_forward,
      // ),
    );
  }
}
