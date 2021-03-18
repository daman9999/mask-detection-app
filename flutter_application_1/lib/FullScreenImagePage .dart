import 'package:flutter/gestures.dart';
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
      child: Column(
        children: <Widget>[
          Expanded(
            child: Dismissible(
                direction: DismissDirection.vertical,
                key: const Key('key'),
                onDismissed: (_) => Navigator.of(context).pop(),
                child: ImageWork(imgPath: widget.imgPath)),
          ),
        ],
      ),
    );
  }
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
