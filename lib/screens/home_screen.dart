import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import '../screens/newsfeed_screen.dart';
import '../widgets/customfont.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    int _selectedIndex = 0;
    final PageController _pageController = PageController();

  List<String> titles = <String> [
  'Home',
  'Friends',
];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
        appBar: AppBar(
            shadowColor: FB_TEXT_COLOR_WHITE,
            elevation: 2,
            title: CustomFont(text: 'facebook', fontSize: ScreenUtil(
          ).setSp(25), color: FB_PRIMARY, fontFamily: 'Klavika',
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Search')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.chat),
            tooltip: 'Message',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Message')),
              );
            },
          ),
        ],
        bottom: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.home), text: 'Home'),
            Tab(icon: Icon(Icons.people), text: 'Friends'),
            ],
          ),
       ),
       ),
      ),
       body: const TabBarView(
        controller: _pageController,
        children: const <Widget> [
            NewsfeedScreen(),
        ],
        onPageChanged: (index) {
            setState(() {
                _selectedIndex = index;
            });
        },
       ),
       bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onTappedBar,
        items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: 'Notifications'),
        ],
        selectedItemColor: FB_PRIMARY,
        currentIndex: _selectedIndex,
       ),
    );
    // Synchronize BottomNavigationBar with TabBar
    DefaultTabController.of(context)?.animateTo(index);
  }

  void _onTappedBar(int value) {
    setState(() {
      _selectedIndex = value;
    });
    _pageController.jumpToPage(value);
  }
}