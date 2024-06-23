class Profile {
  const Profile({
    required this.id,
    required this.profileImageAssetLocation,
    required this.profileHandle,
    required this.profileName,
    this.creationTime,
    this.description,
  });

  final int id;
  final String profileImageAssetLocation;
  final String profileHandle;
  final String profileName;
  final int? creationTime;
  final String? description;
}
