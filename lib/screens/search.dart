import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  static const String id = "search";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 100),
              Text(
                "Search",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              InkWell(
                onTap: () {
                  print("Hello");
                },
                child: Container(
                  height: 60,
                  width: 330,
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 6),
                                child: Icon(Icons.search),
                              ),
                            ),
                            TextSpan(
                                text: "Artists, songs, or podcasts",
                                style: TextStyle(color: Colors.black)),
                          ]),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: new Border.all(color: Colors.white, width: 2.0),
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: Text(
                    "Your top genres",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              GridView.builder(
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.6, crossAxisCount: 2),
                shrinkWrap: true,
                controller: ScrollController(keepScrollOffset: false),
                itemBuilder: (BuildContext context, int index) {
                  return GridTile(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: ClipPath(
                          child: Image.asset(
                            "assets/images/cover1.jpeg",
                            fit: BoxFit.fill,
                          ),
                          clipper: ShapeBorderClipper(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3))),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: Text(
                    "Browse all",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              GridView.builder(
                itemCount: 20,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.6, crossAxisCount: 2),
                shrinkWrap: true,
                controller: ScrollController(keepScrollOffset: false),
                itemBuilder: (BuildContext context, int index) {
                  return GridTile(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: ClipPath(
                          child: Image.asset(
                            "assets/images/cover1.jpeg",
                            fit: BoxFit.fill,
                          ),
                          clipper: ShapeBorderClipper(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3))),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
