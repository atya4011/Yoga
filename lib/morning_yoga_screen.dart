import 'package:flutter/material.dart';
import 'widgets/yoga_list_item.dart';

class MorningYogaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Morning Yoga'),
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
            image: 'assets/trikonasana.png',
            title: 'Trikonasana',
            subtitle: 'Morning Yoga | 10 min',
          ),
          YogaListItem(
            image: 'assets/padmasana.png',
            title: 'Padmasana',
            subtitle: 'Morning Yoga | 5 min',
          ),
          YogaListItem(
            image: 'assets/mudrasana.png',
            title: 'Mudrasana',
            subtitle: 'Morning Yoga | 7 min',
          ),
          YogaListItem(
            image: 'assets/ardha_matsyendrasana.png',
            title: 'Ardha Matsyendrasana',
            subtitle: 'Morning Yoga | 7 min',
          ),
          YogaListItem(
            image: 'assets/ardha_matsyendrasana.png',
            title: 'Ardha Matsyendrasana',
            subtitle: 'Morning Yoga | 7 min',
          ),
        ],
      ),
    );
  }
}
