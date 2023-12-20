import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:image_picker/image_picker.dart';

class Pagethree extends StatefulWidget {
  const Pagethree({Key? key}) : super(key: key);

  @override
  State<Pagethree> createState() => _PagethreeState();
}

class _PagethreeState extends State<Pagethree> {
  VideoPlayerController? _videoController;

  final picker = ImagePicker();
  Future<void> uploadimage() async {
    var videoPicked = await picker.pickVideo(source: ImageSource.gallery);
    if (videoPicked != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        title: Text('Pagethree'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                showGeneralDialog(
                    barrierDismissible: true,
                    barrierLabel: '',
                    transitionDuration: const Duration(milliseconds: 500),
                    context: context,
                    pageBuilder: (context, animationone, animationtow) {
                      return Container();
                    },
                    transitionBuilder:
                        (context, animationone, animationtow, child) {
                      return SlideTransition(
                        position: Tween(begin: Offset(1, 0), end: Offset(0, 0))
                            .animate(animationone),
                        child: AlertDialog(
                          title: Text('hello'),
                          content: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Text('welcome in our page'),
                              Positioned(
                                top: -110,
                                left: 75,
                                child: Image.asset(
                                  'images/erorr.png',
                                  width: 75,
                                ),
                              )
                            ],
                          ),
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide.none),
                          actions: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    primary: Colors.red,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 70)),
                                onPressed: () {},
                                child: Text(
                                  'ok',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic),
                                ))
                          ],
                          actionsAlignment: MainAxisAlignment.center,
                        ),
                      );
                    });
              },
              child: Text('animation1')),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  showGeneralDialog(
                      barrierLabel: '',
                      barrierDismissible: true,
                      transitionDuration: const Duration(milliseconds: 400),
                      context: context,
                      pageBuilder: (context, animationone, animation2) {
                        return Container();
                      },
                      transitionBuilder:
                          (context, animationone, animation2, child) {
                        return ScaleTransition(
                          scale: Tween<double>(begin: 0.0, end: 1.0)
                              .animate(animationone),
                          child: AlertDialog(
                            title: const Text('hello'),
                            content: const Text('welcome in our page'),
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {}, child: Text('ok'))
                            ],
                            actionsAlignment: MainAxisAlignment.center,
                          ),
                        );
                      });
                },
                child: Text('animation')),
          ),
          ElevatedButton(
              onPressed: () {
                showGeneralDialog(
                    barrierDismissible: true,
                    barrierLabel: '',
                    transitionDuration: const Duration(milliseconds: 800),
                    context: context,
                    pageBuilder: (context, animation1, animation2) {
                      return Container();
                    },
                    transitionBuilder:
                        (context, animation1, animation2, child) {
                      return Align(
                        child: SizeTransition(
                          sizeFactor: animation1,
                          child: AlertDialog(
                            backgroundColor: Colors.yellow,
                            title: Text('hello'),
                            content: Text('welcome in our page'),
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40)),
                          ),
                        ),
                      );
                    });
              },
              child: Text('animation2')),
          Expanded(
            child: _videoController != null
                ? VideoPlayer(_videoController!)
                : Text('No video selected'),
          ),
          ElevatedButton(
              onPressed: () {
                uploadimage();
              },
              child: Text('chosse video'))
        ],
      ),
    );
  }
}
