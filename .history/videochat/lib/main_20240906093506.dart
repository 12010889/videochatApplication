import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const String appId = 'Your_Agora_App_ID';
  final String channelName = 'test_channel';
  final String token = 'Your_Token_If_Required';

  @override
  void initState() {
    super.initState();
    _initializeAgora();
  }

  Future<void> _initializeAgora() async {
    await AgoraRtcEngine.create(appId);
    await AgoraRtcEngine.enableVideo();
    AgoraRtcEngine.joinChannel(token, channelName, null, 0);
  }

  @override
  void dispose() {
    AgoraRtcEngine.leaveChannel();
    AgoraRtcEngine.destroy();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Agora Video Call'),
        ),
        body: Center(
          child: Text('Video Chat App'),
        ),
      ),
    );
  }
}
