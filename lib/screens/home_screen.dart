import 'package:flutter/material.dart';
import 'package:pushitup/components/reusable_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../components/reusable_card.dart';
import 'analytics_screen.dart';
import 'camera_screen.dart';
import 'challenge_screen.dart';
import 'goals_screen.dart';
import 'leaderboard_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _auth = FirebaseAuth.instance;
  User? loggedInUser;

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() { // this may need to be asynchronous, be advised
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    }
    catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, $loggedInUser!'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        Navigator.pushNamed(context, ChallengeScreen.id);
                      },
                      cardChild: Text('Daily Challenge'),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        Navigator.pushNamed(context, CameraScreen.id);
                      },
                      cardChild: Text('Push It Up!'),
                    ),
                  ),
                ],
              )
          ),
          Expanded(
            child: ReusableCard(
              onPress: () {
                Navigator.pushNamed(context, LeaderboardScreen.id);
              },
              cardChild: ,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      Navigator.pushNamed(context, AnalyticsScreen.id);
                    },
                    cardChild: ,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      Navigator.pushNamed(context, GoalsScreen.id);
                    },
                    cardChild: ,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
