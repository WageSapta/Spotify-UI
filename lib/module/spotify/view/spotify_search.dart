import 'package:flutter/material.dart';
import 'package:slicing_spotify/core.dart';

class SpotifySearch extends StatefulWidget {
  const SpotifySearch({Key? key}) : super(key: key);

  Widget build(context, SearchSpController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Spotify"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: const Column(
            children: [],
          ),
        ),
      ),
    );
  }

  @override
  State<SpotifySearch> createState() => SearchSpController();
}
