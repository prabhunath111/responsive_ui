import 'package:flutter/material.dart';
import 'package:places_app/model/place.dart';
import 'package:places_app/model/place_data.dart';
import 'package:places_app/pages/place_details_page.dart';
import 'package:places_app/widgets/places_gallery.dart';
import '../places_responsive_app.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Place selectedPlace = Places().getPlaces()[0];
  void handlePlaceChanged(Place newPlace) {
    setState(() {
      selectedPlace = newPlace;
    });
  }
  @override
  Widget build(BuildContext context) {
    Widget widget;
    switch (getScreenSize(MediaQuery.of(context).size.width)){
      case ScreenSize.small:
        widget = homePageSmall();
        break;
      case ScreenSize.medium:
        widget = homePageMedium();
        break;
      case ScreenSize.large:
        widget = homePageLarge();
        break;
    }
    return widget;
  }

  Widget homePageSmall() {
    return Scaffold(
      appBar: appBar(),
      drawer: Drawer(
        child: drawerBody(),
      ),
      body: PlacesGallery(handlePlaceChanged: handlePlaceChanged, showHorizontalGridView: false),
    );
  }
  Widget homePageMedium() {
    return Scaffold(
      appBar: appBar(),
      body: Row(
        children: [
          Expanded(flex: 2, child: drawerBody()),
          Expanded(child: PlacesGallery(handlePlaceChanged: handlePlaceChanged, showHorizontalGridView: true)),
        ],
      ),
    );
  }

  Widget appBar() {
    return AppBar(
      title: Text(
        'Places App - Responsive'
      ),
    );
  }

  Widget drawerBody() {
    final menuItems = Places().getStatesOfSouthIndia();
    return ListView.builder(
      itemCount: menuItems.length,
        itemBuilder: (context, index) {
      if (index == 0) {
        return DrawerHeader(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                  child: Image.asset('assets/images/pic5.jpg', fit: BoxFit.fill,)),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'South India',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      } else
        return ListTile(
          title: Text(menuItems[index]),
          leading: Icon(Icons.thumb_up),
      );
    });
  }

  Widget homePageLarge() {
    return Scaffold(
      appBar: appBar(),
      body: Row(
        children: [
          Expanded(flex:1, child: drawerBody()),
          Expanded(flex:3, child: Container(
            color: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                      child: PlacesGallery(
                    handlePlaceChanged: handlePlaceChanged,
                        showHorizontalGridView: true,
                  )),
                  Expanded(flex: 2, child: PlaceDetails(
                    place: selectedPlace
                  ),)
                ],
              ),
            ),
          ))
        ],
      )
    );
  }

}
