import '/utils/app_assets.dart';
import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;

  const BackgroundWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Positioned(
            top: 250,
            left: 150,
            child: Container(
              height: MediaQuery.of(context).size.height/1.5,
              width: MediaQuery.of(context).size.width,
              child: Image(
                image: AssetImage(Assets.wavvy),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          child
        ]
    );
  }
}