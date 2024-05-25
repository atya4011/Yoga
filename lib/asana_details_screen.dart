import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorite_provider.dart';
import 'timer_progress_screen.dart';

class AsanaDetailsScreen extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final int calories;
  final int duration;
  final List<Map<String, dynamic>> similarAsanas;

  AsanaDetailsScreen({
    required this.image,
    required this.title,
    required this.description,
    required this.calories,
    required this.duration,
    required this.similarAsanas,
  });

  void _openTimerProgressScreen(BuildContext context, String image, String title, String description, int duration) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TimerProgressScreen(
          image: image,
          title: title,
          description: description,
          duration: duration,
        ),
      ),
    );
  }

  void _openAsanaDetailsScreen(BuildContext context, Map<String, dynamic> asana) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AsanaDetailsScreen(
          image: asana['image'],
          title: asana['title'],
          description: asana['description'],
          calories: asana['calories'],
          duration: asana['duration'],
          similarAsanas: asana['similarAsanas'],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final isFavorite = favoriteProvider.isFavorite(title);

    return Scaffold(
      appBar: AppBar(
        title: Text('Asana Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(image, fit: BoxFit.cover, width: double.infinity, height: 300),
                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                    icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border, color: Colors.red),
                    onPressed: () {
                      if (isFavorite) {
                        favoriteProvider.removeFavorite(title);
                      } else {
                        favoriteProvider.addFavorite({
                          'image': image,
                          'title': title,
                          'description': description,
                          'calories': calories,
                          'duration': duration,
                          'similarAsanas': similarAsanas,
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () => _openTimerProgressScreen(context, image, title, description, duration),
              child: Text(
                title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.local_fire_department, color: Colors.orange),
                SizedBox(width: 4),
                Text('$calories kcal', style: TextStyle(fontSize: 16)),
                SizedBox(width: 16),
                Icon(Icons.timer, color: Colors.blue),
                SizedBox(width: 4),
                Text('$duration min', style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Similar Asanas',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ...similarAsanas.map((asana) {
              return GestureDetector(
                onTap: () => _openAsanaDetailsScreen(context, asana),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    leading: Image.asset(asana['image'], width: 50, height: 50, fit: BoxFit.cover),
                    title: Text(asana['title'], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    subtitle: Text('${asana['duration']} min', style: TextStyle(fontSize: 16)),
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
