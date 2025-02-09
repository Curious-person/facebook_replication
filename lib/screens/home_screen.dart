import 'package:facebook_replication/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import '../screens/newsfeed_screen.dart';
import '../widgets/customfont.dart';
import 'notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
    int _selectedIndex = 0;
    late TabController _tabController;

  final List<Widget> _tabViews = [
    NewsfeedScreen(),
    NotificationScreen(), 
    ProfileScreen(),
  ];

    @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
          controller: _tabController,
          indicatorColor: FB_PRIMARY,
          labelColor: FB_PRIMARY,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          tabs: const [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.notifications)),
            Tab(icon: Icon(Icons.account_circle_outlined)),
            ],
          ),
       ),
        body: TabBarView(
          controller: _tabController,
          children: _tabViews,
       ),

       bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onTappedBar,
        items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: FB_PRIMARY,
        currentIndex: _selectedIndex,
       ),
    ),
           ),
      );
  }

  void _onTappedBar(int index) {
    setState(() {
      _selectedIndex = index;
      _tabController.animateTo(index);
    });
    
  }
}

