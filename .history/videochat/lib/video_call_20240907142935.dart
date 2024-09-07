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
  bool _error = false;
  String tempToken = "";

  @override
  void initState() {
    getToken();
    super.initState();
  }

  Future<void> getToken() async {
    final response = await http.get(Uri.parse(
        'http://localhost:8080/get_token?channelName=${widget.channelName}'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        tempToken = data["token"];
      });
      _client = AgoraClient(
        agoraConnectionData: AgoraConnectionData(
          appId: "c1ccb094672f4e5cac808f0ed59407ca",
          tempToken: tempToken,
          channelName: widget.channelName,
        ),
        enabledPermission: [Permission.camera, Permission.microphone],
      );
      setState(() {
        _loading = false;
      });
    } else {
      print('Failed to load token');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            // :Stack(
            //         children: [
            //           AgoraVideoViewer(
            //             client: _client,
            //           ),
            //           AgoraVideoButtons(client: _client)
            //         ],
            : _error
                ? const Center(
                    child: Text(
                      "Error starting video call. please try again",
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                : Stack(
                    children: [
                      AgoraVideoViewer(
                        client: _client,
                      ),
                      AgoraVideoButtons(client: _client)
                    ],
                  ),
      ),
    );
  }
}
