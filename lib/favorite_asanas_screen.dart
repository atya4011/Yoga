import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'asana_details_screen.dart';
import 'favorite_provider.dart';

class FavoriteAsanasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final favorites = favoriteProvider.favorites;

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Asanas'),
      ),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final asana = favorites[index];
          return ListTile(
            leading: Image.asset(asana['image'], width: 50, height: 50, fit: BoxFit.cover),
            title: Text(asana['title'], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            subtitle: Text('${asana['duration']} min', style: TextStyle(fontSize: 16)),
            onTap: () {
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
            },
          );
        },
      ),
    );
  }
}
