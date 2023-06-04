// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:slicing_spotify/core.dart';
import 'package:slicing_spotify/module/spotify/static/color.dart';
import 'package:slicing_spotify/module/spotify/widget/widget_detector.dart';
import 'package:slicing_spotify/module/spotify/widget/text_costum.dart';
import 'package:slicing_spotify/state_util.dart';

class SpotifyKoleksi extends StatefulWidget {
  const SpotifyKoleksi({Key? key}) : super(key: key);

  Widget build(context, KoleksiController controller) {
    controller.view = this;

    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverPadding(
                padding: const EdgeInsets.only(top: 20.0),
                sliver: SliverAppBar(
                  pinned: true,
                  leadingWidth: Get.width,
                  toolbarHeight: 70,
                  shadowColor: Colors.black,
                  leading: Row(
                    children: [
                      WidgetDetector(
                        margin: const EdgeInsets.only(left: 20, right: 15),
                        onTap: () {},
                        child: const CircleAvatar(
                          backgroundImage: NetworkImage(
                            "https://i.ibb.co/PGv8ZzG/me.jpg",
                          ),
                          radius: 15,
                        ),
                      ),
                      WidgetDetector(
                        onTap: () => print('refresh'),
                        child: const TextCostum(
                          text: 'Koleksi Kamu',
                          size: 25,
                          isBold: true,
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    WidgetDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.search,
                          size: 30,
                        )),
                    WidgetDetector(
                        margin: const EdgeInsets.all(15.0),
                        onTap: () {},
                        child: const Icon(
                          Icons.add,
                          size: 30,
                        )),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate.fixed(
                  [
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 10),
                        scrollDirection: Axis.horizontal,
                        // physics: const BouncingScrollPhysics(),
                        itemCount: controller.listSelect.length,
                        itemBuilder: (context, index) {
                          var item = controller.listSelect[index];
                          return Container(
                            height: 30,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            decoration: ShapeDecoration(
                              color: MyColor.deepGrey,
                              shape: const StadiumBorder(),
                            ),
                            child: TextCostum(text: item['name'], size: 15),
                          );
                        },
                      ),
                    )
                  ],
                ),
              )
            ];
          },
          body: ListView(
              children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const WidgetDetector(
                    child: Row(
                      children: [
                        Icon(
                          Icons.sort,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        TextCostum(text: "Terakhir", size: 15)
                      ],
                    ),
                  ),
                  WidgetDetector(
                    onTap: () {
                      controller.isList = !controller.isList;
                      controller.setState(() {});
                    },
                    child: Icon(
                      controller.isList
                          ? Icons.grid_view
                          : Icons.format_list_bulleted,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            controller.isList
                ? listViewBuilder(controller)
                : gridViewBuilder(controller),
          ].followedBy([const SizedBox(height: 20)]).toList()),
        ),
      ),
    );
  }

  listViewBuilder(KoleksiController controller) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.koleksi.length,
      itemBuilder: (context, index) {
        var item = controller.koleksi[index];
        if (index >=
            controller.koleksi.indexWhere(
                (i) => i['title'].toString().contains('Tambahkan'))) {
          return WidgetDetector(
            margin: const EdgeInsets.only(bottom: 15.0),
            onTap: () {},
            child: Row(
              children: [
                Container(
                  height: Get.height / 6,
                  width: Get.width / 6,
                  decoration: ShapeDecoration(
                    color: MyColor.deepGrey,
                    shape: item['isAddArtist']
                        ? const CircleBorder()
                        : RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                  ),
                  child: Icon(
                    Icons.add,
                    size: 40,
                    color: MyColor.grey,
                  ),
                ),
                const SizedBox(width: 10),
                TextCostum(
                  maxLines: 1,
                  text: item['title'],
                  color: MyColor.white,
                  size: 18,
                ),
              ],
            ),
          );
        }
        return WidgetDetector(
          margin: const EdgeInsets.only(bottom: 15.0),
          isVibration: true,
          onLongPress: () {},
          onTap: () {},
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                      height: Get.width / 6,
                      width: Get.width / 6,
                      color: MyColor.deepGrey,
                      child: Icon(
                        Icons.music_note,
                        size: 40,
                        color: MyColor.grey,
                      )),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextCostum(
                        text: item['title'],
                        size: 18,
                      ),
                      Row(
                        children: [
                          Visibility(
                            visible: item['isPinned'],
                            child: Icon(
                              Icons.push_pin,
                              size: 15,
                              color: MyColor.green,
                            ),
                          ),
                          TextCostum(
                            text: item['subtitle'],
                            color: MyColor.grey,
                            size: 13,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  gridViewBuilder(KoleksiController controller) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.70,
      ),
      itemCount: controller.koleksi.length,
      itemBuilder: (context, index) {
        var item = controller.koleksi[index];
        if (index >=
            controller.koleksi.indexWhere(
              (i) => i['title'].toString().contains('Tambahkan'),
            )) {
          return WidgetDetector(
            padding: EdgeInsets.only(
                right: index.isEven ? 8 : 0, left: index.isEven ? 0 : 8),
            isVibration: true,
            onLongPress: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: ShapeDecoration(
                      color: MyColor.deepGrey,
                      shape: item["isAddArtist"]
                          ? const CircleBorder()
                          : RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                    ),
                    child: Icon(Icons.add, size: 50, color: MyColor.grey),
                  ),
                ),
                const SizedBox(height: 8),
                TextCostum(
                  text: item["title"],
                  size: 15,
                  color: MyColor.white,
                ),
              ],
            ),
          );
        }
        return WidgetDetector(
          padding: EdgeInsets.only(
              right: index.isEven ? 8 : 0, left: index.isEven ? 0 : 8),
          isVibration: true,
          onLongPress: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  color: MyColor.deepGrey,
                  child: Icon(Icons.music_note, size: 50, color: MyColor.grey),
                ),
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextCostum(
                    text: item['title'],
                    size: 15,
                    color: item['isPinned'] ? MyColor.green : MyColor.white,
                  ),
                  Row(
                    children: [
                      Visibility(
                        visible: item['isPinned'],
                        child: Icon(
                          Icons.push_pin,
                          color:
                              item['isPinned'] ? MyColor.green : MyColor.white,
                          size: 15,
                        ),
                      ),
                      const SizedBox(width: 1),
                      TextCostum(
                        text: item['subtitle'],
                        size: 13,
                        color: MyColor.grey,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  State<SpotifyKoleksi> createState() => KoleksiController();
}
