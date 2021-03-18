import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:flutter_application_1/FullScreenImagePage .dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> wallpapersList;
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("imageDetails");
  @override
  void initState() {
    super.initState();
    subscription = collectionReference.snapshots().listen((datasnapshot) {
      setState(() {
        wallpapersList = datasnapshot.docs;
      });
    });
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Mask detector")),
      ),
      body: wallpapersList != null
          ? StaggeredGridView.countBuilder(
              padding: const EdgeInsets.all(8.0),
              itemCount: wallpapersList.length,
              itemBuilder: (context, i) {
                String imgPath = wallpapersList[i].get("url");
                print(imgPath);
                return Material(
                  elevation: 8.0,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                FullScreenImagePage(imgPath))),
                    child: Hero(
                        tag: imgPath,
                        child: FadeInImage(
                            placeholder: AssetImage("images/nothingFound.gif"),
                            image: NetworkImage(imgPath))),
                  ),
                );
              },
              staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              crossAxisCount: 2,
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
