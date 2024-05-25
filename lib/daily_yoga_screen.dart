import 'package:flutter/material.dart';
import 'widgets/yoga_list_item.dart';

class DailyYogaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('15 Minute Daily Yoga'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          YogaListItem(
            image: 'assets/balasana.png',
            title: 'Balasana',
            subtitle: '15 Min Daily Yoga | 6 min',
          ),
          YogaListItem(
            image: 'assets/navasana.png',
            title: 'Navasana',
            subtitle: '15 Min Daily Yoga | 8 min',
          ),
          YogaListItem(
            image: 'assets/headstand.png',
            title: 'Headstand',
            subtitle: '15 Min Daily Yoga | 4 min',
          ),
          YogaListItem(
            image: 'assets/sukhasana.png',
            title: 'Sukhasana',
            subtitle: '15 Min Daily Yoga | 7 min',
          ),
          YogaListItem(
            image: 'assets/naukasana.png',
            title: 'Naukasana',
            subtitle: '15 Min Daily Yoga | 6 min',
          ),
        ],
      ),
    );
  }
}
