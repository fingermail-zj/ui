import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  final String image;
  final String name;
  final int price;
  final String describe;

  const Product({Key key, this.image, this.name, this.price, this.describe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      child: Container(
        width: 180.0,
        height: 280.0,
        padding: EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              image,
              fit: BoxFit.cover,
              width: 180.0,
              height: 200.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[Text(name), Icon(Icons.access_alarm)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('$price'),
                Text(
                  '${price + 100}',
                  style: TextStyle(
                      decorationStyle: TextDecorationStyle.solid,
                      decorationColor: Colors.red,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.lineThrough),
                )
              ],
            ),
            Text(
              describe,
              softWrap: true,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}


// @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 10.0,
//       child: Container(
//         width: 180.0,
//         height: 280.0,
//         padding: EdgeInsets.all(5.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Image.asset(
//               image,
//               fit: BoxFit.cover,
//               width: 180.0,
//               height: 200.0,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[Text(name), Icon(Icons.access_alarm)],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Text('$price'),
//                 Text(
//                   '${price + 100}',
//                   style: TextStyle(
//                       decorationStyle: TextDecorationStyle.solid,
//                       decorationColor: Colors.red,
//                       fontWeight: FontWeight.bold,
//                       decoration: TextDecoration.lineThrough),
//                 )
//               ],
//             ),
//             Text(
//               describe,
//               softWrap: true,
//               maxLines: 1,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }