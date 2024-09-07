import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videochat/pages/meetingjoincode.dart';
import 'package:videochat/pages/new_meeting.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("video chat app"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Get.to(const NewMeeting());
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "New Meeting",
                    style: TextStyle(color: Colors.white),
                    // selectionColor: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    fixedSize: const Size(350, 30),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: OutlinedButton.icon(
                  onPressed: () {
                    Get.to(() => JoinWithCode());
                  },
                  icon: const Icon(Icons.margin),
                  label: const Text("Join with a code"),
                  style: OutlinedButton.styleFrom(
                    fixedSize: const Size(350, 30),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
                width: 10,
              ),
              Image.network(
                "https://static.vecteezy.com/system/resources/previews/022/453/608/non_2x/3d-business-call-video-png.png",
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error,
                      size: 100,
                      color: Colors
                          .red); // Fallback in case the image fails to load
                },
              ),
            ],
          ),
        ));
  }
}
