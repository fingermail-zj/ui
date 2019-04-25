import 'package:flutter/material.dart';
import 'product.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          elevation: 10.0,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_drop_down),
                      onPressed: () {},
                    ),
                    Text('SORT')
                  ],
                ),
                Text('|'),
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_drop_down),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Column(
                                children: <Widget>[
                                  ListTile(
                                    leading: Icon(Icons.photo_camera),
                                    title: Text("Camera"),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.photo_library),
                                    title: Text("Gallery"),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            });
                      },
                    ),
                    Text('REFINE')
                  ],
                ),
              ]),
        ),
        GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Product(
              image: "assets/food01.jpeg",
              name: "Tomey Moor",
              price: 455,
              describe: "This is best price.",
            ),
            Product(
              image: "assets/food01.jpeg",
              name: "Linsy sines",
              price: 988,
              describe: "This is primary price.",
            ),
          ],
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: <Widget>[
        //     Product(
        //       image: "assets/food01.jpeg",
        //       name: "Tomey Moor",
        //       price: 455,
        //       describe: "This is best price.",
        //     ),
        //     Product(
        //       image: "assets/food01.jpeg",
        //       name: "Linsy sines",
        //       price: 988,
        //       describe: "This is primary price.",
        //     ),
        //   ],
        // )
      ],
    );
  }
}
