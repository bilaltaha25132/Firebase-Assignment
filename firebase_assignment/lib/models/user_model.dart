class MyUser {
  final String id; // Unique identifier for the user
  final String email; // User's email address
  final String displayName; // User's display name
  final String? profilePictureUrl; // URL to user's profile picture (nullable)

  MyUser({
    required this.id,
    required this.email,
    required this.displayName,
    this.profilePictureUrl,
  });

  factory MyUser.fromGoogle(Map<String, dynamic> googleData) {
    return MyUser(
      id: googleData['id'],
      email: googleData['email'],
      displayName: googleData['displayName'],
      profilePictureUrl: googleData['profilePictureUrl'], // May be null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'displayName': displayName,
      'profilePictureUrl': profilePictureUrl,
    };
  }
}
