import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:spotify_app/screens/library.dart';
import 'package:spotify_app/screens/search.dart';

class MyHomePage extends StatelessWidget {
  static const String id = "home_page";
  @override
  Widget build(BuildContext context) {
    // double defaultSize = SizeConfig.defaultSize;
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
            DefaultTabController(
              length: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    flex: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Icon(
                                          Icons.settings,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.all(8)),
                                    SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        "Recently played",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      height: 120,
                                      child: ListView.separated(
                                        separatorBuilder: (context, index) =>
                                            SizedBox(width: 6),
                                        itemCount: 5,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) =>
                                            Container(
                                          width: 125.0,
                                          child: Image.asset(
                                            "assets/images/download.jpg",
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Search(),
                          Library(),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(color: Color(0xFF282828)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 65,
                            width: 65,
                            child: Image.asset(
                              'assets/images/cover1.jpeg',
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(width: 2),
                          Container(
                            height: 60,
                            width: 230,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Marquee(
                                text:
                                    "In The Lap of the Gods-Remastered . Queen",
                                blankSpace: 100,
                                style: TextStyle(color: Colors.white),
                                velocity: 40,
                              ),
                            ),
                          ),
                          Spacer(),
                          IconTheme(
                            child: Icon(Icons.favorite),
                            data: IconThemeData(
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          IconTheme(
                            child: Icon(Icons.pause),
                            data: IconThemeData(
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Color(0xFF000000),
                    height: 1,
                    thickness: 1,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF282828),
                      ),
                      child: TabBar(
                        physics: ScrollPhysics(),
                        indicatorColor: Colors.transparent,
                        unselectedLabelColor: Colors.white.withOpacity(0.5),
                        labelColor: Colors.white,
                        tabs: [
                          Tab(
                            child: Column(
                              children: [
                                Icon(Icons.home, size: 30),
                                Text("Home", style: TextStyle(fontSize: 10)),
                              ],
                            ),
                          ),
                          Tab(
                              child: Column(
                            children: [
                              Icon(Icons.search, size: 30),
                              Text("Search", style: TextStyle(fontSize: 10)),
                            ],
                          )),
                          Tab(
                              child: Column(
                            children: [
                              Icon(Icons.library_add, size: 30),
                              Text("Your Library",
                                  style: TextStyle(fontSize: 10)),
                            ],
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
