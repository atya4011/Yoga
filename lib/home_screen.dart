import 'package:flutter/material.dart';
import 'widgets/header.dart';
import 'widgets/category_card.dart';
import 'widgets/horizontal_list_section.dart' as horizontal_list;
import 'morning_yoga_screen.dart';
import 'daily_yoga_screen.dart';
import 'specific_yoga_screen.dart';
import 'favorite_asanas_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _widgetOptions(BuildContext context) {
    return <Widget>[
      SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            _buildBeginnerSection(context),
            horizontal_list.HorizontalListSection(
              title: 'Yoga For Sports',
              items: ['Soccer', 'Cricket','Tennis','BasketBall' ],
            ),
            horizontal_list.HorizontalListSection(
              title: 'Intermediate',
              items: ['Energy Booster', 'Yoga For Flexibility'],
            ),
            horizontal_list.HorizontalListSection(
              title: 'Advanced',
              items: ['But Toner', 'Yoga Flow'],
            ),
            horizontal_list.HorizontalListSection(
              title: 'Trending',
              items: ['Power Flow', 'Moon Salutation'],
            ),
            horizontal_list.HorizontalListSection(
              title: 'Improve Balance',
              items: ['Balancing Yoga', 'Core Balance'],
            ),
            horizontal_list.HorizontalListSection(
              title: 'Find Relaxation',
              items: ['Yoga For Anxiety', 'Bedtime Yoga'],
            ),
          ],
        ),
      ),
      FavoriteAsanasScreen(),
      ProfileScreen(),
    ];
  }

  Widget _buildBeginnerSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MorningYogaScreen()),
              );
            },
            child: CategoryCard(title: 'Morning Yoga', color: Colors.red),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DailyYogaScreen()),
              );
            },
            child: CategoryCard(title: '15 Min Daily Yoga', color: Colors.blue),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SpecificYogaScreen()),
              );
            },
            child: CategoryCard(title: 'Yoga For Specific Part', color: Colors.indigo),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: _widgetOptions(context).elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}
