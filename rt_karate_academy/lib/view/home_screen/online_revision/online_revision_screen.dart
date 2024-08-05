import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rt_karate_academy/controller/home/video/video_services.dart';
import 'package:rt_karate_academy/util/colors.dart';
import 'package:rt_karate_academy/view/common_widgets/back_button.dart';
import 'package:video_player/video_player.dart';

class OnlineRevisionScreen extends StatefulWidget {
  const OnlineRevisionScreen({super.key});

  @override
  State<OnlineRevisionScreen> createState() => _OnlineRevisionScreenState();
}

class _OnlineRevisionScreenState extends State<OnlineRevisionScreen> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    // flickManager =
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: backgroundGradient),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackCommonButton(onTap: () {
                    Navigator.pop(context, true);
                  }),
                  const Text(
                    'Online Revision',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 50,
                  )
                ],
              ),
            ),
            Expanded(
                child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: FutureBuilder(
                  builder: (context, snapshot) {
                    return ListView.builder(
                        itemCount: snapshot.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                            child: SizedBox(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        radius: 25,
                                        backgroundImage: NetworkImage(
                                            'https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg'),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Academy',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(DateFormat('dd/MM/yyyy')
                                              .format((snapshot.data![index]
                                                      ["time"] as Timestamp)
                                                  .toDate())
                                              .toString())
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Karate Kids Tutorial',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Dialog(
                                              backgroundColor: Colors.white,
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 400,
                                                child: FlickVideoPlayer(
                                                  flickManager: FlickManager(
                                                      videoPlayerController:
                                                          VideoPlayerController
                                                              .networkUrl(
                                                    Uri.parse(snapshot
                                                        .data![index]["url"]),
                                                  )),
                                                ),
                                              ),
                                            );
                                          });
                                    },
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: 200,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      'https://media.istockphoto.com/id/1139651255/photo/martial-arts-fighter.jpg?s=612x612&w=0&k=20&c=3MytyIWBuaUsEyEW7csYrnBhKPgCs_X3K5ZS82UN8Gg='))),
                                        ),
                                        Positioned(
                                          top: 0,
                                          bottom: 0,
                                          left: 0,
                                          right: 0,
                                          child: Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                width: 60,
                                                height: 60,
                                                decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.5),
                                                        spreadRadius: 2,
                                                        blurRadius: 5,
                                                        offset: const Offset(0,
                                                            3), // changes position of shadow
                                                      ),
                                                    ],
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100)),
                                                child: const Center(
                                                  child: Icon(
                                                    Icons.play_arrow,
                                                    size: 30,
                                                  ),
                                                ),
                                              )),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  future: OnlineRevisionServices().fetchVideoData(),
                ),
              ),
            ))
          ],
        ),
      )),
    );
  }
}
