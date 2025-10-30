import 'package:flutter/material.dart';
import '../models/user.dart';
import '../widgets/social_icon.dart';

class ProfileScreen extends StatelessWidget {
  final User user;
  const ProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final width = mq.size.width;
    final isSmall = width < 400;
    final isTablet = width > 600;

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
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 700),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                CircleAvatar(
                  radius: isSmall ? 60 : 80,
                  backgroundImage: AssetImage(user.imagePath),
                ),
                const SizedBox(height: 12),
                Text(
                  user.name,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: isTablet ? 26 : 22,
                      ),
                ),
                Text(user.profession,
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: isTablet ? 18 : 14)),
                const SizedBox(height: 12),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.bio,
                            style: TextStyle(fontSize: isTablet ? 16 : 14)),
                        const Divider(height: 24),
                        ListTile(
                          leading: const Icon(Icons.email),
                          title: Text(user.email),
                        ),
                        ListTile(
                          leading: const Icon(Icons.phone),
                          title: Text(user.phone),
                        ),
                        ListTile(
                          leading: const Icon(Icons.location_on),
                          title: Text(user.location),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialIcon(icon: Icons.linked_camera, url: user.linkedin),
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
      ),
    );
  }
}
