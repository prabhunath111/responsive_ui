import 'package:flutter/material.dart';
import 'package:places_app/detail_page.dart';
import 'package:places_app/place.dart';
import 'package:places_app/places_data.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatefulWidget {
  //
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Places App'),
      ),
      body: GridView.extent(
        maxCrossAxisExtent: 200,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        padding: EdgeInsets.all(8),
        childAspectRatio: 1 / 1.2,
        //d
        children: gridItems(), // esired width and height
      ),
    );
  }

  List<Widget> gridItems() {
    return Places()
        .getPlaces()
        .map<Widget>((place) => _GridItem(place))
        .toList();
  }
}

class _GridItem extends StatelessWidget {
  _GridItem(this.place);

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: InkWell(
        child: GridTile(
          //GridTile with nicer placeholders like, footer, title, subtitle
          footer: GridTileBar(
            backgroundColor: Colors.black45,
            title: Text(place.title),
            subtitle: Text(place.subtitle),
          ),
          child: Ink.image(
            image: AssetImage(place.image),
            fit: BoxFit.cover,
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DetailPage(place)));
        },
      ),
    );
  }
}
