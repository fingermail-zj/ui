import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  border:
                      Border.all(color: Colors.green, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(0.0),
                  color: Colors.green[100]),
              child: SizedBox(
                height: 100.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(1.0, 1.0, 8.0, 1.0),
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            // backgroundColor: Colors.amber,
                            radius: 40,
                            backgroundImage: AssetImage("assets/food01.jpeg"),
                          ),
                          Text('Banana')
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Card(
            elevation: 2.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10.0),
              child: Image.asset(
                'assets/food01.jpeg',
                fit: BoxFit.fill,
                colorBlendMode: BlendMode.darken,
                color: Colors.yellow,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  border:
                      Border.all(color: Colors.green, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(0.0),
                  color: Colors.green[100]),
              child: SizedBox(
                height: 150.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(1.0, 1.0, 8.0, 1.0),
                      child: Image.asset(
                          "assets/food01.jpeg",
                          fit: BoxFit.cover,
                        ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      );
  }
}