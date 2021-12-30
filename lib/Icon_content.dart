import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  IconContent({@required this.icons, @required this.texts});
  final Icon icons;
  final Text texts;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        icons,
        SizedBox(height: 15.0),
        texts,
      ],
    );
  }
}

// class IconButton extends StatelessWidget {
//   IconButton({this.onClick, this.icons});
//   final Function onClick;
//   final Icon icons;
//   @override
//   Widget build(BuildContext context) {
//     return FloatingActionButton(
//       onPressed: () {
//         setState(() {
//           weight = weight - 1;
//         });
//       },
//       backgroundColor: Colors.grey,
//       child: Icon(
//         Icons.remove,
//         color: Colors.white,
//       ),
//     );
//   }
// }
