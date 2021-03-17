import 'package:flutter/material.dart';
import 'package:places_app/pages/place_details_page.dart';

class PlaceDetailsPage extends StatelessWidget {
  final place;
  PlaceDetailsPage(this.place);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.subtitle),
        centerTitle: true,
      ),
      body: PlaceDetails(place:place),
    );
  }
}
