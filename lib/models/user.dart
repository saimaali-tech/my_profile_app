class User {
  final String name;
  final String profession;
  final String bio;
  final String email;
  final String phone;
  final String location;
  final List<String> skills;
  final List<String> hobbies;
  final String linkedin;
  final String github;
  final String twitter;
  final String imagePath;

  User({
    required this.name,
    required this.profession,
    required this.bio,
    required this.email,
    required this.phone,
    required this.location,
    required this.skills,
    required this.hobbies,
    required this.linkedin,
    required this.github,
    required this.twitter,
    required this.imagePath,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json['name'],
    profession: json['profession'],
    bio: json['bio'],
    email: json['email'],
    phone: json['phone'],
    location: json['location'],
    skills: List<String>.from(json['skills'] ?? []),
    hobbies: List<String>.from(json['hobbies'] ?? []),
    linkedin: json['linkedin'] ?? '',
    github: json['github'] ?? '',
    twitter: json['twitter'] ?? '',
    imagePath: json['imagePath'] ?? 'assets/images/profile.jpg',
  );
}
