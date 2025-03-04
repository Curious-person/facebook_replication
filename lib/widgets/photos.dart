import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import '../widgets/customfont.dart';

class PhotoGrid extends StatelessWidget {
  const PhotoGrid({super.key});

  @override
  Widget build(BuildContext context) {
return CustomScrollView(
  primary: false,
  slivers: <Widget>[
    SliverPadding(
      padding: const EdgeInsets.all(20),
      sliver: SliverGrid.count(
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          Container(
            child: Image.asset('assets/images/1.jpg'),
          ),
          Container(
            child: Image.asset('assets/images/2.jpg'),
          ),
          Container(
            child: Image.asset('assets/images/3.jpg'),
          ),
          Container(
            child: Image.asset('assets/images/4.jpg'),
          ),
          Container(
            child: Image.asset('assets/images/5.jpg'),
          ),
          Container(
            child: Image.asset('assets/images/6.jpg'),
          ),

        ],
      ),
    ),
  ],
);
  }
}