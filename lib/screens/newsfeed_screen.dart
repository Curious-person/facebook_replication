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
          date: 'December 24',
          postContent: 'Hello, this is my first post on Facebook.',
          likes: 42,
          comments: 100,
          shares: 65,
          hashtag: '#flutter'
        ),
        NewsfeedCard(
          userName: 'Juana Herrero',
          date: 'October 29',
          postContent: 'Flutter es muy bueno.',
          likes: 17,
          comments: 3,
          shares: 10,
          hashtag: '#meamoflutter',
        ),
      ],
    );
  }
}