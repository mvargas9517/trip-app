
class Destination {
  final String place;
  final String imageUrl;
  final String attractions;

  Destination({ this.place, this.imageUrl, this.attractions});
}

final List <Destination> destinations = [
  Destination(
    place: 'Italy',
    imageUrl: 'images/location0.jpg',
    attractions: '27',
  ),
  Destination(
    place: 'Canada',
    imageUrl: 'images/location1.jpg',
    attractions: '32',  
    ),
  Destination(
    place: 'Spain',
    imageUrl: 'images/location2.jpg',
    attractions: '23',
  ),
];