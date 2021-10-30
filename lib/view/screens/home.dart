import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oauth_with_bloc/bloc/login_cubit/login_cubit.dart';
import 'package:oauth_with_bloc/view/screens/tabs/breed_search_tab.dart';
import 'package:oauth_with_bloc/view/screens/tabs/breeds_tab.dart';
import 'package:oauth_with_bloc/view/screens/tabs/profile_tab.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> _tabs = [
    const BreedTab(),
    const BreedSearchTab(),
    const ProfileTab(),
  ];
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: _tabs[selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedTab,
        onTap: (i) {
          setState(() {
            selectedTab = i;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'breeds search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'breeds search',
          ),
        ],
      ),
    );
  }
}
