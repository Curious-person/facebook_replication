import 'package:facebook_replication/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import '../widgets/customfont.dart';


class PostCard extends StatelessWidget {
  final String userName;
  final String postContent;
  final String date;
  final String? imageUrl;
  final String? profileImageUrl;
  final int? numOfLikes;
  final bool isAds;
  final String? adsMarket;


  const PostCard({
    super.key,
    required this.userName,
    required this.postContent,
    required this.date,
    this.imageUrl,
    this.profileImageUrl,
    this.numOfLikes,
    this.isAds = false,
    this.adsMarket,
  });


  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: profileImageUrl != null
                        ? NetworkImage(profileImageUrl!)
                        : null,
                    radius: 20.r,
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        date,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.more_horiz),
                ],
              ),
              SizedBox(height: 10.h),
              Text(
                postContent,
                style: TextStyle(fontSize: 14.sp),
              ),
            if (imageUrl != null) ...[
              SizedBox(height: 10.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 250.h, 
                    minHeight: 100.h,
                  ),
                  child: Image.network(
                    imageUrl!,
                    width: double.infinity,
                    height: isAds ? 100.h : null, 
                    fit: BoxFit.cover, 
                  ),
                ),
              ),
            ],
              if (isAds && adsMarket != null) ...[
                SizedBox(height: 10.h),
                Text(
                  adsMarket!,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.h),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('More Details'),
                ),
              ],
              SizedBox(height: 10.h),
              if (!isAds) ...[
                Row(
                  children: [
                    Icon(Icons.thumb_up, size: 20.sp, color: Colors.blue),
                    SizedBox(width: 5.w),
                    Text(numOfLikes?.toString() ?? '0'),
                    Spacer(),
                    Icon(Icons.comment, size: 20.sp, color: Colors.grey),
                    SizedBox(width: 5.w),
                    Text('Comment'),
                    SizedBox(width: 10.w),
                    Icon(Icons.share, size: 20.sp, color: Colors.grey),
                    SizedBox(width: 5.w),
                    Text('Share'),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}



class NewsfeedCard extends StatefulWidget {
  final String userName;
  final String postContent;
  final String hashtag;
  final String date;

  final int comments;
  final int shares;
  int numOfLikes;
  final String? userImageUrl;
  final String imagePost;
  final bool atPost;

  

  NewsfeedCard(
      {super.key,
        required this.userName,
        required this.postContent,
        required this.hashtag,
        required this.date,
        
        this.numOfLikes = 0,
        required this.comments,
        required this.shares,
        this.userImageUrl,
        required this.imagePost,
        this.atPost = false
      });

  @override
 _NewsfeedCardState createState() => _NewsfeedCardState();
}

class _NewsfeedCardState extends State<NewsfeedCard> {
  late int _likes;

      @override
  void initState() {
    super.initState();
    _likes = widget.numOfLikes;
  }

  void _incrementLikes() {
    setState(() {
      _likes++;
      widget.numOfLikes = _likes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!widget.atPost) {
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                userName: widget.userName,
                postContent: widget.postContent,
                date: widget.date,
                numOfLikes: widget.numOfLikes,
                imageUrl: widget.imagePost,
              ),
            ),
          );
        }
      },
      child: Card(
        
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
                            child: widget.userImageUrl != null
                              ? ClipOval(
                                child: Image.network(
                                  widget.userImageUrl!,
                                  width: ScreenUtil().setSp(40),
                                  height: ScreenUtil().setSp(40),
                                  fit: BoxFit.cover,
                                ),
                              )
                              : Icon(
                                Icons.person,
                                size: ScreenUtil().setSp(20),
                                color: Colors.white,
                              ),
                            ),
                          
                    SizedBox(
                      width: ScreenUtil().setSp(10)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomFont(
                            text: widget.userName,
                            fontSize: ScreenUtil().setSp(15),
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            ),
                          Row(
                            children: [
                              CustomFont(
                                text: widget.date,
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
                  text: widget.postContent,
                  fontSize: ScreenUtil().setSp(12),
                  color: Colors.black,
                ),
              SizedBox(
                height: ScreenUtil().setSp(5)),
                CustomFont (
                  text: widget.hashtag,
                  fontSize: ScreenUtil().setSp(12),
                  color: FB_PRIMARY,
                ),
              SizedBox(
                height: ScreenUtil().setSp(5)),
              widget.imagePost != null
                  ? Image.network(
                      widget.imagePost!,
                      height: ScreenUtil().setSp(200),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Container(),
                 SizedBox(
                height: ScreenUtil().setSp(5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [           
              TextButton.icon(              
                    onPressed: () {},
                    icon: Icon(
                      Icons.thumb_up_alt_rounded,
                      color: FB_PRIMARY,
                    ),
                    //make customized text
                    label: CustomFont(
                      text: (widget.numOfLikes == 0) ? 'Like' : _likes.toString(),
                      fontSize: ScreenUtil().setSp(12),
                      color: Colors.grey.shade800,
                    ),
                  ),
      
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                  CustomFont(
                     text: widget.comments.toString(),
                     fontSize: ScreenUtil().setSp(12),
                     color: Colors.grey.shade800,
                    ),
                    SizedBox(width: ScreenUtil().setSp(5)),
                   CustomFont(
                     text: 'Comments',
                     fontSize: ScreenUtil().setSp(12),
                     color: Colors.grey.shade800,
                    ),
      
                  SizedBox(width: ScreenUtil().setSp(10)),     
                      
                  CustomFont(
                     text: widget.shares.toString(),
                     fontSize: ScreenUtil().setSp(12),
                     color: Colors.grey.shade800,
                    ),
                    SizedBox(width: ScreenUtil().setSp(5)),
                    CustomFont(
                      text: 'Shares',
                      fontSize: ScreenUtil().setSp(12),
                      color: Colors.grey.shade800,
                     ),
                  
                ],
              ),
            ],
          ),
              SizedBox(
                height: ScreenUtil().setSp(5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  
                  TextButton.icon(
                    onPressed: _incrementLikes,
                      icon:  Icon(
                      Icons.thumb_up_outlined,
                      color: Colors.grey.shade800,
                    ),
                    label: CustomFont(
                      text: 'Like',
                      fontSize: ScreenUtil().setSp(12),
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.comment_outlined,
                      color: Colors.grey.shade800,
                    ),
                    label: CustomFont(
                      text: 'Comment',
                      fontSize: ScreenUtil().setSp(12),
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.bold,
                     ),
                  ),
                   TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.share_outlined,
                      color: Colors.grey.shade800,
                    ),
                    label: CustomFont(
                      text: 'Share',
                      fontSize: ScreenUtil().setSp(12),
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.bold,
                     ),
                  ),
                ],
              ),
            Padding(
              padding: EdgeInsets.only(bottom: ScreenUtil().setSp(10)),
              child: SizedBox(
              height: ScreenUtil().setSp(5),
              child: Divider(
              color: Colors.grey.shade400, 
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
                      color: Colors.grey.shade800,
                      size: ScreenUtil().setSp(24), 
                    ),
                    label: CustomFont(
                      text: 'Most Relevant',
                      fontSize: ScreenUtil().setSp(12),
                      color: Colors.grey.shade800,
                      
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
                            child: widget.userImageUrl != null
                              ? ClipOval(
                                child: Image.network(
                                  widget.userImageUrl!,
                                  width: ScreenUtil().setSp(40),
                                  height: ScreenUtil().setSp(40),
                                  fit: BoxFit.cover,
                                ),
                              )
                              : Icon(
                                Icons.person,
                                size: ScreenUtil().setSp(20),
                                color: Colors.white,
                              ),
                            ),
                  SizedBox(
                    width: ScreenUtil().setSp(10),
                  ),
                  Container(
                    width: ScreenUtil().setSp(320),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        hintText: 'Write a comment...',
                        suffixIcon: Icon(Icons.emoji_emotions_outlined,
                        color: Colors.grey.shade500,),
                       
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ],
          ),
          ),
      ),
    );
  }
}

