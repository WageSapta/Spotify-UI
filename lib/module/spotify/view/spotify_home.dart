import 'package:flutter/material.dart';
import 'package:slicing_spotify/module/spotify/static/color.dart';
import 'package:slicing_spotify/module/spotify/widget/custom_sliver_persistent_header_delegate.dart';
import 'package:slicing_spotify/module/spotify/widget/widget_detector.dart';
import 'package:slicing_spotify/module/spotify/widget/text_costum.dart';
import 'package:slicing_spotify/state_util.dart';
import '../controller/home_controller.dart';
import 'package:badges/badges.dart' as badges;

class SpotifyHome extends StatefulWidget {
  const SpotifyHome({Key? key}) : super(key: key);

  Widget build(context, HomeController controller) {
    controller.view = this;

    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverPadding(
                padding: const EdgeInsets.only(top: 20),
                sliver: SliverAppBar(
                  toolbarHeight: 70,
                  title: const TextCostum(
                    text: 'Selamat malam',
                    size: 25,
                    isBold: true,
                  ),
                  actions: [
                    // icons
                    WidgetDetector(
                        margin: const EdgeInsets.all(10.0),
                        onTap: () {},
                        child: badges.Badge(
                          position:
                              badges.BadgePosition.topEnd(top: 2, end: 16),
                          badgeStyle: badges.BadgeStyle(
                            shape: badges.BadgeShape.circle,
                            badgeColor: Colors.indigo.shade400,
                            padding: const EdgeInsets.all(5),
                            borderRadius: BorderRadius.circular(4),
                            borderSide:
                                BorderSide(color: MyColor.black, width: 2),
                            elevation: 0,
                          ),
                          child: const Icon(
                            Icons.notifications_outlined,
                            size: 30,
                          ),
                        )),
                    WidgetDetector(
                      margin: const EdgeInsets.all(10.0),
                      onTap: () {},
                      child: const Icon(
                        Icons.history_toggle_off,
                        size: 30,
                      ),
                    ),
                    WidgetDetector(
                      margin: const EdgeInsets.all(10.0),
                      onTap: () {},
                      child: const Icon(
                        Icons.settings_outlined,
                        size: 30,
                      ),
                    )
                  ],
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: CustomSliverPersistentHeaderDelegate(
                  maxHeight: 50,
                  minHeight: 50,
                  child: Container(
                    color: MyColor.black,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 10),
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.listSelect.length,
                      itemBuilder: (context, index) {
                        var item = controller.listSelect[index];
                        return Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          decoration: ShapeDecoration(
                            color: MyColor.deepGrey,
                            shape: const StadiumBorder(),
                          ),
                          child: TextCostum(text: item['name'], size: 15),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ];
          },
          body: ListView(
            children: [
              koleksiPlay(controller),
              tanggaLagu(),
              untukAnda(),
              baruDiputar(controller)
            ].followedBy([const SizedBox(height: 50)]).toList(),
          ),
        ),
      ),
    );
  }

  Widget koleksiPlay(HomeController controller) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(15.0),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.koleksi.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        var item = controller.koleksi[index];
        return Container(
          // margin: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: MyColor.deepGrey,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: MyColor.grey,
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(5),
                    ),
                    // image: const DecorationImage(
                    //   image: NetworkImage(""),
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  child:
                      Icon(Icons.music_note, size: 30, color: MyColor.deepGrey),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextCostum(
                    isBold: true,
                    size: 15,
                    text: item['title'],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget tanggaLagu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: TextCostum(
            text: "Tangga Lagu",
            size: 25,
            isBold: true,
          ),
        ),
        SizedBox(
          height: Get.width / 1.8,
          child: ListView.builder(
            itemCount: 3,
            padding: const EdgeInsets.only(left: 15.0),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: SizedBox(
                  width: Get.width / 2.5,
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: MyColor.deepGrey,
                            // image: const DecorationImage(
                            //   image: NetworkImage(
                            //     "",
                            //   ),
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                          child: const Icon(Icons.music_note, size: 50),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextCostum(
                        text: "Alan Walker, Daniel Caesar, NewJeans, keshi",
                        color: MyColor.grey,
                        size: 14,
                        isBold: true,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget untukAnda() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: TextCostum(
            text: "Dibuat Untuk Anda",
            size: 25,
            isBold: true,
          ),
        ),
        SizedBox(
          height: Get.width / 1.8,
          child: ListView.builder(
            itemCount: 3,
            padding: const EdgeInsets.only(left: 15.0),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: SizedBox(
                  width: Get.width / 2.5,
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: MyColor.deepGrey,
                              // image: const DecorationImage(
                              //   image: NetworkImage(
                              //     "",
                              //   ),
                              //   fit: BoxFit.cover,
                              // ),
                            ),
                            child: const Icon(Icons.music_note, size: 50)),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextCostum(
                        text: "Alan Walker, Daniel Caesar, NewJeans, keshi",
                        color: MyColor.grey,
                        size: 14,
                        isBold: true,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget baruDiputar(HomeController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: TextCostum(
            text: "Baru Diputar",
            size: 25,
            isBold: true,
          ),
        ),
        SizedBox(
          height: Get.width / 1.8,
          child: ListView.builder(
            itemCount: controller.koleksi.length,
            padding: const EdgeInsets.only(left: 15.0),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var item = controller.koleksi[index];
              return Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: SizedBox(
                  width: Get.width / 3,
                  child: Column(
                    crossAxisAlignment: item['isArtist']
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: ShapeDecoration(
                            shape: item['isArtist']
                                ? const CircleBorder()
                                : const Border(),
                            color: MyColor.deepGrey,
                            image: const DecorationImage(
                              image: NetworkImage(""),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: const Icon(Icons.music_note, size: 50),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextCostum(
                        text: item["title"],
                        color: MyColor.grey,
                        size: 15,
                        isBold: true,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  State<SpotifyHome> createState() => HomeController();
}
