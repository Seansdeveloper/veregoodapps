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
  Model(id: 0, imagePath: Assets.veregoodappsAssetsHome, name: 'Home'),
  Model(id: 1, imagePath:Assets.assetsProfile, name: 'Search'),
  Model(id: 2, imagePath: Assets.assetsExplore, name: 'Like'),
  Model(id: 3, imagePath: Assets.assetsSetting, name: 'Profile'),
];