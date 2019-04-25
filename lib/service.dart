import 'package:flutter/material.dart';

class Service extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  border:
                      Border.all(color: Colors.green, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.green[100]),
              child: SizedBox(
                height: 100.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        // backgroundColor: Colors.amber,
                        radius: 45,
                        backgroundImage: AssetImage("assets/food01.jpeg"),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            child: Card(
              color: Colors.green[100],
              elevation: 0.2,
              child: SizedBox(
                height: 200.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.ac_unit,
                      size: 50.0,
                    ),
                    Text("this is a text"),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}