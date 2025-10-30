import 'package:flutter/material.dart';
import '../models/user.dart';
import '../widgets/social_icon.dart';

class ProfileScreen extends StatelessWidget {
  final User user;
  const ProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final isSmall = mq.size.width < 400;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/about', arguments: user);
        },
        child: const Icon(Icons.info_outline),
        tooltip: 'About Me',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Column(
            children: [
              CircleAvatar(
                radius: isSmall ? 54 : 72,
                backgroundImage: AssetImage(user.imagePath),
              ),
              const SizedBox(height: 12),
              Text(
                user.name,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(user.profession, style: TextStyle(color: Colors.grey[600])),
              const SizedBox(height: 12),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.bio, style: const TextStyle(fontSize: 14)),
                      const SizedBox(height: 12),
                      const Divider(),
                      ListTile(leading: const Icon(Icons.email), title: Text(user.email)),
                      ListTile(leading: const Icon(Icons.phone), title: Text(user.phone)),
                      ListTile(leading: const Icon(Icons.location_on), title: Text(user.location)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialIcon(icon: Icons.link, url: user.linkedin),
                  const SizedBox(width: 12),
                  SocialIcon(icon: Icons.code, url: user.github),
                  const SizedBox(width: 12),
                  SocialIcon(icon: Icons.chat, url: user.twitter),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
