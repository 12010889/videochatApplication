import 'dart:convert';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class VideoCall extends StatefulWidget {
  String channelName = "himakshi";

  VideoCall({super.key, required this.channelName});
  @override
  _VideoCallState createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  late final AgoraClient _client;
  bool _loading = true;
  String tempToken = "";

  @override
  void initState() {
    getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : tempToken.isNotEmpty
                ? Stack(
                    children: [
                      AgoraVideoViewer(
                        client: _client,
                      ),
                      AgoraVideoButtons(client: _client)
                    ],
                  )
                : const Center(
                    child: Text(
                      "Error starting video call. please try again",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
      ),
    );
  }
}
