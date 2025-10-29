import 'package:flutter/material.dart';
import 'image_viewer_page.dart';

class InfrastructurePage extends StatelessWidget {
  const InfrastructurePage({super.key});

  static final _rooms = [
    {
      'code': 'Classroom-B1',
      'image': 'https://unsplash.com/photos/F8t2VGnI47I/download?force=true&w=2000',
      'thumb': 'https://unsplash.com/photos/F8t2VGnI47I/download?force=true&w=320',
    },
    {
      'code': 'Classroom-B2',
      'image': 'https://unsplash.com/photos/PDRFeeDniCk/download?force=true&w=2000',
      'thumb': 'https://unsplash.com/photos/PDRFeeDniCk/download?force=true&w=320',
    },
    {
      'code': 'Classroom-B3',
      'image': 'https://unsplash.com/photos/BWfJvlISbmk/download?force=true&w=2000',
      'thumb': 'https://unsplash.com/photos/BWfJvlISbmk/download?force=true&w=320',
    },
    {
      'code': 'Classroom-B4',
      'image': 'https://unsplash.com/photos/frGf5WHXzZI/download?force=true&w=2000',
      'thumb': 'https://unsplash.com/photos/frGf5WHXzZI/download?force=true&w=320',
    },
    {
      'code': 'Classroom-B5',
      'image': 'https://unsplash.com/photos/2uX_7L_10rM/download?force=true&w=2000',
      'thumb': 'https://unsplash.com/photos/2uX_7L_10rM/download?force=true&w=320',
    },
    {
      'code': 'Classroom-B6',
      'image': 'https://unsplash.com/photos/phwRbHF6T8Q/download?force=true&w=2000',
      'thumb': 'https://unsplash.com/photos/phwRbHF6T8Q/download?force=true&w=320',
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
