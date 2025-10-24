import 'package:flutter/material.dart';
import 'image_viewer_page.dart';

class InfrastructurePage extends StatelessWidget {
  const InfrastructurePage({super.key});

  static final _rooms = [
    {
      'code': 'Classroom-B1',
      'image': 'https://images.unsplash.com/photo-1509062522246-3755977927d7?auto=format&fit=crop&w=2000&q=80',// amfi
      'thumb': 'https://images.unsplash.com/photo-1529070538774-1843cb3265df?auto=format&fit=crop&w=320&q=60',
    },
    {
      'code': 'Classroom-B2',
      'image': 'https://images.unsplash.com/photo-1529070538774-1843cb3265df?auto=format&fit=crop&w=2000&q=80', // klasik sınıf
      'thumb': 'https://images.unsplash.com/photo-1509062522246-3755977927d7?auto=format&fit=crop&w=320&q=60',
    },
    {
      'code': 'Classroom-B3',
      'image': 'https://images.unsplash.com/photo-1541339907198-e08756dedf3f?auto=format&fit=crop&w=2000&q=80', // bilgisayar labı
      'thumb': 'https://images.unsplash.com/photo-1541339907198-e08756dedf3f?auto=format&fit=crop&w=320&q=60',
    },
    {
      'code': 'Classroom-B4',
      'image': 'https://images.unsplash.com/photo-1596495577886-d920f1fb7238?auto=format&fit=crop&w=2000&q=80', // modern sınıf
      'thumb': 'https://images.unsplash.com/photo-1596495577886-d920f1fb7238?auto=format&fit=crop&w=320&q=60',
    },
    {
      'code': 'Classroom-B5',
      'image': 'https://images.unsplash.com/photo-1523580846011-d3a5bc25702b?auto=format&fit=crop&w=2000&q=80', // beyaz tahtalı sınıf
      'thumb': 'https://images.unsplash.com/photo-1523580846011-d3a5bc25702b?auto=format&fit=crop&w=320&q=60',
    },
    {
      'code': 'Classroom-B6',
      'image': 'https://images.unsplash.com/photo-1588072432836-e10032774350?auto=format&fit=crop&w=2000&q=80', // takım çalışma alanı
      'thumb': 'https://images.unsplash.com/photo-1588072432836-e10032774350?auto=format&fit=crop&w=320&q=60',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: _rooms.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (ctx, i) {
        final room = _rooms[i];
        return GestureDetector(
          onDoubleTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ImageViewerPage(imageUrl: room['image']!, tag: room['code']!)),
            );
          },
          child: ListTile(
            leading: const Icon(Icons.meeting_room_outlined),
            title: Text(room['code']!),
            subtitle: const Text('Double click to see the image.'),
            trailing: const Icon(Icons.open_in_new),
          ),
        );
      },
    );
  }
}
