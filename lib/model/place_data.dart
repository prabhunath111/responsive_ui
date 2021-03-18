import 'package:places_app/model/place.dart';

class Places {
  List<Place> getPlaces() {
    return [
      Place(
        image: 'assets/images/pic0.jpg',
        title: 'Chennail',
        subtitle: 'FlowerMarket0',
      ),
      Place(
          image: 'assets/images/pic1.jpg',
          title: 'Tanjore',
          subtitle: 'Bronzeworks1'),
      Place(
        image: 'assets/images/pic2.jpg',
        title: 'Chennail1',
        subtitle: 'FlowerMarket2',
      ),
      Place(
          image: 'assets/images/pic3.jpg',
          title: 'Tanjore1',
          subtitle: 'Bronzeworks3'),
      Place(
        image: 'assets/images/pic4.jpg',
        title: 'Chennail2',
        subtitle: 'FlowerMarket4',
      ),
      Place(
          image: 'assets/images/pic5.jpg',
          title: 'Tanjore2',
          subtitle: 'Bronzeworks5'),
    ];
  }

  String getPlacesDescription() {
    return "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.";
  }

 List<String> getStatesOfSouthIndia() {
    return [
      'Andhra Pradesh',
      'Karnatka',
      'Kerala',
      'TamilNadu',
      'Telengana'
    ];
  }
}