class AboutCard extends StatelessWidget {
  final String birthday;
  final String location;
  final String studyplace;
  final String work;
  final String relationship;


  const AboutCard(
    {super.key, required this.birthday, required this.location, required this.studyplace, required this.work, required this.relationship});

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
                        backgroundColor: Colors.grey.shade300,
                        child: Icon(
                          Icons.cake, // Replace with the desired icon
                          size: ScreenUtil().setSp(20),
                          color: Colors.black, // Set the icon color
                          ),
                        ),
                  SizedBox(
                    width: ScreenUtil().setSp(5)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomFont(
                          text: birthday,
                          fontSize: ScreenUtil().setSp(15),
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          ),
                        Row(
                          children: [
                            CustomFont(
                              text: 'Born on',
                              fontSize: ScreenUtil().setSp(8),
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              ),
                            SizedBox(
                              width: ScreenUtil().setSp(5),
                            ),
                            
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              Row(
                  children: [
                    CircleAvatar(
                        radius: ScreenUtil().setSp(20),
                        backgroundColor: Colors.grey.shade300,
                        child: Icon(
                          Icons.home, // Replace with the desired icon
                          size: ScreenUtil().setSp(20),
                          color: Colors.black, // Set the icon color
                          ),
                        ),
                  SizedBox(
                    width: ScreenUtil().setSp(10)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomFont(
                          text: location,
                          fontSize: ScreenUtil().setSp(15),
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          ),
                        Row(
                          children: [
                            CustomFont(
                              text: 'Lives in',
                              fontSize: ScreenUtil().setSp(8),
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              ),
                            SizedBox(
                              width: ScreenUtil().setSp(5),
                            ),
                        
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
            ],
          ),
            SizedBox(
              height: ScreenUtil().setSp(10)),

            Row(
                  children: [
                    CircleAvatar(
                        radius: ScreenUtil().setSp(20),
                        backgroundColor: Colors.grey.shade300,
                        child: Icon(
                          Icons.school, // Replace with the desired icon
                          size: ScreenUtil().setSp(20),
                          color: Colors.black, // Set the icon color
                          ),
                        ),
                  SizedBox(
                    width: ScreenUtil().setSp(10)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomFont(
                          text: studyplace,
                          fontSize: ScreenUtil().setSp(15),
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          ),
                        Row(
                          children: [
                            CustomFont(
                              text: 'Studied at',
                              fontSize: ScreenUtil().setSp(8),
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              ),
                            SizedBox(
                              width: ScreenUtil().setSp(5),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setSp(10),
                ),
            Row(
                  children: [
                    CircleAvatar(
                        radius: ScreenUtil().setSp(20),
                        backgroundColor: Colors.grey.shade300,
                        child: Icon(
                          Icons.work, 
                          size: ScreenUtil().setSp(20),
                          color: Colors.black, // Set the icon color
                          ),
                        ),
                  SizedBox(
                    width: ScreenUtil().setSp(10)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomFont(
                          text: work,
                          fontSize: ScreenUtil().setSp(15),
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          ),
                        Row(
                          children: [
                            CustomFont(
                              text: 'Works at',
                              fontSize: ScreenUtil().setSp(8),
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              ),
                            SizedBox(
                              width: ScreenUtil().setSp(5),
                            ),
 
                          ],
                        ),
                      ],
                    ),
                  ],
                ),          
          ],
        ),
        ),
    );
  }
  }

