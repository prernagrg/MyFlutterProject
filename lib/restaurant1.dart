import 'package:flutter/material.dart';

class FirstRestroPage extends StatelessWidget {
  const FirstRestroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            /// BACKGROUND IMAGE
            SliverAppBar(
              expandedHeight: 250,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/images/explorepizza.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),

            /// TAB BAR
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverTabBarDelegate(
                TabBar(
                  labelColor: Colors.orange,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.orange,
                  tabs: const [
                    Tab(text: "Menu"),
                    Tab(text: "Reviews"),
                    Tab(text: "Info"),
                  ],
                ),
              ),
            ),

            /// TAB CONTENT
            SliverFillRemaining(
              child: TabBarView(
                children: [
                  ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return ListTile(title: Text("Menu Item $index"));
                    },
                  ),

                  ListView.builder(
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return ListTile(title: Text("Review $index"));
                    },
                  ),

                  const Center(child: Text("Restaurant Information")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _SliverTabBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(context, shrinkOffset, overlapsContent) {
    return Container(color: Colors.white, child: tabBar);
  }

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) {
    return false;
  }
}
