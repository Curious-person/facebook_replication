import 'package:flutter/material.dart';
import '../widgets/newsfeed.dart';

class NewsfeedScreen extends StatelessWidget {
  const NewsfeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        NewsfeedCard(
          userName: 'John Doe',
          postContent: 'Hello, this is my first post on Facebook.'
        ),
        NewsfeedCard(
          userName: 'Jane Smith',
          postContent: 'Flutter es muy bueno.'
        ),
      ],
    );
  }
}