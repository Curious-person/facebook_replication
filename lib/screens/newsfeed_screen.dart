import 'package:flutter/material.dart';
import '../widgets/post_card.dart';

class NewsfeedScreen extends StatelessWidget {


  const NewsfeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children:  [
        NewsfeedCard(
          userName: 'John Doe Doe',
          date: 'December 24',
          postContent: 'Hello, this is my first post on Facebook.',
          numOfLikes: 42,
          comments: 100,
          shares: 65,
          hashtag: '#flutter',
          imagePost: 'assets/images/5.jpg',

        ),
        NewsfeedCard(
          userName: 'Juana Herrero',
          date: 'October 29',
          postContent: 'Flutter es muy bueno.',
          numOfLikes: 17,
          comments: 3,
          shares: 10,
          hashtag: '#meamoflutter',
          imagePost: 'assets/images/2.jpg',

        ),
      ],
    );
  }
}

class ProfileSection extends StatelessWidget {
  const ProfileSection ({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children:  [
        NewsfeedCard(
          userName: 'Juan Kevinito Abad',
          date: 'December 16',
          postContent: 'Hello, this is my first post on Facebook.',
          numOfLikes: 45,
          comments: 106,
          shares: 65,
          hashtag: '#flutter',
          imagePost: 'assets/images/3.jpg',
        ),
      ],
    );
  }
}

class AboutFeed extends StatelessWidget {
  const AboutFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        AboutCard(
          birthday: 'December 24',
          location: 'Cebu City',
          studyplace: 'University of San Carlos',
          work: 'Freelancer',
          relationship: 'Single',
          
        ),
      ],
    );
  }
}