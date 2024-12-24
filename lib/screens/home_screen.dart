import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import '../screens/newsfeed_screen.dart';
import '../widgets/customfont.dart';

//note: understand how DefaultTabController works with TabBar and TabBarView and under appbar.
//goal: to create a home screen with a tab bar and a bottom navigation bar.
// the issue: i used defaulttabcontroller and pagecontroller which is clashing in tabview

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    int _selectedIndex = 0;

  final List<Widget> _tabViews = [
    NewsfeedScreen(),
    Center(child: Text('Friends Screen')), 
    Center(child: Text('Marketplace Screen')), 
    Center(child: Text('Account Screen')), 
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
        appBar: AppBar(
            shadowColor: FB_TEXT_COLOR_WHITE,
            elevation: 2,
            title: CustomFont(
              text: 'facebook',
              fontSize: ScreenUtil(
              ).setSp(25),
                color: FB_PRIMARY,
                fontFamily: 'Klavika',
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () {
              ScaffoldMessenger.of(
                context).
                showSnackBar(
                const 
                SnackBar(content: Text(
                  'Search')),
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
          indicatorColor: FB_PRIMARY,
          labelColor: FB_PRIMARY,
          tabs: [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.video_call_outlined)),
            Tab(icon: Icon(Icons.store)),
            Tab(icon: Icon(Icons.account_circle_outlined)),
            ],
          ),
       ),
        body: TabBarView(
          children: _tabViews,
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
    ),
           ),
      );
  }

  void _onTappedBar(int value) {
    setState(() {
      _selectedIndex = value;
    });
    DefaultTabController.of(context)?.animateTo(value);
  }
}