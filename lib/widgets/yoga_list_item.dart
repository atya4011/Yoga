import 'package:flutter/material.dart';
import '../asana_details_screen.dart';

class YogaListItem extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  YogaListItem({required this.image, required this.title, required this.subtitle});

  void _openAsanaDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AsanaDetailsScreen(
          image: image,
          title: title,
          description: 'This is the detailed description for $title.',
          calories: 135,
          duration: 5,
          similarAsanas: [
            {
              'image': 'assets/dhanurasana.png',
              'title': 'Dhanurasana',
              'description': 'Derived from the Sanskrit word "Dhanush", meaning bow.',
              'calories': 120,
              'duration': 6,
              'similarAsanas': [
                {
                  'image': 'assets/kurmasana.png',
                  'title': 'Kurmasana',
                  'description': 'Derived from the Sanskrit word "kurma", meaning turtle.',
                  'calories': 110,
                  'duration': 7,
                  'similarAsanas': [],
                },
              ],
            },
            {
              'image': 'assets/kurmasana.png',
              'title': 'Kurmasana',
              'description': 'Derived from the Sanskrit word "kurma", meaning turtle.',
              'calories': 110,
              'duration': 7,
              'similarAsanas': [
                {
                  'image': 'assets/dhanurasana.png',
                  'title': 'Dhanurasana',
                  'description': 'Derived from the Sanskrit word "Dhanush", meaning bow.',
                  'calories': 120,
                  'duration': 6,
                  'similarAsanas': [],
                },
              ],
            },
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openAsanaDetails(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          leading: Image.asset(image, width: 80, height: 80, fit: BoxFit.cover),
          title: Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
