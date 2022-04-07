import 'package:flutter/material.dart';
import '/utils/app_assets.dart';

class Loading extends StatefulWidget {
  double size;

  Loading({Key? key, this.size = 0}) : super(key: key);

  @override
  LoadingState createState() => LoadingState();
}

class LoadingState extends State<Loading> with TickerProviderStateMixin {
  AnimationController? controller;
  Animation<int>? animation;

  double? size;

  LoadingState({this.size, this.controller, this.animation});

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1100))
      ..repeat();
    animation = IntTween(begin: 1, end: 51).animate(controller!);
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: size ?? 150,
        height: size ?? 150,
        child: AnimatedBuilder(
          animation: animation!,
          builder: (BuildContext context, Widget? child) {
            String frame = animation!.value.toString().padLeft(2, '0');
            return Column(
              children: [
                Image.asset(
                  Assets.logo,
                  gaplessPlayback: true,
                  height: 80,
                  width: 80,
                ),
                const Spacer(),
                const Text("Please Wait ..."),
                const CircularProgressIndicator()
              ],
            );
          },
        ),
      ),
    );
  }
}
