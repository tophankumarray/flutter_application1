// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

// ignore: use_key_in_widget_constructors
class DemoPage extends StatefulWidget {
  // ignore: library_private_types_in_public_api, annotate_overrides
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  final controller = ScreenshotController();
  // ignore: non_constant_identifier_names
  Widget ButtonWidget(String text, Function onClicked) {
    return ElevatedButton(
      onPressed: onClicked(),
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) => Screenshot(
        controller: controller,
        child: Scaffold(
          body: Column(
            children: [
              buildImage(),
              const SizedBox(
                height: 32,
              ),
              ButtonWidget("Capture Screen", () async {
                final image = await controller.capture();
                if (image == null) return;
                await saveImage(image);
              }),
              const SizedBox(
                height: 16,
              ),
              ButtonWidget("Capture Wiget", () async {
                final image = await controller.captureFromWidget(
                  buildImage(),
                );
                saveAndShare(image);
              }),
            ],
          ),
        ),
      );

  Future saveAndShare(Uint8List bytes) async {
    final directory = await getApplicationDocumentsDirectory();
    final image = File('${directory.path}/flutter.png');
    image.writeAsBytesSync(bytes);
    // ignore: prefer_const_declarations
    final text = 'Shared From Facebook';
    await Share.shareFiles([image.path], text: text);
  }

  Future<String> saveImage(Uint8List bytes) async {
    await [Permission.storage].request();
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('from', 'replace')
        .replaceAll('from', 'replace');
    final name = 'screenshot_$time';
    final result = await ImageGallerySaver.saveImage(bytes, name: name);
    return result['filePath'];
  }
}

Widget buildImage() => Stack(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Image.asset(
            'image/c.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 16,
          right: 0,
          left: 0,
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              color: Colors.black,
              child: const Text(
                'Summer  ❤️',
                style: TextStyle(color: Colors.white, fontSize: 32),
              ),
            ),
          ),
        ),
      ],
    );
