import 'package:facebook_replication/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/notification.dart';


class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
    children: const [
      NotificationItem(
        name: 'John Doe Doe',
        post: 'Sample post',
        description: 'Sample description',
        date: '2023-10-10',
        numOfLikes: 10,
        imageUrl: "../assets/images/1.jpg",
        profileImageUrl: '../assets/images/1.jpg',
      ),
    ],
    );
  }
}