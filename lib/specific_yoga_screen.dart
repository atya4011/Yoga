import 'package:flutter/material.dart';
import 'widgets/yoga_list_item.dart';

class SpecificYogaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yoga For Specific Part Of Body'),
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
            image: 'assets/back_pain.png',
            title: 'Back Pain',
            subtitle: 'Yoga for specific part of body',
          ),
          YogaListItem(
            image: 'assets/neck_pain.png',
            title: 'Neck Pain',
            subtitle: 'Yoga for specific part of body',
          ),
          YogaListItem(
            image: 'assets/stress_relief.png',
            title: 'Stress Relief',
            subtitle: 'Yoga for specific part of body',
          ),
          YogaListItem(
            image: 'assets/insomnia.png',
            title: 'Insomnia',
            subtitle: 'Yoga for specific part of body',
          ),
        ],
      ),
    );
  }
}
