import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GeneratePage extends StatefulWidget {
  const GeneratePage({super.key});

  @override
  State<StatefulWidget> createState() => GeneratePageState();
}

class GeneratePageState extends State<GeneratePage> {
  String qrData = "https://youtu.be/dQw4w9WgXcQ"; // not a rick roll

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('QR Code Generator'),
        actions: const <Widget>[],
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            QrImage(
              size: 200,
              backgroundColor: Colors.white,
              //place where the QR Image will be shown
              data: qrData,
            ),
            const SizedBox(
              height: 22.0,
            ),
            const Text(
              "New QR Link Generator",
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            const SizedBox(
              height: 15.0,
            ),
            TextField(
              controller: qrDataFeed,
              style: const TextStyle(color: CupertinoColors.systemYellow),
              decoration: const InputDecoration(
                hintText: "Input your link or data",
                hintStyle: TextStyle(color: Colors.white),
                hoverColor: CupertinoColors.systemYellow,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
              child: MaterialButton(
                padding: const EdgeInsets.all(15.0),
                onPressed: () async {
                  if (qrDataFeed.text.isEmpty) {
                    setState(() {
                      qrData = "";
                    });
                  } else {
                    setState(() {
                      qrData = qrDataFeed.text;
                    });
                  }
                },
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.orange, width: 3.0),
                    borderRadius: BorderRadius.circular(20.0)),
                child: const Text(
                  "Generate QR",
                  style: TextStyle(
                      color: Colors.yellowAccent, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  final qrDataFeed = TextEditingController();
}
