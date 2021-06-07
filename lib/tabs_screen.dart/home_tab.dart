import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  static final String id = 'HomeTab';
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Books',
          style: TextStyle(
            fontFamily: 'Poppins-Regular',
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection("bookdetails").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData)
            return Center(
                child: Text(
              'No books for Sale',
              style: TextStyle(
                fontFamily: 'Poppins-Regular',
                fontSize: 18.0,
              ),
            ));
          return new ListView(children: getUsers(snapshot));
        },
      ),
    );
  }

  getUsers(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data.documents
        .map((doc) => ListTile(
              title: Card(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                elevation: 4.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          child: CachedNetworkImage(
                            placeholder: (context, url) =>
                                Image.asset("images/spinner.gif"),
                            imageUrl: doc["downloadUrl"],
                            height: 210,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      doc["title"],
                                      style: TextStyle(
                                        fontFamily: 'Poppins-Regular',
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    FittedBox(
                                      child: Row(
                                        children: [
                                          Icon(Icons.book),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          Text(
                                            doc['author'],
                                            style: TextStyle(
                                              fontFamily: 'Poppins-Regular',
                                              fontSize: 15.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Expanded(
                        //     flex: 1,
                        //     child: Text(
                        //       doc['desc'],
                        //       style: TextStyle(
                        //         fontFamily: 'Poppins-Regular',
                        //         fontSize: 18.0,
                        //       ),
                        //       textAlign: TextAlign.right,
                        //     ))
                      ]),
                ),
              ),
            ))
        .toList();
  }
}
