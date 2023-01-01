import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:sharecipe/core/utils/constants.dart';
import 'package:sharecipe/feature/home/presentation/screens/home_screen.dart';
import 'package:sharecipe/feature/new/presentation/screens/new_screen.dart';
import 'package:sharecipe/feature/profile/presentation/screens/profile_screen.dart';
import 'package:sharecipe/feature/search/presentation/screens/search_screen.dart';
import 'package:sharecipe/feature/trends/presentation/screens/trends_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  final PageController controller = PageController();
  late final tabController = TabController(length: 5, vsync: this);
  final List<Widget> screens = const [
    HomeScreen(),
    TrendsScreen(),
    NewScreen(),
    SearchScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        controller: tabController,
        color: Colors.white,
        backgroundColor: Constants.MAIN_COLOR,
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.trending_up, title: 'Trends'),
          TabItem(icon: Icons.add, title: 'New'),
          TabItem(icon: Icons.search, title: 'Search'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        onTap: (int i) => controller.jumpToPage(i),
      ),
      body: Container(
        decoration: BoxDecoration(color: Constants.BACKGROUND_COLOR),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Center(
            child: PageView(
              controller: controller,
              children: screens,
              onPageChanged: (pageIndex) => tabController.index = pageIndex,
            ),
          ),
        ),
      ),
    );
  }
}
