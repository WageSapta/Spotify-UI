import 'package:flutter/material.dart';
import '../../../core.dart';
import '../../../state_util.dart';

class KoleksiController extends State<SpotifyKoleksi>
    with SingleTickerProviderStateMixin
    implements MvcController {
  static late KoleksiController instance;
  late SpotifyKoleksi view;

  @override
  void initState() {
    instance = this;
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  TabController? tabController;
  final ScrollController scrollController = ScrollController();
  bool isList = true;
  Set<int> pressed = <int>{};

  List listSelect = [
    {"name": "Playlist", "isSelect": false},
    {"name": "Podcast & Acara", "isSelect": false},
    {"name": "Album", "isSelect": false},
    {"name": "Artis", "isSelect": false},
  ];

  List<Map> koleksi = [
    {
      "title": "Lagu yang Disukai",
      "subtitle": "Playlist • 796 lagu",
      "isPinned": true,
    },
    {
      "title": "Sering Diputar",
      "subtitle": "Playlist • Spotify",
      "isPinned": false,
    },
    {
      "title": "wave to earth",
      "subtitle": "Artist",
      "isPinned": false,
    },
    {
      "title": "The 1975",
      "subtitle": "Artist",
      "isPinned": false,
    },
  ];

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
