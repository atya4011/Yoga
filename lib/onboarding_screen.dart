import 'package:flutter/material.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  List<Map<String, String>> onboardingData = [
    {
      "image": "assets/onboarding1.png",
      "title": "Track Your Goal",
      "description": "Don't worry if you have trouble determining your goals. We can help you determine your goals and track your goals."
    },
    {
      "image": "assets/onboarding2.png",
      "title": "Get Burn",
      "description": "Let's keep burning, to achieve your goals. It hurts only temporarily, if you give up now you will be in pain forever."
    },
    {
      "image": "assets/onboarding3.png",
      "title": "Eat Well",
      "description": "Let's start a healthy lifestyle with us, we can determine your diet every day. Healthy eating is fun."
    },
    {
      "image": "assets/onboarding4.png",
      "title": "Improve Sleep Quality",
      "description": "Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning.",
      "isLast": "true"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            _currentPage = value;
          });
        },
        itemCount: onboardingData.length,
        itemBuilder: (context, index) => OnboardingContent(
          image: onboardingData[index]["image"]!,
          title: onboardingData[index]["title"]!,
          description: onboardingData[index]["description"]!,
          isLast: onboardingData[index]["isLast"] == "true",
          currentPage: _currentPage,
          totalPages: onboardingData.length,
          onNextPressed: () {
            if (index == onboardingData.length - 1) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            } else {
              _pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            }
          },
        ),
      ),
    );
  }
}

class OnboardingContent extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final bool isLast;
  final int currentPage;
  final int totalPages;
  final VoidCallback onNextPressed;

  OnboardingContent({
    required this.image,
    required this.title,
    required this.description,
    this.isLast = false,
    required this.currentPage,
    required this.totalPages,
    required this.onNextPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image),
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            totalPages,
            (index) => buildDot(index: index, currentPage: currentPage),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: onNextPressed,
          child: Text(isLast ? "Login" : "Next"),
        ),
      ],
    );
  }

  Container buildDot({required int index, required int currentPage}) {
    return Container(
      height: 10,
      width: 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
