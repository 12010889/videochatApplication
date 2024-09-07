import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:uuid/uuid.dart';
// import 'package:video_conference/video_call.dart';
import 'package:videochat/video_call.dart';

class NewMeeting extends StatefulWidget {
  const NewMeeting({super.key});

  @override
  _NewMeetingState createState() => _NewMeetingState();
}

class _NewMeetingState extends State<NewMeeting> {
  String _meetingCode = "abcdfgqw";

  @override
  void initState() {
    var uuid = Uuid();
    _meetingCode = uuid.v1().substring(0, 8);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                onTap: Get.back,
                child: Icon(Icons.arrow_back_ios_new_sharp, size: 35),
              ),
            ),
            const SizedBox(height: 50),
            Image.network(
              "https://as2.ftcdn.net/v2/jpg/07/66/39/25/1000_F_766392570_uBlLv7UkBDCgPG4bnsxu6nzphKREQsUT.jpg",
              fit: BoxFit.cover,
              height: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              "Enter meeting code below",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
              child: Card(
                  color: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.link),
                    title: SelectableText(
                      _meetingCode,
                      style: const TextStyle(fontWeight: FontWeight.w300),
                    ),
                    trailing: const Icon(Icons.copy),
                  )),
            ),
            const Divider(thickness: 1, height: 40, indent: 20, endIndent: 20),
            ElevatedButton.icon(
              onPressed: () {
                Share.share("Meeting Code : $_meetingCode");
              },
              icon: const Icon(Icons.arrow_drop_down),
              label: const Text("Share invite"),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(350, 30),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
              ),
            ),
            const SizedBox(height: 20),
            OutlinedButton.icon(
              onPressed: () {
                Get.to(() => VideoCall(channelName: _meetingCode.trim()));
              },
              icon: const Icon(Icons.video_call),
              label: const Text("start call"),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.indigo,
                side: const BorderSide(color: Colors.indigo),
                fixedSize: const Size(350, 30),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
