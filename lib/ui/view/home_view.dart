import 'package:flutter/material.dart';
import 'package:mood_tracker/core/Navigation.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  Widget _iconButton({title, icon, onPress}) {
    return Center(child: GestureDetector(onTap: onPress, child: Column(children: [Icon(icon), Text(title)])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 4,
        children: [
          _iconButton(
              title: "Add Mood",
              icon: Icons.add,
              onPress: () {
                Navigator.pushNamed(context, Navigation.CREATE_MOOD_VIEW);
              })
        ],
      ),
    );
  }
}