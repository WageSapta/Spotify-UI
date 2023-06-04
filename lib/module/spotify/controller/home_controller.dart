import 'package:flutter/material.dart';
import 'package:slicing_spotify/state_util.dart';
import '../view/spotify_home.dart';

class HomeController extends State<SpotifyHome>
    with SingleTickerProviderStateMixin
    implements MvcController {
  static late HomeController instance;
  late SpotifyHome view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  final String time = "";

  List listSelect = [
    {"name": "Musik", "isSelect": false},
    {"name": "Podcast & Acara", "isSelect": false},
  ];

  List<Map> koleksi = [
    {
      "title": "Lagu yang Disukai",
      "subtitle": "Playlist • 796 lagu",
      "isPinned": true,
      "isArtist": false,
      "isAlbum": true,
    },
    {
      "title": "Sering Diputar",
      "subtitle": "Playlist • Spotify",
      "isPinned": false,
      "isArtist": false,
      "isAlbum": true,
    },
    {
      "title": "wave to earth",
      "subtitle": "Artist",
      "isPinned": false,
      "isArtist": true,
      "isAlbum": false,
    },
    {
      "title": "The 1975",
      "subtitle": "Artist",
      "isPinned": false,
      "isArtist": true,
      "isAlbum": false,
    },
  ];

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
