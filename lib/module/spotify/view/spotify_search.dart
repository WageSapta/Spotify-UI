import 'package:flutter/material.dart';
import 'package:slicing_spotify/module/spotify/widget/widget_detector.dart';
import '../../../core.dart';
import '../static/color.dart';
import '../widget/custom_sliver_persistent_header_delegate.dart';
import '../widget/text_costum.dart';

class SpotifySearch extends StatefulWidget {
  const SpotifySearch({Key? key}) : super(key: key);

  Widget build(context, SearchSpController controller) {
    controller.view = this;

    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverPadding(
                padding: const EdgeInsets.only(top: 30),
                sliver: SliverAppBar(
                  toolbarHeight: 50,
                  title: const TextCostum(text: "Cari", isBold: true, size: 25),
                  actions: [
                    WidgetDetector(
                      onTap: () {},
                      child: const Icon(Icons.camera_alt_outlined, size: 30),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                  ],
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: CustomSliverPersistentHeaderDelegate(
                  maxHeight: 70,
                  minHeight: 70,
                  child: Material(
                    color: MyColor.black,
                    child: WidgetDetector(
                      onTap: () {},
                      child: Container(
                        height: 70,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: MyColor.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: MyColor.deepGrey,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            TextCostum(
                              text: "Apa yang ingin kamu dengarkan?",
                              color: MyColor.deepGrey.withOpacity(.7),
                              isBold: true,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ];
          },
          body: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: TextCostum(
                  text: "Browse Semua",
                  isBold: true,
                  size: 15,
                ),
              ),
              GridView.builder(
                itemCount: 20,
                padding: const EdgeInsets.all(15),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 1,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    mainAxisExtent: 100),
                itemBuilder: (context, index) {
                  return WidgetDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        color:
                            Color.fromARGB(255, 100 * index, 100 * index, 100),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Row(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(top: 15, left: 10),
                              child: TextCostum(
                                  text: "Podcast", isBold: true, size: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ].followedBy([const SizedBox(height: 60)]).toList(),
          ),
        ),
      ),
    );
  }

  @override
  State<SpotifySearch> createState() => SearchSpController();
}
