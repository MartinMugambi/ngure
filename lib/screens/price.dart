import 'package:book_app/screens/home_screen.dart';
import 'package:book_app/screens/map_screen.dart';
import 'package:book_app/tabs_screen.dart/home_tab.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Price extends StatefulWidget {
  static final String id = "price";
  @override
  _PriceState createState() => _PriceState();
}

class _PriceState extends State<Price> {
  LatLng _initialcameraposition = LatLng(20.5937, 78.9629);
  GoogleMapController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Enter Price'),
      ),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefix: Text(
                      'Ksh',
                      style: TextStyle(fontSize: 20),
                    ),
                    labelText: 'Price',
                    labelStyle: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
                  ),
                ),
              ),
              TextField(
                maxLines: 2,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  labelText: 'Address (optional)',
                  labelStyle: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: _initialcameraposition),
              mapType: MapType.normal,
              myLocationEnabled: true,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FlatButton.icon(
              textColor: Theme.of(context).primaryColor,
              icon: Icon(
                Icons.location_on_outlined,
              ),
              label: Text('Current location'),
              onPressed: () => {},
            ),
            FlatButton.icon(
                textColor: Theme.of(context).primaryColor,
                icon: Icon(
                  Icons.map,
                ),
                label: Text('Choose location'),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, MapView.id);
                }),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 200.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 45.0,
            child: FlatButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, HomeScreen.id);
                },
                color: Theme.of(context).primaryColor,
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Post',
                  style: TextStyle(color: Colors.white),
                )),
          ),
        ),
      ]),
    );
  }
}
