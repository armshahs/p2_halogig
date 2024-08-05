import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rt_karate_academy/controller/home/gallary/gallary_services.dart';
import 'package:rt_karate_academy/util/colors.dart';

import '../../../model/gallary_model.dart';
import '../../common_widgets/back_button.dart';

class GallaryScreen extends StatefulWidget {
  GallaryScreen({super.key});

  @override
  State<GallaryScreen> createState() => _GallaryScreenState();
}

class _GallaryScreenState extends State<GallaryScreen> {
  final List<String> networkImages = [
    'https://st.depositphotos.com/1475281/2880/v/450/depositphotos_28800413-stock-illustration-karate-silhouette.jpg',
    'https://www.shutterstock.com/blog/wp-content/uploads/sites/5/2021/07/Karate-Olympics-Feature.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/K1PL_Berlin_2018-09-16_Female_Kata_108.jpg/1200px-K1PL_Berlin_2018-09-16_Female_Kata_108.jpg',
    'https://i.pinimg.com/originals/f0/24/ec/f024ecebab3eed772b1ab4e981e348d5.jpg',
    'https://wallpapercosmos.com/w/full/f/5/e/1119463-2048x3252-phone-hd-karate-wallpaper-image.jpg',
    'https://funmauj.b-cdn.net/test/618833.jpg',
    'https://w0.peakpx.com/wallpaper/902/261/HD-wallpaper-martial-arts-black-belt-grey-karate-kata-taekwondo.jpg'
  ];

  @override
  void initState() {
    super.initState();
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
                    Navigator.pop(context,true);
                  }),
                  const Text(
                    'Gallary',
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
                  padding: const EdgeInsets.fromLTRB(10, 30, 10, 5),
                  child: FutureBuilder(
                      future: GallaryServices().fetchGalleryData(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Gallery>> snapshot) {
                        return MasonryGridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          itemCount: snapshot.data?[0].urls.length ?? 0,
                          itemBuilder: (context, index) {
                            return ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                    snapshot.data![0].urls[index]));
                          },
                        );
                      })),
            ))
          ],
        ),
      )),
    );
  }
}
