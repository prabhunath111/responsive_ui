import 'package:flutter/material.dart';
import 'package:places_app/pages/home_page.dart';

void main() {
  runApp(PlacesApp());
}

enum ScreenSize {small, medium, large }

const _breakPoint1 = 600.0;
const _breakPoint2 = 840.0;
ScreenSize getScreenSize(double width) {
  print('Size.width= $width');
  if(width < _breakPoint1) {
    return ScreenSize.small;
  } else if (width >= _breakPoint1 && width <= _breakPoint2){
    return ScreenSize.medium;
  } else {
    return ScreenSize.large;
  }
}


class PlacesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Places App - Responsive',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: HomePage(),
    );
  }
}
