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

  Future<void> getToken() async {
    String link =
        "https://agora-node-tokenserver-1.davidcaleb.repl.co/access_token?channelName=${widget.channelName}";

    Response response = await get(Uri.parse(link));
    Map data = jsonDecode(response.body);
    setState(() {
      tempToken = data["token"];
    });
    _client = AgoraClient(
        agoraConnectionData: AgoraConnectionData(
          appId: "c1ccb094672f4e5cac808f0ed59407ca",
          tempToken: ,
          channelName: widget.channelName,
        ),
        enabledPermission: [Permission.camera, Permission.microphone]);
    Future.delayed(const Duration(seconds: 1)).then(
      (value) => setState(() => _loading = false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _loading
            ? const Center(
                child: CircularProgressIndicator(),
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
