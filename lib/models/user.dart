class User {
  final String name;
  final String profession;
  final String bio;
  final String email;
  final String phone;
  final String location;
  final String imagePath;
  final String linkedin;
  final String github;
  final String twitter;
  final List<String> skills;
  final List<String> hobbies;

  const User({
    required this.name,
    required this.profession,
    required this.bio,
    required this.email,
    required this.phone,
    required this.location,
    required this.imagePath,
    required this.linkedin,
    required this.github,
    required this.twitter,
    required this.skills,
    required this.hobbies,
  });
}
