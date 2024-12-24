import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import '../widgets/customfont.dart';

class NewsfeedCard extends StatelessWidget {
  final String userName;
  final String postContent;
  final String hashtag;
  final String date;
  final Image? userImage;

  const NewsfeedCard(
      {super.key, required this.userName, required this.postContent, required this.hashtag, required this.date, this.userImage});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(ScreenUtil().setSp(10)),
      child: Padding(
        padding: EdgeInsets.all(ScreenUtil().setSp(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                          radius: ScreenUtil().setSp(20),
                          backgroundColor: FB_DARK_PRIMARY,
                          child: Placeholder(
                            fallbackHeight: ScreenUtil().setSp(20),
                            fallbackWidth: ScreenUtil().setSp(20),
                            color: Colors.red,
                          ),
                        ),
                  SizedBox(
                    width: ScreenUtil().setSp(10)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomFont(
                          text: userName,
                          fontSize: ScreenUtil().setSp(15),
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          ),
                        Row(
                          children: [
                            CustomFont(
                              text: date,
                              fontSize: ScreenUtil().setSp(8),
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              ),
                            SizedBox(
                              width: ScreenUtil().setSp(5),
                            ),
                            //place globe icon 
                            Padding(
                              padding: EdgeInsets.only(bottom: ScreenUtil().setSp(4)),
                              child: Icon(
                                Icons.public,
                                size: ScreenUtil().setSp(8), 
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              //place icon here
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz,
                    color: FB_DARK_PRIMARY,
                  ),
                ),
            ],
          ),       
            SizedBox(
              height: ScreenUtil().setSp(5)),
              CustomFont (
                text: postContent,
                fontSize: ScreenUtil().setSp(12),
                color: Colors.black,
              ),
            SizedBox(
              height: ScreenUtil().setSp(5)),
              CustomFont (
                text: hashtag,
                fontSize: ScreenUtil().setSp(12),
                color: FB_PRIMARY,
              ),
            SizedBox(
              height: ScreenUtil().setSp(5)),
              Placeholder(
                fallbackHeight: ScreenUtil().setSp(200),
                fallbackWidth: ScreenUtil().setSp(200),
              ),
               SizedBox(
              height: ScreenUtil().setSp(5)),
        Row(
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
          Padding(
            padding: EdgeInsets.only(bottom: ScreenUtil().setSp(10)),
            child: SizedBox(
            height: ScreenUtil().setSp(5),
            child: Divider(
            color: Colors.grey, 
            thickness: 1.0,
                    ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
                  TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_drop_down_rounded,
                    color: FB_DARK_PRIMARY,
                    size: ScreenUtil().setSp(24), 
                  ),
                  label: CustomFont(
                    text: 'Most Relevant',
                    fontSize: ScreenUtil().setSp(12),
                    color: FB_DARK_PRIMARY,
                    
                   ),
                ),             
            ],
          ),
          SizedBox(
            height: ScreenUtil().setSp(5),
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
                      hintText: 'Write a comment...',
                      suffixIcon: const Icon(Icons.emoji_emotions_outlined),
                     
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