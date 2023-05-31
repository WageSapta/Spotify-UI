// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:slicing_spotify/core.dart';
import 'package:slicing_spotify/module/spotify/static/color.dart';
import 'package:slicing_spotify/module/spotify/widget/resize_widget_detector.dart';
import 'package:slicing_spotify/module/spotify/widget/text_costum.dart';
import 'package:slicing_spotify/state_util.dart';

class SpotifyKoleksi extends StatefulWidget {
  const SpotifyKoleksi({Key? key}) : super(key: key);

  Widget build(context, KoleksiController controller) {
    controller.view = this;

    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              floating: false,
              leadingWidth: Get.width,
              toolbarHeight: 80,
              shadowColor: Colors.black,
              leading: Row(
                children: [
                  ResizeWidgetDetector(
                    margin: const EdgeInsets.only(left: 20, right: 10),
                    onTap: () {},
                    child: const CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://i.ibb.co/PGv8ZzG/me.jpg",
                      ),
                      radius: 15,
                    ),
                  ),
                  ResizeWidgetDetector(
                    onTap: () => print('refresh'),
                    child: const TextCostum(
                      text: 'Koleksi Kamu',
                      size: 20,
                      isBold: true,
                    ),
                  ),
                ],
              ),
              actions: [
                ResizeWidgetDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.search,
                      size: 30,
                    )),
                ResizeWidgetDetector(
                    margin: const EdgeInsets.all(10.0),
                    onTap: () {},
                    child: const Icon(
                      Icons.add,
                      size: 30,
                    )),
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  SizedBox(
                    height: 40,
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
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          decoration: ShapeDecoration(
                            shape: StadiumBorder(
                              side: BorderSide(color: MyColor.grey),
                            ),
                          ),
                          child: TextCostum(text: item['name'], size: 11),
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
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ResizeWidgetDetector(
                    margin: EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Icon(
                          Icons.sort,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        TextCostum(text: "Terakhir", size: 12)
                      ],
                    ),
                  ),
                  ResizeWidgetDetector(
                    margin: const EdgeInsets.only(right: 20),
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
                : gridViewBuilder(controller)
          ],
        ),
      ),
    );
  }

  listViewBuilder(KoleksiController controller) {
    return ListView.builder(
      //  padding: EdgeInsets.zero, 
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.koleksi.length,
      itemBuilder: (context, index) {
        var item = controller.koleksi[index];
        return ResizeWidgetDetector(
          isVibration: true,
          onLongPress: () {},
          onTap: () {},
          child: ListTile(
            horizontalTitleGap: 10,
            leading: AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: Colors.grey,
              ),
            ),
            title: TextCostum(
              text: item['title'],
              size: 15,
            ),
            subtitle: TextCostum(
              text: item['subtitle'],
              color: MyColor.grey,
              size: 11,
            ),
            trailing: ResizeWidgetDetector(
              onTap: () {
                item['isPinned'] = !item['isPinned'];
                controller.koleksi.sort((a, b) => b['isPinned'] ? 1 : -1);
                controller.setState(() {});
              },
              child: Icon(
                item['isPinned'] ? Icons.push_pin : Icons.more_vert,
                size: 25,
                color: item['isPinned'] ? MyColor.green : MyColor.grey,
              ),
            ),
          ),
        );
      },
    );
  }

  gridViewBuilder(KoleksiController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.koleksi.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          var item = controller.koleksi[index];
          return ResizeWidgetDetector(
            isVibration: true,
            isList: true,
            index: index,
            onLongPress: () => print('tap'),
            child: Padding(
              padding: EdgeInsets.only(
                  right: index.isEven ? 8 : 0, left: index.isEven ? 0 : 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      color: Colors.grey,
                      // Placeholder image or album cover
                    ),
                  ),
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextCostum(
                        text: item['title'],
                        size: 11,
                        color: item['isPinned'] ? MyColor.green : MyColor.white,
                      ),
                      Row(
                        children: [
                          Visibility(
                            visible: item['isPinned'],
                            child: Icon(
                              Icons.push_pin,
                              color: item['isPinned']
                                  ? MyColor.green
                                  : MyColor.white,
                              size: 11,
                            ),
                          ),
                          const SizedBox(width: 1),
                          TextCostum(
                            text: item['subtitle'],
                            size: 11,
                            color: MyColor.grey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  State<SpotifyKoleksi> createState() => KoleksiController();
}
