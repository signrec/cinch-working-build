import 'package:cinch/camera/screen_camera.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class TakePicture extends StatefulWidget {
  const TakePicture({
    Key? key,
  }) : super(key: key);

  @override
  _TakePictureState createState() => _TakePictureState();
}

class _TakePictureState extends State<TakePicture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Center(
              child: TextButton(
                onPressed: () async {
                  await availableCameras().then((value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OpenCamera(
                            cameras: value,
                          ),
                        ),
                      ));
                },
                child: const Text(
                  "Open Translator",
                  style: TextStyle(
                      color: Color.fromARGB(255, 94, 125, 216), fontSize: 40),
                ),

                // Text(
                //   "Open Translator",
                //   style: GoogleFonts.lato(
                //       textStyle: const TextStyle(
                //     fontWeight: FontWeight.w700,
                //     fontSize: 15,
                //   )),
                // ),
              ),
            ),
          ),
        ));
  }
}
