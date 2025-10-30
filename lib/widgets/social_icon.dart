import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIcon extends StatelessWidget {
  final IconData icon;
  final String url;
  const SocialIcon({Key? key, required this.icon, required this.url}) : super(key: key);

  void _launch() async {
    if (url.isEmpty) return;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, size: 28),
      onPressed: _launch,
      tooltip: url,
    );
  }
}
