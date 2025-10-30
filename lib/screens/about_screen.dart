import 'package:flutter/material.dart';
import '../models/user.dart';

class AboutScreen extends StatelessWidget {
  final User user;
  const AboutScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('About Me'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              title: const Text('Education'),
              subtitle: Text(
                'Karakoram International University\nBSCS in Computer Science (2023–2027)',
                style: TextStyle(fontSize: isTablet ? 16 : 14),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text('Skills',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: user.skills
                .map((s) => Chip(
                      label: Text(s),
                      padding: const EdgeInsets.all(6),
                    ))
                .toList(),
          ),
          const SizedBox(height: 16),
          Text('Hobbies',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: user.hobbies
                .map((h) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          const Icon(Icons.check_circle_outline, size: 18),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(h,
                                style: TextStyle(
                                    fontSize: isTablet ? 16 : 14)),
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
