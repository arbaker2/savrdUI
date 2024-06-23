class Profile {
  const Profile({
    required this.id,
    required this.imageAssetLocation,
    required this.handle,
    required this.name,
    this.creationTime,
    this.description,
  });

  final int id;
  final String imageAssetLocation;
  final String handle;
  final String name;
  final int? creationTime;
  final String? description;
}
