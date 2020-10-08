import 'package:flutter/material.dart';

class Library extends StatefulWidget {
  static const String id = "library";
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.85),
                  Colors.black,
                ],
                stops: [0.4, 1],
                begin: Alignment.topLeft,
              )),
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    isScrollable: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    indicator: BoxDecoration(),
                    controller: _tabController,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white.withOpacity(0.5),
                    labelStyle:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    tabs: [
                      Tab(
                        text: "Music",
                      ),
                      Tab(
                        text: "Podcasts",
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      NestedTabBar(
                          str1: "Playlists", str2: "Artists", str3: "Albums"),
                      NestedTabBar(
                          str1: "Episodes", str2: "Downloads", str3: "Shows"),
                    ],
                    controller: _tabController,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class NestedTabBar extends StatefulWidget {
  final String str1;
  final String str2;
  final String str3;
  const NestedTabBar({Key key, this.str1, this.str2, this.str3})
      : super(key: key);

  @override
  _NestedTabBarState createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  TabController _nestedTabController;

  _NestedTabBarState();
  @override
  void initState() {
    super.initState();
    _nestedTabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: TabBar(
            controller: _nestedTabController,
            indicatorColor: Colors.green,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white.withOpacity(0.5),
            isScrollable: true,
            tabs: <Widget>[
              Tab(
                text: widget.str1,
              ),
              Tab(
                text: widget.str2,
              ),
              Tab(
                text: widget.str3,
              )
            ],
          ),
        ),
        SizedBox(height: 2),
        Expanded(
          child: TabBarView(
            controller: _nestedTabController,
            children: <Widget>[
              ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return MyCustomCard();
                },
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return MyCustomCard();
                },
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return MyCustomCard();
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}

class MyCustomCard extends StatelessWidget {
  const MyCustomCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            child: Image.asset(
              "assets/images/cover2.jpeg",
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Playlists",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 3),
              Text(
                "by Queen",
                style: TextStyle(
                    color: Colors.white.withOpacity(0.5), fontSize: 13),
                textAlign: TextAlign.left,
              )
            ],
          )
        ],
      ),
    );
  }
}
