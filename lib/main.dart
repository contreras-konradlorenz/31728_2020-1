// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'src/basics/01_animated_container.dart';
import 'src/basics/02_page_route_builder.dart';
import 'src/basics/03_animation_controller.dart';
import 'src/basics/04_tweens.dart';
import 'src/basics/05_animated_builder.dart';
import 'src/basics/06_custom_tween.dart';
import 'src/basics/07_tween_sequence.dart';
import 'src/basics/08_fade_transition.dart';
import 'src/misc/animated_list.dart';
import 'src/misc/animated_positioned.dart';
import 'src/misc/animated_switcher.dart';
import 'src/misc/card_swipe.dart';
import 'src/misc/carousel.dart';
import 'src/misc/curved_animation.dart';
import 'src/misc/expand_card.dart';
import 'src/misc/focus_image.dart';
import 'src/misc/hero_animation.dart';
import 'src/misc/physics_card_drag.dart';
import 'src/misc/repeating_animation.dart';

void main() => runApp(AnimationSamples());

class Demo {
  final String name;
  final String route;
  final WidgetBuilder builder;

  const Demo({this.name, this.route, this.builder});
}

final basicDemos = [
  Demo(
      name: 'Animando un Container',
      route: AnimatedContainerDemo.routeName,
      builder: (context) => AnimatedContainerDemo()),
  Demo(
      name: 'Animación usando un controlador',
      route: AnimationControllerDemo.routeName,
      builder: (context) => AnimationControllerDemo()),
  Demo(
      name: 'Animación tipo Tween',
      route: TweenDemo.routeName,
      builder: (context) => TweenDemo()),
  Demo(
      name: 'Animación con Builder',
      route: AnimatedBuilderDemo.routeName,
      builder: (context) => AnimatedBuilderDemo()),
  Demo(
      name: 'Animación Tween personalizada',
      route: CustomTweenDemo.routeName,
      builder: (context) => CustomTweenDemo()),
  Demo(
      name: 'Secuencia Tween',
      route: TweenSequenceDemo.routeName,
      builder: (context) => TweenSequenceDemo()),
  Demo(
      name: 'Animación de desvanecimiento',
      route: FadeTransitionDemo.routeName,
      builder: (context) => FadeTransitionDemo()),
];

final transitionDemos = [
  Demo(
      name: 'Transición entre páginas',
      route: PageRouteBuilderDemo.routeName,
      builder: (context) => PageRouteBuilderDemo()),  
];

final miscDemos = [
  Demo(
      name: 'Cambiar tamaño de un card',
      route: ExpandCardDemo.routeName,
      builder: (context) => ExpandCardDemo()),
  Demo(
      name: 'Carousel',
      route: CarouselDemo.routeName,
      builder: (context) => CarouselDemo()),
  Demo(
      name: 'Enfoque de imágen',
      route: FocusImageDemo.routeName,
      builder: (context) => FocusImageDemo()),
  Demo(
      name: 'Pila de tarjetas',
      route: CardSwipeDemo.routeName,
      builder: (context) => CardSwipeDemo()),
  Demo(
      name: 'Animación infinita',
      route: RepeatingAnimationDemo.routeName,
      builder: (context) => RepeatingAnimationDemo()),
  Demo(
      name: 'Física de los elementos',
      route: PhysicsCardDragDemo.routeName,
      builder: (context) => PhysicsCardDragDemo()),
  Demo(
      name: 'Lista animada',
      route: AnimatedListDemo.routeName,
      builder: (context) => AnimatedListDemo()),
  Demo(
      name: 'Moviendo objetos',
      route: AnimatedPositionedDemo.routeName,
      builder: (context) => AnimatedPositionedDemo()),
  Demo(
      name: 'Cambiando objetos',
      route: AnimatedSwitcherDemo.routeName,
      builder: (context) => AnimatedSwitcherDemo()),
  Demo(
      name: 'Selección de elementos',
      route: HeroAnimationDemo.routeName,
      builder: (context) => HeroAnimationDemo()),
  Demo(
      name: 'Animación de traslación',
      route: CurvedAnimationDemo.routeName,
      builder: (context) => CurvedAnimationDemo()),
];

final basicDemoRoutes =
    Map.fromEntries(basicDemos.map((d) => MapEntry(d.route, d.builder)));

final transitionDemoRoutes =
    Map.fromEntries(transitionDemos.map((d) => MapEntry(d.route, d.builder)));

final miscDemoRoutes =
    Map.fromEntries(miscDemos.map((d) => MapEntry(d.route, d.builder)));



final allRoutes = <String, WidgetBuilder>{
  ...basicDemoRoutes,
  ...transitionDemoRoutes,
  ...miscDemoRoutes,
};

class AnimationSamples extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejemplo de animaciones en Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      routes: allRoutes,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    final headerStyle = Theme.of(context).textTheme.headline6;
    return Scaffold(
      appBar: AppBar(
        title: Text('Animaciones'),
      ),
      body: ListView(
        children: [
          ListTile(title: Text('Elementos de animaciones básicas', style: headerStyle)),
          ...basicDemos.map((d) => DemoTile(d)),
          ListTile(title: Text('Transiciones', style: headerStyle)),
          ...transitionDemos.map((d) => DemoTile(d)),
          ListTile(title: Text('Ejemplos varios ', style: headerStyle)),
          ...miscDemos.map((d) => DemoTile(d)),
        ],
      ),
    );
  }
}

class DemoTile extends StatelessWidget {
  final Demo demo;

  DemoTile(this.demo);

  Widget build(BuildContext context) {
    return ListTile(
      title: Text(demo.name),
      onTap: () {
        Navigator.pushNamed(context, demo.route);
      },
    );
  }
}
