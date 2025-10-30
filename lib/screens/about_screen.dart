import 'package:flutter/material.dart';
import '../models/user.dart';

class AboutScreen extends StatelessWidget {
  final User user;
  const AboutScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final skills = user.skills;
    final hobbies = user.hobbies;

    return Scaffold(
      appBar: AppBar(
        title: const Text('About Me'),
        leading: const BackButton(),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              title: const Text('Education'),
              subtitle: const Text(
                  '🎓 Karakoram International University (BSCS 2023–2027)\n🎓 Degree College Gilgit (ICS 2021–2023)'),
            ),
          ),
          const SizedBox(height: 12),
          Text('Experience', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          const Text(
              '• DevOps Engineer – Core Elite Experts (2022–Present)\nDesign and implement robust DevOps solutions, automating CI/CD pipelines and AWS deployments.\n\n• Web Developer (2021–2022)\nDeveloped responsive, user-focused websites ensuring scalability and performance.'),
          const SizedBox(height: 16),
          Text('Projects', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          const Text(
              '🔹 Containerized Application Deployment & CI/CD Automation\n🔹 Docker Networking & Service Integration\n🔹 Dockerized App with Nginx Reverse Proxy & Domain Routing\n\nEach project highlights problem-solving in automation, networking, and scalable delivery.'),
          const SizedBox(height: 16),
          Text('Skills', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Wrap(spacing: 8, runSpacing: 8, children: skills.map((s) => Chip(label: Text(s))).toList()),
          const SizedBox(height: 16),
          Text('Hobbies', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: hobbies
                .map((h) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          const Icon(Icons.check_circle_outline, size: 18),
                          const SizedBox(width: 8),
                          Expanded(child: Text(h)),
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
