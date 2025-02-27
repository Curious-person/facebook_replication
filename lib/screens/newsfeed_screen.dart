import 'package:flutter/material.dart';
import '../widgets/post_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        PostCard(
          userName: 'Robert Juanatas',
          postContent: 'Kicking off this NU Manila heat session with GDGoC Boracay Special!',
          numOfLikes: 42,
          date: 'March 24',
        ),

        PostCard(
          userName: 'Ruben Ali',
          postContent: 'Coming soon...',
          
          date: 'September 11',
        ),
        CarouselSlider(
            options: CarouselOptions(
              enableInfiniteScroll: false, height: 308.h, padEnds: false),
              items: carouselItems(),
          ),
          SizedBox(
            height: 20.h,
          )
      ],
    );
  }
  List<Widget> carouselItems() {
    return [
      PostCard(
        userName: 'Juan Kevinit Abad',
        imageUrl: 'https://realismtoday.com/wp-content/uploads/2021/12/how-to-paint-realistic-portraits-Cesar-Santos-121621-696x1041.jpg',
        profileImageUrl: 'https://realismtoday.com/wp-content/uploads/2021/12/how-to-paint-realistic-portraits-Cesar-Santos-121621-696x1041.jpg',
        postContent: 'Hello, this is my first post on Facebook.',
        date: 'October 11',
        isAds: true,
        adsMarket: 'Flutter Philippines',
      ),
        PostCard(
        userName: 'Juan Kevinit Abad',
        imageUrl: 'assets/images/1.jpg',
        profileImageUrl: 'assets/images/1.jpg',
        postContent: 'Hello, this is my first post on Facebook.',
        date: 'October 11',
        isAds: true,
        adsMarket: 'Flutter Philippines',
      ),
        PostCard(
        userName: 'Juan Kevinit Abad',
        imageUrl: 'assets/images/1.jpg',
        profileImageUrl: 'assets/images/1.jpg',
        postContent: 'Hello, this is my first post on Facebook.',
        date: 'October 11',
        isAds: true,
        adsMarket: 'Flutter Philippines',
      ),
    ];
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