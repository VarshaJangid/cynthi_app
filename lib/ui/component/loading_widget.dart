import 'package:flutter/material.dart';
import 'dart:math';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Container(
        color: Colors.transparent,
        width: double.maxFinite,
        height: double.maxFinite,
        child: const Align(
          alignment: Alignment.center,
          child: CircularProgressIndicator(),
        ),
      ),
      onWillPop: () async {
        return false;
      },
    );
  }
}

class InternetLoader extends StatelessWidget {
  const InternetLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Container(
        color: Colors.transparent,
        width: double.maxFinite,
        height: double.maxFinite,
        child: const Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
              padding: EdgeInsets.all(8.0), child: CircularProgressIndicator()),
        ),
      ),
      onWillPop: () async {
        return false;
      },
    );
  }
}

class LoadingWidget extends StatefulWidget {
  final double radius;
  final double iconSize;
  final double size;

  LoadingWidget({this.radius = 60.0, this.iconSize = 30.0, this.size = 100.0});

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with SingleTickerProviderStateMixin {
  Animation<double>? animationRotation;
  Animation<double>? animationRadiusIn;
  Animation<double>? animationRadiusOut;
  AnimationController? controller;

  double radius = 0.0;
  double dotRadius = 0.0;
  double size = 0.0;

  @override
  void initState() {
    super.initState();

    radius = widget.radius;
    dotRadius = widget.iconSize;
    size = widget.size;

    controller = AnimationController(
        lowerBound: 0.0,
        upperBound: 1.0,
        duration: const Duration(milliseconds: 3000),
        vsync: this);

    animationRotation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller!,
        curve: const Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );

    animationRadiusIn = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller!,
        curve: const Interval(0.75, 1.0, curve: Curves.elasticIn),
      ),
    );

    animationRadiusOut = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller!,
        curve: const Interval(0.0, 0.25, curve: Curves.elasticOut),
      ),
    );

    controller!.addListener(() {
      setState(() {
        if (controller!.value >= 0.75 && controller!.value <= 1.0) {
          radius = widget.radius * animationRadiusIn!.value;
        } else if (controller!.value >= 0.0 && controller!.value <= 0.25) {
          radius = widget.radius * animationRadiusOut!.value;
        }
      });
    });

    controller!.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      //color: Colors.black12,
      child: Center(
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              RotationTransition(
                turns: animationRotation!,
                child: Stack(
                  children: <Widget>[
                    Transform.translate(
                      offset: Offset(
                        radius * cos(0.0),
                        radius * sin(0.0),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(
                        radius * cos(0.0 + 1 * pi / 4),
                        radius * sin(0.0 + 1 * pi / 4),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(
                        radius * cos(0.0 + 2 * pi / 4),
                        radius * sin(0.0 + 2 * pi / 4),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(
                        radius * cos(0.0 + 3 * pi / 4),
                        radius * sin(0.0 + 3 * pi / 4),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(
                        radius * cos(0.0 + 4 * pi / 4),
                        radius * sin(0.0 + 4 * pi / 4),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(
                        radius * cos(0.0 + 5 * pi / 4),
                        radius * sin(0.0 + 5 * pi / 4),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(
                        radius * cos(0.0 + 6 * pi / 4),
                        radius * sin(0.0 + 6 * pi / 4),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(
                        radius * cos(0.0 + 7 * pi / 4),
                        radius * sin(0.0 + 7 * pi / 4),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
}

class IconWidget extends StatelessWidget {
  final double size;
  final Color color;
  final IconData? icon;

  IconWidget({this.size = 0.0, this.color = Colors.blue, this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        icon,
        size: size,
        color: color,
      ),
    );
  }
}

class SimpleLoadingWidget extends StatelessWidget {
  final double size;
  final String image;
  final Color color;

  const SimpleLoadingWidget({
    this.size = 150.0,
    this.image = '',
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Image(
        color: color,
        image: AssetImage(image),
      ),
    );
  }
}
