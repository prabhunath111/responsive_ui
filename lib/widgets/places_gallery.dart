import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places_app/model/place_data.dart';
import 'package:places_app/places_responsive_app.dart';
import 'package:places_app/widgets/place_details.dart';

class PlacesGallery extends StatelessWidget {

  PlacesGallery({this.handlePlaceChanged, this.showHorizontalGridView});

  final handlePlaceChanged;
  final showHorizontalGridView;


  @override
  Widget build(BuildContext context) {
    int itemCount;
    Axis axisDirection;
    if (showHorizontalGridView) {
      //horizontal gallery
      itemCount = 1; //single row gallery
      axisDirection = Axis.horizontal;
    } else {
      //vertical gallery
      itemCount = 2; //two columns gallery
      axisDirection = Axis.vertical;
    }
    return Container(
      color: Colors.grey[200],
      child: GridView.count(
        crossAxisCount: itemCount,
        scrollDirection: axisDirection,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        padding: EdgeInsets.all(8),
        childAspectRatio: 1 / 1.2,
        children: gridItems(),
      ),
    );
  }

 List<Widget> gridItems() {
    return Places().getPlaces().map<Widget>((place) =>
        _GridItem(place, handlePlaceChanged)).toList();
  }
}

class _GridItem extends StatelessWidget {
  _GridItem(this.place, this.handlePlaceChanged);

  final place;
  final handlePlaceChanged;

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
        onTap: ()
        {
          switch(getScreenSize(MediaQuery
              .of(context)
              .size
              .width)) {
          case ScreenSize.small:
          case ScreenSize.medium:
            Navigator.push(context, MaterialPageRoute(builder: (context) => PlaceDetailsPage(place)));
            break;
          case ScreenSize.large:
            handlePlaceChanged(place);
            break;
        }
        },
      ),
    );
  }
}
