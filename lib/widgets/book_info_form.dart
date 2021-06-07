import 'package:book_app/provider/ad_provider.dart';
import 'package:book_app/screens/add_image.dart';
import 'package:book_app/services/auth_services.dart';
import 'package:book_app/widgets/bottom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookInfoForm extends StatefulWidget {
  @override
  _BookInfoFormState createState() => _BookInfoFormState();
}

class _BookInfoFormState extends State<BookInfoForm> {
  final _formKey = GlobalKey<FormState>();
  String _title;
  String _desc;
  String _author;
  Map<String, String> sliderValueMap = {
    '0': 'Ughh',
    '25': 'Managable',
    '50': 'Good',
    '75': 'Rarely used',
    '100': 'Brand New',
  };
  var sliderValue = 50.0;
  //var textController = TextEditingController();
  var counterText = 0;
  var isLogin = true;

  // void trySubmit() {
  //   final isValidate = _formKey.currentState.validate();
  //   //to remove soft keyboard after submitting
  //   FocusScope.of(context).unfocus();
  //   if (isValidate) {
  //     _formKey.currentState.save();
  //     // Provider.of<AdProvider>(
  //     //   context,
  //     //   listen: false,
  //     // ).addTitleAndStuff(
  //     //   title,
  //     //   desc,
  //     //   author,
  //     //   sliderValueMap[sliderValue.toInt().toString()],
  //     // );
  //     //Navigator.of(context).pushNamed(AddingImagesScreen.routeName);
  //   }
  // }

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      AuthService.add(context, _title, _author, _desc);
    }
  }

  Widget counter(
    BuildContext context, {
    int currentLength,
    int maxLength,
    bool isFocused,
  }) {
    return Text(
      '$currentLength/$maxLength',
      style: TextStyle(
        color: Colors.grey,
      ),
      semanticsLabel: 'character count',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Enter Title',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        validator: (title) =>
                            title.trim().isEmpty ? 'Enter Book Title' : null,
                        onSaved: (title) => _title = title,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Author',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 13.0,
                              fontFamily: 'Poppins-Regular',
                            ),
                          ),
                          validator: (author) => author.length < 6
                              ? "Must be atleast six characters"
                              : null,
                          onSaved: (author) => _author = author),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelText: 'Description',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 13.0,
                            fontFamily: 'Poppins-Regular',
                          ),
                        ),
                        validator: (desc) => desc.length < 6
                            ? "Must be atleast six characters"
                            : null,
                        onSaved: (desc) => _desc = desc,
                        maxLength: 100,
                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Select the condition of book',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                    Slider.adaptive(
                      value: sliderValue,
                      min: 0,
                      max: 100,
                      divisions: 4,
                      label: sliderValueMap[sliderValue.toInt().toString()],
                      onChanged: (value) {
                        setState(() {
                          sliderValue = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 340.0,
          height: 45.0,
          child: FlatButton(
              onPressed: () {
                _submit();
              },
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Next',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins-Regular',
                  fontSize: 17.0,
                ),
              )),
        ),
      ],
    );
  }
}
