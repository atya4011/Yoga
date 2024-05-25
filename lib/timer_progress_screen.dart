import 'package:flutter/material.dart';
import 'dart:async';

class TimerProgressScreen extends StatefulWidget {
  final String image;
  final String title;
  final String description;
  final int duration;

  TimerProgressScreen({
    required this.image,
    required this.title,
    required this.description,
    required this.duration,
  });

  @override
  _TimerProgressScreenState createState() => _TimerProgressScreenState();
}

class _TimerProgressScreenState extends State<TimerProgressScreen> {
  late int _remainingTime;
  late Timer _timer;
  bool _isTimerRunning = false;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.duration;
  }

  void _startTimer() {
    if (_isTimerRunning) return;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        _timer.cancel();
        _showTimerCompletedDialog();
      }
    });

    setState(() {
      _isTimerRunning = true;
    });
  }

  void _showTimerCompletedDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Time's up!"),
          content: Text("The timer for ${widget.title} has finished."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer and Progress Screen'),
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
              alignment: Alignment.center,
              children: [
                Image.asset(widget.image, fit: BoxFit.cover),
                Positioned(
                  right: 16,
                  top: 16,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${_remainingTime}s',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              widget.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(5, (index) {
                return Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.orange[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('Day ${index + 1}', style: TextStyle(fontSize: 16)),
                );
              }),
            ),
            SizedBox(height: 16),
            Text(
              widget.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: _startTimer,
                child: Text("Start Timer"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
