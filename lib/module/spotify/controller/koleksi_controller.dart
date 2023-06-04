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
      "isAddPodcast": false,
      "isAddArtist": false,
    },
    {
      "title": "Sering Diputar",
      "subtitle": "Playlist • Spotify",
      "isPinned": false,
      "isAddPodcast": false,
      "isAddArtist": false,
    },
    {
      "title": "wave to earth",
      "subtitle": "Artist",
      "isPinned": false,
      "isAddPodcast": false,
      "isAddArtist": false,
    },
    {
      "title": "The 1975",
      "subtitle": "Artist",
      "isPinned": false,
      "isAddPodcast": false,
      "isAddArtist": false,
    },
  ].followedBy(
    [
      {
        "title": "Tambahkan artis",
        "subtitle": "",
        "isPinned": false,
        "isAddArtist": true, 
        "isAddPodcast": false,
      },
      {
        "title": "Tambahkan podcast & acara",
        "subtitle": "",
        "isPinned": false,
        "isAddPodcast": true,
        "isAddArtist": false,
      },
    ],
  ).toList();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
