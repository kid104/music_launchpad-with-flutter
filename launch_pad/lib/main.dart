import 'package:flutter/material.dart';
import 'package:flutter_soloud/flutter_soloud.dart';

// One file per pad: column 1 top to bottom (0-4), column 2 (5-9), column 3 (10-14), column 4 (15-19)
const soundPaths = [
  'assets/snare.mp3', // 0
  'assets/hihat.mp3', // 1
  'assets/crash.mp3', // 2
  'assets/distorted808.mp3', // 3
  'assets/deepkick.mp3', // 4
  // ...continue to 19
];

final List<AudioSource> sounds = [];

void hit(int i) {
  debugPrint('hit($i), sounds loaded: ${sounds.length}');
  if (i < sounds.length) {
    SoLoud.instance.play(sounds[i]);
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await SoLoud.instance.init();
    for (final path in soundPaths) {
      sounds.add(await SoLoud.instance.loadAsset(path));
    }
  } catch (e, st) {
    debugPrint('Audio setup failed: $e\n$st');
  }

  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: LaunchPad()));
}

class LaunchPad extends StatelessWidget {
  const LaunchPad({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LAUNCH PAD')),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 100),
            Expanded(
              child: Row(
                children: [
                  LaunchPadColumn(
                    hits: [0, 1, 2, 3, 4],
                    backgroundimage: 'assets/red.png',
                  ).buildColumn(),
                  LaunchPadColumn(
                    hits: [0, 1, 2, 3, 4],
                    backgroundimage: 'assets/green.png',
                  ).buildColumn(),
                  LaunchPadColumn(
                    hits: [0, 1, 2, 3, 4],
                    backgroundimage: 'assets/blue.png',
                  ).buildColumn(),
                  LaunchPadColumn(
                    hits: [0, 1, 2, 3, 4],
                    backgroundimage: 'assets/yellow.png',
                  ).buildColumn(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LaunchPadColumn {
  List<int> hits = [];
  String backgroundimage = '';

  LaunchPadColumn({required this.hits, required this.backgroundimage});

  Widget buildColumn() {
    return Expanded(
      child: Column(
        children: <Widget>[
          Expanded(
            child: TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: () => hit(hits[0]),
              child: Image.asset(
                backgroundimage,
                fit: BoxFit.fill,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: () => hit(hits[1]),
              child: Image.asset(
                backgroundimage,
                fit: BoxFit.fill,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: () => hit(hits[2]),
              child: Image.asset(
                backgroundimage,
                fit: BoxFit.fill,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: () => hit(hits[3]),
              child: Image.asset(
                backgroundimage,
                fit: BoxFit.fill,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: () => hit(hits[4]),
              child: Image.asset(
                backgroundimage,
                fit: BoxFit.fill,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
