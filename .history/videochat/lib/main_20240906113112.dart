import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("video chat app"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(
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
                fixedSize: Size(350, 30),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.margin),
              label: Text("Join with a code"),
              style: OutlinedButton.styleFrom(
                fixedSize: Size(350, 30),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
              ),
            ),
          ),
          SizedBox(
            height: 0,
          ),
          Image.network(
              "https://static.vecteezy.com/system/resources/previews/022/453/608/non_2x/3d-business-call-video-png.png")
        ],
      ),
    );
  }
}
