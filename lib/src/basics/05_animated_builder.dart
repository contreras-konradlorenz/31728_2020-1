// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class AnimatedBuilderDemo extends StatefulWidget {
  static const String routeName = '/basics/animated_builder';

  _AnimatedBuilderDemoState createState() => _AnimatedBuilderDemoState();
}

class _AnimatedBuilderDemoState extends State<AnimatedBuilderDemo>
    with SingleTickerProviderStateMixin {
  static const Color beginColor = Colors.deepPurple;
  static const Color endColor = Colors.deepOrange;
  Duration duration = Duration(milliseconds: 800);
  AnimationController controller;
  Animation<Color> animation;

  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: duration);
    animation =
        ColorTween(begin: beginColor, end: endColor).animate(controller);
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        // AnimatedBuilder handles listening to a given animation and calling the builder
        // whenever the value of the animation change. This can be useful when a Widget
        // tree contains some animated and non-animated elements, as only the subtree
        // created by the builder needs to be re-built when the animation changes.
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return MaterialButton(
              color: animation.value,
              child: child,
              onPressed: () {
                if (controller.status == AnimationStatus.completed) {
                  controller.reverse();
                } else {
                  controller.forward();
                }
              },
            );
          },
          // AnimatedBuilder can also accept a pre-built child Widget which is useful
          // if there is a non-animated Widget contained within the animated widget.
          // This can improve performance since this widget doesn't need to be rebuilt
          // when the animation changes.
          child: Text(
            'Cambiar color',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}