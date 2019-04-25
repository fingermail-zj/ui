import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:ui/product_list.dart';
import 'package:ui/service.dart';
import 'package:image/image.dart' as Img;
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'UI Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  String _filename = 'test.jpg';
  String _url =
      "https://ss0.baidu.com/7Po3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=575b36d70d3b5bb5a1d726fe06d2d523/a6efce1b9d16fdfad03ef192ba8f8c5494ee7b7f.jpg";
  final List<Widget> viewList = [Home(), ProductList(), Service()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<Uint8List> _downloadImage() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/$_filename');
    print('$dir/$_filename'); //是虚拟机上的目录

    if (file.existsSync()) {
      var image = await file.readAsBytes();
      return image;
    } else {
      var response = await http.get(
        _url,
      );
      var bytes = response.bodyBytes;
      Uint8List newPng = await removeWhiteBackground(bytes);
      file.writeAsBytes(newPng);
      return newPng;
    }
  }

  Future<Uint8List> removeWhiteBackground(Uint8List bytes) async {
    Img.Image image = Img.decodeImage(bytes);
    Img.Image transparentImage = await colorTransparent(image, 255, 255, 255);
    // var newPng = Img.encodePng(transparentImage);
    var newPng =
        Img.encodePng(Img.copyCrop(transparentImage, 50, 50, 100, 100));
    return newPng;
  }

  Future<Img.Image> colorTransparent(
      Img.Image src, int red, int green, int blue) async {
    var pixels = src.getBytes();
    for (int i = 0, len = pixels.length; i < len; i += 4) {
      if (pixels[i] == red && pixels[i + 1] == green && pixels[i + 2] == blue) {
        pixels[i + 3] = 0;
      }
    }

    return src;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 1,
        // backgroundColor: Color.fromRGBO(49, 87, 110, 1.0),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: viewList[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _downloadImage();
        },
        child: Icon(Icons.ac_unit),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.brightness_4), title: Text('product')),
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit), title: Text('service')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }
}
