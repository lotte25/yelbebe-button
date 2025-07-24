import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

final player = AudioPlayer();

Future<void> playButtonSound() async {
  await player.stop();
    await player.play(AssetSource("yelbebe.mp3"));
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Y el bebé?',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue[900]!, brightness: Brightness.dark)
      ),
      home: const Homepage(title: 'Y el bebé? button'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Homepage extends StatelessWidget {
  final String title;
  const Homepage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        centerTitle: true,
        title: Text(title),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.info)),
          SizedBox(width: 12)
        ],
      ),
      body: AnimateGradient(
        primaryBegin: Alignment.bottomCenter,
        primaryEnd: Alignment.topCenter,
        secondaryBegin: Alignment.topRight,
        secondaryEnd: Alignment.bottomLeft,
        duration: const Duration(seconds: 3),
        primaryColors: [
          Colors.blue,
          Colors.white,
          Colors.brown,
          Colors.greenAccent,
        ], 
        secondaryColors: [
          Colors.green,
          Colors.red,
          Colors.purpleAccent,
          Colors.pink,
        ],
        child: Center(
          child: GestureDetector(
            onTap: () {
              playButtonSound();
            },
            child: SizedBox(
              width: 300,
              height: 300,
              child: Image.asset("assets/yelbebe.png", fit: BoxFit.cover)
            ),
          )
      ),
      )
    );
  }
}       
       
              