import 'package:flutter/material.dart';

class Bottomnav extends StatefulWidget {
  int _currentIndex;
  Bottomnav(this._currentIndex);
  @override
  _BottomnavState createState() => _BottomnavState(this._currentIndex);
}

class _BottomnavState extends State<Bottomnav> {
  int _currentIndex;
  _BottomnavState(this._currentIndex);

  @override
  Widget build(BuildContext context) {
    void _onTabTapped(int index) {
      setState(() {
        _currentIndex = index;
      });

      switch (index) {
        case 0:
          Navigator.pushNamed(context, '/');
          break;
        case 1:
          Navigator.pushNamed(context, '/exercises');
          break;
        case 2:
          Navigator.pushNamed(context, '/quizzes');
          break;
      }
    }

    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onTabTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Lessons',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.quiz),
          label: 'Quizes',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fitness_center),
          label: 'Exercises',
        ),
      ],
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      elevation: 10,
      type: BottomNavigationBarType.fixed,
    );
  }
}
