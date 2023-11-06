import 'package:flutter/material.dart';
import 'package:movies_app/screens/home_screen/home_tabs/browse_tab.dart';
import 'package:movies_app/screens/home_screen/home_tabs/home_tab.dart';
import 'package:movies_app/screens/home_screen/home_tabs/search_tab.dart';
import 'package:movies_app/screens/home_screen/home_tabs/watch_list_tab.dart';
import 'package:movies_app/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  List<Widget> tabs =[const HomeTab(),const SearchTab(),const BrowseTab(),const WatchListTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: navBackGround,
        child: BottomNavigationBar(

            currentIndex: index,
            onTap: (value){
              setState(() {
                index=value;
              });
            },

            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
              BottomNavigationBarItem(icon: Icon(Icons.movie),label: "Browse"),
              BottomNavigationBarItem(icon: Icon(Icons.bookmark_border),label: "Watch List"),
            ]),
      ),
      body: tabs[index],
    );
  }
}
