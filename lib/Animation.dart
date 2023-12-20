import 'package:flutter/material.dart';

class Animation1 extends PageRouteBuilder {
  final page;
  Animation1({this.page})
      : super(
            pageBuilder: (context, animation, animationtow) => page,
            transitionsBuilder: (context, animation, animationtow, child) {
              // var begin = 0.0;
              // var end = 1.0;
              // var tween = Tween(begin: begin, end: end);
              //var offsetanimation = animation.drive(tween);
              //   var curvesanimation =
              //    CurvedAnimation(parent: animation, curve: Curves.easeInBack);

              return Align(
                child: SizeTransition(
                  sizeFactor: animation,
                  child: child,
                ),
              );
            });
}
