import 'package:book_app/services/auth_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _userName;
  String _email;

  Future<void> _getUserName() async {
    Firestore.instance
        .collection('users')
        .document((await FirebaseAuth.instance.currentUser()).uid)
        .get()
        .then((value) {
      setState(() {
        _userName = value.data['name'].toString();
        _email = value.data['email'].toString();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getUserName();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            painter: HeaderCurvedContainer(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  '',
                  style: TextStyle(
                    fontFamily: 'Poppins-Regular',
                    fontSize: 35.0,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 4.5,
                height: MediaQuery.of(context).size.height / 4.5,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 5),
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/profile.png'))),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 270.0, left: 94),
            child: CircleAvatar(
              backgroundColor: Colors.black54,
              child: IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          ),
          Positioned(
            top: 300,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90),
                  child: FlatButton(
                      padding: EdgeInsets.all(20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: Color(0xFFF5F6F9),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.lightBlue,
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            '$_userName',
                            style: TextStyle(
                              fontSize: 17.0,
                              fontFamily: 'Poppins-Regular',
                            ),
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
          Positioned(
            top: 380,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90),
                  child: FlatButton(
                      color: Color(0xFFF5F6F9),
                      padding: EdgeInsets.all(20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.email,
                            color: Colors.lightBlue,
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            '$_email',
                            style: TextStyle(
                              fontSize: 17.0,
                              fontFamily: 'Poppins-Regular',
                            ),
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
          Positioned(
            top: 470,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90),
                  child: FlatButton(
                      padding: EdgeInsets.all(20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: Color(0xFFF5F6F9),
                      onPressed: () {
                        AuthService.logout(context);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.logout,
                            color: Colors.lightBlue,
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            'LogOut',
                            style: TextStyle(
                              fontSize: 17.0,
                              fontFamily: 'Poppins-Regular',
                            ),
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.blue;
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
