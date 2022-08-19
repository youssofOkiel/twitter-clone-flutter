import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitterapp/Models/Tweet.dart';
import 'package:twitterapp/Models/UserModel.dart';
import 'package:twitterapp/Services/auth.dart';
import 'package:twitterapp/Services/firebase.dart';
import 'package:twitterapp/Widgets/TweetContainer.dart';
import 'package:twitterapp/components/feed.dart';
import 'package:twitterapp/components/login.dart';

class ProfileScreen extends StatefulWidget {
  final String profileId;
  final String visitedUserId;

  const ProfileScreen({Key? key,required this.profileId,required this.visitedUserId})
      : super(key: key);
  @override
  ProfileScreenState createState() => ProfileScreenState();
}


class ProfileScreenState extends State<ProfileScreen> {
  int _followersCount = 0;
  int _followingCount = 0;
  bool _isFollowing = false;
  int _profileSegmentedValue = 0;
  List  _allTweets = [];

  Map<int, Widget> _profileTabs = <int, Widget>{
    0: Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        'Tweets',
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    ),
    1: Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        'Media',
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    ),
  };

  Widget buildProfileWidgets(UserModel user) {
    switch (_profileSegmentedValue) {
      case 0:
        return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _allTweets.length,
            itemBuilder: (context, index) {
              return TweetContainer(
                profileId: widget.profileId,
                user: user,
                tweet: _allTweets[index],
              );
            });
        break;
      case 1:
        return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _allTweets.length,
            itemBuilder: (context, index) {
              return TweetContainer(
                profileId: widget.profileId,
                user: user,
                tweet: _allTweets[index],
              );
            });
        break;
      default:
        return Center(
            child: Text('Something wrong', style: TextStyle(fontSize: 25)));
        break;
    }
  }

  getFollowersCount() async {
    int followersCount =
        await FirebaseServices.followingNum(widget.visitedUserId);
    if (mounted) {
      setState(() {
        _followersCount = followersCount;
      });
    }
  }

  setupIsFollowing() async {
    // bool isFollowingThisUser = await FirebaseServices.isFollowingUser(
    //     widget.profileId, widget.visitedUserId);
    setState(() {
      _isFollowing = false;
    });
  }

  getAllTweets() async {
    List userTweets =
        await FirebaseServices.getHomeTweets();
    if (mounted) {
      setState(() {
        _allTweets = userTweets;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getFollowersCount();
    setupIsFollowing();
    getAllTweets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder(
          future: FirebaseFirestore.instance.collection('users').doc(widget.profileId).get(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Color(0xff00acee)),
                ),
              );
            }
            UserModel userModel = UserModel.fromDoc(snapshot.data);
            return ListView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color(0xff00acee),
                    image: userModel.wallpaper.isEmpty
                        ? null
                        : DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(userModel.wallpaper),
                          ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox.shrink(),
                        widget.profileId == widget.visitedUserId
                            ? PopupMenuButton(
                                icon: Icon(
                                  Icons.more_horiz,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                itemBuilder: (_) {
                                  return <PopupMenuItem<String>>[
                                    new PopupMenuItem(
                                      child: Text('Logout'),
                                      value: 'logout',
                                    )
                                  ];
                                },
                                onSelected: (selectedItem) {
                                  if (selectedItem == 'logout') {
                                    AuthService.logout();
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MyHomePage()));
                                  }
                                },
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                ),
                Container(
                  transform: Matrix4.translationValues(0.0, -40.0, 0.0),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            radius: 45,
                            backgroundImage: NetworkImage(userModel.photoURL),
                          ),
                          widget.profileId == widget.visitedUserId
                              ? GestureDetector(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MyFeedPage(profileId: widget.profileId),
                                      ),
                                    );
                                    setState(() {});
                                  },
                                  child: Container(
                                    width: 100,
                                    height: 35,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      border: Border.all(color:  Color(0xff00acee)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Edit',
                                        style: TextStyle(
                                          fontSize: 17,
                                          color:  Color(0xff00acee),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : GestureDetector(
                                  child: Container(
                                    width: 100,
                                    height: 35,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: _isFollowing
                                          ? Colors.white
                                          :  Color(0xff00acee),
                                      border: Border.all(color:  Color(0xff00acee)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        _isFollowing ? 'Following' : 'Follow',
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: _isFollowing
                                              ?  Color(0xff00acee)
                                              : Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        userModel.username,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        userModel.bio,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            '$_followingCount Following',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 2,
                            ),
                          ),
                          SizedBox(width: 20),
                          Text(
                            '$_followersCount Followers',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: CupertinoSlidingSegmentedControl(
                          groupValue: _profileSegmentedValue,
                          thumbColor:  Color(0xff00acee),
                          backgroundColor: Colors.blueGrey,
                          children: _profileTabs,
                          onValueChanged: (i) {
                            setState(() {
                              _profileSegmentedValue = 0 ;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
                buildProfileWidgets(userModel),
              ],
            );
          },
        ));
  }
}
