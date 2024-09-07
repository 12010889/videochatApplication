import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:video_conference/video_call.dart';
import 'package:videochat/video_call.dart';

class JoinWithCode extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  JoinWithCode({super.key});

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
                child: const Icon(Icons.arrow_back_ios_new_sharp, size: 35),
              ),
            ),
            const SizedBox(height: 50),
            Image.network(
              "https://user-images.githubusercontent.com/67534990/127776450-6c7a9470-d4e2-4780-ab10-143f5f86a26e.png",
              fit: BoxFit.cover,
              height: 50,
            ),
            const SizedBox(height: 20),
            const Text(
              "Enter meeting code below",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
              child: Card(
                color: Colors.grey[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextField(
                  controller: _controller,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: "abc-efg-dhi"),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => VideoCall(channelName: _controller.text.trim()));
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 30),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
              ),
              child: const Text("Join"),
            ),
          ],
        ),
      ),
    );
  }
}
