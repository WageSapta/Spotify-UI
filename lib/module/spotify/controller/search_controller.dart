import 'package:flutter/material.dart';
import 'package:slicing_spotify/core.dart';
import 'package:slicing_spotify/state_util.dart';

class SearchSpController extends State<SpotifySearch>
    with SingleTickerProviderStateMixin
    implements MvcController {
  static late SearchSpController instance;
  late SpotifySearch view;

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
  List<Tab> tabs = [
    const Tab(text: "Musik"),
    const Tab(text: "Podcast & Acara")
  ];

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
