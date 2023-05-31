import 'package:flutter/material.dart';
import 'package:slicing_spotify/module/spotify/widget/text_costum.dart';
import '../controller/spotify_controller.dart';

class SpotifyHome extends StatefulWidget {
  const SpotifyHome({Key? key}) : super(key: key);

  Widget build(context, HomeController controller) {
    controller.view = this;

    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                // floating: true,
                pinned: true,
                title: const Text('Selamat malam'),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications_none)),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.access_time)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
                ],
                // bottom: const TabBar(
                //   tabs: [
                //     Tab(text: "Call"), // this shoudl be floating n pinned
                //     Tab(text: "Message"), // this should be floating n pinned
                //   ],
                // ),
              ),
              const SliverList(
                delegate: SliverChildListDelegate.fixed(
                  [
                    TabBar(
                      labelColor: Colors.blue,
                      tabs: [
                        Tab(text: "Call"),
                        Tab(text: "Message"),
                      ],
                    ),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              Container(
                  child: ListView.builder(
                      itemCount: 100,
                      itemBuilder: (context, index) {
                        return TextCostum(text: "Item $index");
                      })),
              Container(
                  child: ListView.builder(
                      itemCount: 100,
                      itemBuilder: (context, index) {
                        return TextCostum(text: "Item $index");
                      })),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<SpotifyHome> createState() => HomeController();
}
