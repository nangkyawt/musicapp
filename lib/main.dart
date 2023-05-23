import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String audio_url =
      "https://docs.google.com/uc?export=download&id=1J1QyBcWxbC_SwZ9EZRfTyvRfeX0zjeCs";
  // "https:docs.google.com/uc?export=download&id=1uB8skrOtu0QWIR6gWezyFDfQrS7ZgDYI";

  play() async {
    // var result = await audioPlayer.play("song/brunomars.mp3");
    var result = await audioPlayer.play(audio_url);
    print(">>>>>> ");
    if (result == 1) {
      print(">>>>>> SUCESS <<<<<<<<");
      // success
    }
  }

  pause() async {
    var result = await audioPlayer.pause();
    if (result == 1) {
      print(">>>>>> SUCESS <<<<<<<<");
      // success
    }
  }

  AudioPlayer audioPlayer = AudioPlayer();

  bool playpause = true;
  int audio = 0;

  List my_playlist = [
    {
      "url":
          "https://docs.google.com/uc?export=download&id=1J1QyBcWxbC_SwZ9EZRfTyvRfeX0zjeCs",
      "name": "Just the way you are",
      "album_art": "image/brunomars.png",
      "artist": "Brunomars"
    },
    {
      "url": "https://webtestingforme.000webhostapp.com/Mp3/audio1.mp3",
      "name": "imaging Dragon",
      "album_art": "image/brunomars.png",
      "artist": "Brunomars"
    },
    {
      "url": "https://webtestingforme.000webhostapp.com/Mp3/audio2.mp3",
      "name": "Just the way you are",
      "album_art": "image/brunomars.png",
      "artist": "Brunomars"
    },
    {
      "url": "https://webtestingforme.000webhostapp.com/Mp3/audio3.mp3",
      "name": "Just the way you are",
      "album_art": "image/brunomars.png",
      "artist": "Brunomars"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Music Player")),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(my_playlist[audio]["name"]),
              ],
            ),
            GlassContainer(
              color: Colors.red,
              height: 300,
              width: 300,
              borderColor: Colors.pink,
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.40),
                  Colors.white.withOpacity(0.10),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderGradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.60),
                  Colors.white.withOpacity(0.10),
                  Colors.purpleAccent.withOpacity(0.05),
                  Colors.purpleAccent.withOpacity(0.60),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0.0, 0.39, 0.40, 1.0],
              ),
              child: const Image(
                width: 20,
                height: 20,
                image: AssetImage("image/brunomars.png"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GlassContainer(
                  borderColor: Colors.pink,
                  height: 50,
                  width: 50,
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.40),
                      Colors.white.withOpacity(0.10),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderGradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.60),
                      Colors.white.withOpacity(0.10),
                      Colors.purpleAccent.withOpacity(0.05),
                      Colors.purpleAccent.withOpacity(0.60),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [0.0, 0.39, 0.40, 1.0],
                  ),
                  borderRadius: BorderRadius.circular(50.0),
                  child: IconButton(
                      onPressed: () {
                        if (audio == 3) {
                          pause();
                          setState(() {
                            playpause = true;
                            audio = 1;
                          });
                        } else {
                          pause();
                          setState(() {
                            playpause = true;
                            audio -= 1;
                          });
                        }
                      },
                      icon: Icon(Icons.skip_previous)),
                ),
                GlassContainer(
                  borderColor: Colors.pink,
                  height: 50,
                  width: 50,
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.40),
                      Colors.white.withOpacity(0.10),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderGradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.60),
                      Colors.white.withOpacity(0.10),
                      Colors.purpleAccent.withOpacity(0.05),
                      Colors.purpleAccent.withOpacity(0.60),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [0.0, 0.39, 0.40, 1.0],
                  ),
                  borderRadius: BorderRadius.circular(50.0),
                  child: IconButton(
                      onPressed: () {
                        if (playpause == true) {
                          play();
                        } else {
                          pause();
                        }
                        setState(() {
                          playpause = !playpause;
                        });
                      },
                      icon: playpause
                          ? const Icon(Icons.play_arrow)
                          : const Icon(Icons.pause)),
                ),
                GlassContainer(
                  borderColor: Colors.pink,
                  height: 50,
                  width: 50,
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.40),
                      Colors.white.withOpacity(0.10),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderGradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.60),
                      Colors.white.withOpacity(0.10),
                      Colors.purpleAccent.withOpacity(0.05),
                      Colors.purpleAccent.withOpacity(0.60),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [0.0, 0.39, 0.40, 1.0],
                  ),
                  borderRadius: BorderRadius.circular(50.0),
                  child: IconButton(
                      onPressed: () {
                        if (audio == 3) {
                          pause();
                          setState(() {
                            playpause = true;
                            audio = 0;
                          });
                        } else {
                          pause();
                          setState(() {
                            playpause = true;
                            audio += 1;
                          });
                        }
                      },
                      icon: Icon(Icons.skip_next)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
