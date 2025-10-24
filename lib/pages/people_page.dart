import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Instructor {
  final String name;
  final String title;
  final String phone;
  final String photoUrl;

  Instructor(this.name, this.title, this.phone, this.photoUrl);
}

final _instructors = <Instructor>[
  Instructor(
    'Dr. Aylin Öz',
    'Assoc. Prof.',
    '+90 212 555 0101',
    'https://images.unsplash.com/photo-1531123897727-8f129e1688ce?auto=format&fit=crop&w=400&q=80',
  ),
  Instructor(
    'Dr. Eren Kaya',
    'Asst. Prof.',
    '+90 212 555 0102',
    'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=crop&w=400&q=80',
  ),
  Instructor(
    'Prof. Leyla Demir',
    'Professor',
    '+90 212 555 0103',
    'https://images.unsplash.com/photo-1607746882042-944635dfe10e?auto=format&fit=crop&w=400&q=80',
  ),
  Instructor(
    'Dr. Cem Ak',
    'Lecturer',
    '+90 212 555 0104',
    'https://images.unsplash.com/photo-1595152772835-219674b2a8a6?auto=format&fit=crop&w=400&q=80',
  ),
];

class PeoplePage extends StatelessWidget {
  const PeoplePage({super.key});

  Future<void> _confirmAndCall(BuildContext context, Instructor i) async {
    final yes = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Call Instructor'),
        content: Text('Name: ${i.name}\nTitle: ${i.title}\nPhone: ${i.phone}\n\nOpen dialer?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('No')),
          FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Yes')),
        ],
      ),
    );

    if (yes == true) {
      final tel = i.phone.replaceAll(' ', '');
      final uri = 'tel:$tel';
      try {
        if (Platform.isAndroid) {
          await launchUrlString(uri, mode: LaunchMode.externalApplication);
        } else if (Platform.isIOS) {
          await launchUrlString(uri);
        } else {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Dialer is only available on Android/iOS')),
            );
          }
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Dialer error: $e')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: _instructors.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (ctx, idx) {
        final i = _instructors[idx];
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    i.photoUrl,
                    width: 72,
                    height: 72,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(i.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(i.title),
                      const SizedBox(height: 4),
                      Text(i.phone, style: const TextStyle(letterSpacing: 0.5)),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                FilledButton.icon(
                  onPressed: () => _confirmAndCall(context, i),
                  icon: const Icon(Icons.call),
                  label: const Text('Call'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
