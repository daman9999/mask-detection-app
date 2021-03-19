import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FullScreenImagePage extends StatefulWidget {
  String imgPath;
  FullScreenImagePage(this.imgPath);

  @override
  _FullScreenImagePageState createState() => _FullScreenImagePageState();
}

class _FullScreenImagePageState extends State<FullScreenImagePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Dismissible(
                  direction: DismissDirection.vertical,
                  key: const Key('key'),
                  onDismissed: (_) => Navigator.of(context).pop(),
                  child: ImageWork(imgPath: widget.imgPath)),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              height: (MediaQuery.of(context).size.height * 26) / 100,

              //color: Colors.white,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Without mask Person detected",
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 9),
                        _layoutDetails(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _layoutDetails(context) {
  Orientation o = MediaQuery.of(context).orientation;
  if (o == Orientation.portrait) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        //onpressed to be implemented
        buttonElevate(Colors.red[500], 120, "fine", () {}),
        SizedBox(height: 9),
        buttonElevate(Colors.black45, 110, "Dismiss", () {}),
      ],
    );
  } else {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        buttonElevate(Colors.red[500], 120, "fine", () {}),
        SizedBox(width: 9),
        buttonElevate(Colors.black45, 110, "Dismiss", () {}),
      ],
    );
  }
}

Widget buttonElevate(Color btnclr, double hori, String tex, Function func) {
  return ElevatedButton(
    /***onapreesed is to be implemented */
    onPressed: func,
    child: Text(tex),
    style: ElevatedButton.styleFrom(
      primary: btnclr,
      padding: EdgeInsets.symmetric(horizontal: hori, vertical: 10),
      textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
    ),
  );
}

class ImageWork extends StatelessWidget {
  const ImageWork({
    Key key,
    @required this.imgPath,
  }) : super(key: key);

  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PhotoView(
        imageProvider: NetworkImage(imgPath),
      ),
    );
  }
}

//  Stack(
//               children: <Widget>[
//                 Align(
//                   alignment: Alignment.center,
//                   child: Hero(
//                     tag: imgPath,
//                     child: Image.network(imgPath),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.topCenter,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       AppBar(
//                         elevation: 0.0,
//                         backgroundColor: Colors.transparent,
//                         leading: IconButton(
//                           icon: Icon(
//                             Icons.close,
//                             color: Colors.black,
//                           ),
//                           onPressed: () => {
//                             Navigator.of(context).pop(),
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//  */
