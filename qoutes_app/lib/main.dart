import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MotivationApp());

class MotivationApp extends StatelessWidget {
  const MotivationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Motivation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        textTheme: TextTheme(bodyLarge: TextStyle(fontSize: 20)),
      ),
      home: QuoteScreen(),
    );
  }
}

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuoteScreenState createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  final List<String> quotes = [
    "Believe in yourself and all that you are.",
    "Your only limit is your mind.",
    "Push yourself, because no one else is going to do it for you.",
    "Success doesn’t just find you. You have to go out and get it.",
    "Dream it. Wish it. Do it.",
    "Stay focused and never give up.",
    "The harder you work for something, the greater you’ll feel when you achieve it.",
    "Great things never come from comfort zones.",
    "Don’t stop when you’re tired. Stop when you’re done.",
    "Wake up with determination. Go to bed with satisfaction.",
    "It always seems impossible until it’s done.",
    "Do something today that your future self will thank you for.",
    "Success is not for the lazy.",
    "Small steps every day lead to big results.",
    "Push through the pain to get to the reward.",
    "Make each day your masterpiece.",
    "Discipline is choosing between what you want now and what you want most.",
    "You are capable of amazing things.",
    "Doubt kills more dreams than failure ever will.",
    "Turn your wounds into wisdom.",
    "If you can dream it, you can do it.",
    "Start where you are. Use what you have. Do what you can.",
    "A little progress each day adds up to big results.",
    "Your potential is endless.",
    "Never give up on a dream just because of the time it will take to accomplish it.",
    "You don’t have to be perfect to be amazing.",
    "One day or day one — you decide.",
    "Success is the sum of small efforts repeated day in and day out.",
    "Your future is created by what you do today, not tomorrow.",
    "Act as if what you do makes a difference. It does.",
    "Keep going. Everything you need will come to you at the perfect time.",
    "Strive for progress, not perfection.",
    "Hard work beats talent when talent doesn’t work hard.",
  ];

  String dailyQuote = "";
  Random random = Random();

  @override
  void initState() {
    super.initState();
    _loadDailyQuote();
  }

  void _loadDailyQuote() {
    int dayOfMonth = DateTime.now().day;
    setState(() {
      dailyQuote = quotes[dayOfMonth % quotes.length];
    });
  }

  void _loadRandomQuote() {
    setState(() {
      dailyQuote = quotes[random.nextInt(quotes.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daily Motivation"), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.format_quote, size: 50, color: Colors.deepPurple),
              SizedBox(height: 20),
              Text(
                '"$dailyQuote"',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: _loadRandomQuote,
                icon: Icon(Icons.refresh),
                label: Text("Refresh"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
