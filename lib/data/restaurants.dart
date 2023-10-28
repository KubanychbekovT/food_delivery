class Restaurant {
  final String name;
  final String imageUrl;

  Restaurant({
    required this.name,
    required this.imageUrl,
  });
}
final List<Restaurant> restaurants = [
  Restaurant(
    name: 'Wasabi',
    imageUrl: 'assets/restaurants/photo2jpg.jpg',

  ),
  Restaurant(
    name: 'Kulikov',
    imageUrl: 'assets/restaurants/kulikov.png',
  ),
  Restaurant(
    name: 'WoK Lagman',
    imageUrl: 'assets/restaurants/wok.jpg',
  ),
  Restaurant(
    name: 'Okiniiri',
    imageUrl: 'assets/restaurants/okiniiri.jpg',
  ),
  Restaurant(
    name: 'Oasis',
    imageUrl: 'assets/restaurants/oasis.jpg',
  ),

];