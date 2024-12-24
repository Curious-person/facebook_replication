import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import '../widgets/customfont.dart';

class NewsfeedCard extends StatelessWidget {
  final String userName;
  final String postContent;
  final Image? userImage;

  const NewsfeedCard(
      {super.key, required this.userName, required this.postContent, this.userImage});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(ScreenUtil().setSp(10)),
      child: Padding(
        padding: EdgeInsets.all(ScreenUtil().setSp(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFont(
              text: userName,
              fontSize: ScreenUtil().setSp(15),
              color: Colors.black,
              fontWeight: FontWeight.bold,
              ),
            SizedBox(
              height: ScreenUtil().setSp(5)),
              CustomFont (
                text: postContent,
                fontSize: ScreenUtil().setSp(12),
                color: Colors.black,
              ),
              Placeholder(
                fallbackHeight: ScreenUtil().setSp(200),
                fallbackWidth: ScreenUtil().setSp(200),
              ),
            SizedBox(
              height: ScreenUtil().setSp(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.thumb_up,
                    color: FB_DARK_PRIMARY,
                  ),
                  label: CustomFont(
                    text: 'Like',
                    fontSize: ScreenUtil().setSp(12),
                    color: FB_DARK_PRIMARY,
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.comment,
                    color: FB_DARK_PRIMARY,
                  ),
                  label: CustomFont(
                    text: 'Comment',
                    fontSize: ScreenUtil().setSp(12),
                    color: FB_DARK_PRIMARY,
                   ),
                ),
                 TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    color: FB_DARK_PRIMARY,
                  ),
                  label: CustomFont(
                    text: 'Share',
                    fontSize: ScreenUtil().setSp(12),
                    color: FB_DARK_PRIMARY,
                   ),
                ),
              ],
            ),
          Container(
            child: Row(
              children: [
                CircleAvatar(
                  radius: ScreenUtil().setSp(20),
                  backgroundColor: FB_DARK_PRIMARY,
                  child: IconButton(
                    icon: const Icon(
                      Icons.thumb_up,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setSp(10),
                ),
                Container(
                  width: ScreenUtil().setSp(300),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      hintText: 'Enter a search term',
                    ),
                  ),
                ),
              ],
            ),
          ),
          ],
        ),
        ),
    );
  }
}