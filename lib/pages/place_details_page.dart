import 'package:flutter/material.dart';
import 'package:places_app/model/place_data.dart';

class PlaceDetails extends StatelessWidget {
  final place;
  PlaceDetails({this.place});
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth >= 600){
            return largeWidget(color);
          } else {
            return smallWidget(color);
          }
        }
    );
  }

  Widget largeWidget(color) {
    return SingleChildScrollView(
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 6,
        margin: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Column(
                  children: [
                    Image.asset('assets/images/pic1.jpg'),
                    titleSection(),
                  ],
                )
            ),
            Expanded(child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: buttonSection(color),
                ),
                textSection()
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget smallWidget(color) {
    return ListView(
      children: [
        Image.asset(
          place.image,
          height: 320,
          fit: BoxFit.cover,
        ),
        titleSection(),
        buttonSection(color),
        textSection()
      ],
    );
  }

  Widget titleSection() {
    return Container(
      padding: EdgeInsets.all(24),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    place.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Text(place.subtitle,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Text('41'),
          )
        ],
      ),
    );
  }

  Widget buttonSection(Color color) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buttonColumn(
              color, Icons.call, 'CALL'
          ),
          buttonColumn(
              color, Icons.near_me, 'CALL'
          ),
          buttonColumn(
              color, Icons.share, 'CALL'
          ),
        ],
      ),
    );
  }

    buttonColumn(Color color, IconData icon, String label) {
      return InkWell(
        onTap: (){},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon, color: color,
              ),
              Container(
                margin: const EdgeInsets.only(top: 8),
                child: Text(
                  label,
                  style: TextStyle(
                      fontSize: 12,
                      color: color
                  ),
                ),
              )
            ],
          ),
        ),
      );

  }

  Widget textSection() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Text(Places().getPlacesDescription()),
    );
  }
}
