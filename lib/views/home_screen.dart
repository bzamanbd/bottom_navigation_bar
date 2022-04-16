import 'package:bottom_navigation_bar/themes/color_palette.dart';
import 'package:bottom_navigation_bar/widgets/primary_top_appbar.dart';
import 'package:flutter/material.dart';
import '../widgets/widget_one.dart';
import '../widgets/widget_three.dart';
import '../widgets/widget_two.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({Key? key,required this.title}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int tabpageIndex = 0;
  PageController bNavbarController = PageController();

  @override
  void initState() {
    super.initState();
    bNavbarController = PageController(initialPage: tabpageIndex);
  }

  @override
  void dispose() {
    bNavbarController.dispose();
    super.dispose();
  }

   List<Widget> tabPages = [
    const WidgetOne(),
    const WidgetTwo(),
    const WidgetThree(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PrimaryTopAppbar(title: Text(widget.title)),
        bottomNavigationBar: BottomNavigationBar(
          items:const <BottomNavigationBarItem> [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Email'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          backgroundColor: ColorPalette.secondaryColor,
          elevation: 0,
          currentIndex: tabpageIndex,
          onTap: onTabTapped,
        ),

        body: PageView(
          children: tabPages,
          controller: bNavbarController,
          onPageChanged: onPageChanged,
        ),
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      tabpageIndex = page;
    });
  }

  void onTabTapped(int index) {
    bNavbarController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}
