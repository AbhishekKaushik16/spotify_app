import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  static const String id = "player";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyPlayer(),
        theme: ThemeData(primaryColor: Colors.black));
  }
}

class MyPlayer extends StatefulWidget {
  @override
  _MyPlayerState createState() => _MyPlayerState();
}

class _MyPlayerState extends State<MyPlayer> {
  AudioPlayer _audioPlayer = AudioPlayer();
  AudioCache audioCache;
  bool _isFavorite = false;
  bool _isPlaying = false;
  Duration _duration = new Duration();
  Duration _position = new Duration();
  String currentTime = "00:00";
  String totalTime = "00:00";

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    _audioPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: _audioPlayer);
    // ignore: deprecated_member_use
    _audioPlayer.durationHandler = (d) => setState(() => _duration = d);
    // ignore: deprecated_member_use
    _audioPlayer.positionHandler = (p) => setState(() => _position = p);
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    _audioPlayer.seek(newDuration);
  }

  double setChanged() {
    Duration newDuration = Duration(seconds: 0);
    _audioPlayer.seek(newDuration);
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.brown,
                Colors.black87,
              ],
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            LineIcons.angle_down,
                            color: Colors.white,
                            size: 24,
                          ),
                          Column(
                            children: [
                              Text(
                                "PLAYING FROM YOUR LIBRARY",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  letterSpacing: 1,
                                ),
                              ),
                              Text(
                                "Liked Songs",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "ProximaNova",
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            LineIcons.ellipsis_v,
                            color: Colors.white,
                            size: 24,
                          )
                        ],
                      ),
                      SizedBox(height: 35),
                      Container(
                        width: 300,
                        child: Image.asset("assets/images/cover1.jpeg"),
                      ),
                      SizedBox(height: 41),
                      Container(
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "We Built this city",
                                  style: TextStyle(
                                    wordSpacing: 0.2,
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Starship",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.5),
                                      fontSize: 15,
                                      letterSpacing: 0.1),
                                ),
                              ],
                            ),
                            IconButton(
                              icon: (_isFavorite == true)
                                  ? Icon(
                                      LineIcons.heart,
                                      color: Colors.green,
                                      size: 30,
                                    )
                                  : Icon(
                                      LineIcons.heart_o,
                                      color: Colors.grey.shade400,
                                      size: 30,
                                    ),
                              onPressed: () {
                                setState(() {
                                  _isFavorite =
                                      (_isFavorite == false) ? true : false;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.grey.shade600,
                              activeTickMarkColor: Colors.white,
                              thumbColor: Colors.white,
                              trackHeight: 3,
                              thumbShape: RoundSliderThumbShape(
                                enabledThumbRadius: 4,
                              ),
                            ),
                            child: Slider(
                              value: (_position.inSeconds.toDouble() !=
                                      _duration.inSeconds.toDouble())
                                  ? _position.inSeconds.toDouble()
                                  : setChanged(),
                              min: 0,
                              max: _duration.inSeconds.toDouble(),
                              onChanged: (double value) {
                                setState(() {
                                  seekToSecond(value.toInt());
                                  value = value;
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "${_position.inMinutes.toInt()}:${(_position.inSeconds % 60).toString().padLeft(2, "0")}",
                                  style: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontFamily: "ProximaNovaThin",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "${_duration.inMinutes.toInt()}:${(_duration.inSeconds % 60).toString().padLeft(2, "0")}",
                                  style: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontFamily: "ProximaNovaThin",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(
                              LineIcons.random,
                              color: Colors.grey.shade400,
                            ),
                            Icon(
                              Icons.skip_previous,
                              color: Colors.white,
                              size: 40,
                            ),
                            Container(
                              height: 90,
                              width: 90,
                              child: Center(
                                child: IconButton(
                                  iconSize: 70,
                                  alignment: Alignment.center,
                                  icon: (_isPlaying == true)
                                      ? Icon(
                                          Icons.pause_circle_filled,
                                          color: Colors.white,
                                        )
                                      : Icon(
                                          Icons.play_circle_filled,
                                          color: Colors.white,
                                        ),
                                  onPressed: () {
                                    setState(() {
                                      _isPlaying =
                                          _isPlaying == false ? true : false;
                                      if (_isPlaying == true) {
                                        print("Playing .....");
                                        audioCache.play(
                                          'audio1.mp3',
                                        );
                                      } else {
                                        print("Paused .....");
                                        _audioPlayer.pause();
                                      }
                                    });
                                  },
                                ),
                              ),
                            ),
                            Icon(
                              Icons.skip_next,
                              color: Colors.white,
                              size: 40,
                            ),
                            Icon(
                              LineIcons.repeat,
                              color: Colors.grey.shade400,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 22, right: 22),
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(
                              LineIcons.desktop,
                              color: Colors.grey.shade400,
                            ),
                            Icon(
                              LineIcons.list_alt,
                              color: Colors.grey.shade400,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
