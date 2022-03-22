import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void setUpWorldTime() async {
    WorldTime wt = WorldTime(
        location: 'Biafra', url: 'Africa/Lagos', flag: 'biafra.png');

    await wt.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': wt.location,
      'time': wt.time,
      'flag': wt.flag,
      'isDaytime': wt.isDaytime
    });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[900],
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
