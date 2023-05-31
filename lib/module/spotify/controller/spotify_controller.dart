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
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  TabController? tabController;
  List<Widget> tabs = [
    Container(
      height: 50,
      width: 100,
      decoration:
          const ShapeDecoration(shape: StadiumBorder(), color: Colors.grey),
      child: const Text('Musik'),
    ),
    Container(
      height: 50,
      width: 100,
      decoration:
          const ShapeDecoration(shape: StadiumBorder(), color: Colors.grey),
      child: const Text('Musik'),
    )
  ];

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
