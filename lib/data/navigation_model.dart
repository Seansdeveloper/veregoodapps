import '../generated/assets.dart';

class Model {
  final int id;
  final String imagePath;
  final String name;

  Model({
    required this.id,
    required this.imagePath,
    required this.name,
  });
}

List<Model> navBtn = [
  Model(id: 0, imagePath: Assets.assetsHome, name: 'Home'),
  Model(id: 1, imagePath:Assets.assetsSearch, name: 'Search'),
  Model(id: 2, imagePath: Assets.assetsHeart, name: 'Like'),
  Model(id: 3, imagePath: Assets.assetsNotification, name: 'notification'),
  Model(id: 4, imagePath: Assets.assetsUser, name: 'Profile'),
];