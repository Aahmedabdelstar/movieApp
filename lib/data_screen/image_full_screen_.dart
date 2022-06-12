import 'package:flutter/material.dart';

import '../resource/assets_manager.dart';

class ImageFullScreen extends StatefulWidget {
  final String? imageUrl;

  ImageFullScreen({this.imageUrl});

  @override
  _ImageFullScreenState createState() => _ImageFullScreenState();
}


class _ImageFullScreenState extends State<ImageFullScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Container(
              margin: const EdgeInsets.only(top: 48, left: 32, right: 32),
              alignment: AlignmentDirectional.topEnd,
              child: const Icon(Icons.close),
            ),
          ),
          Center(
            child: widget.imageUrl!.isEmpty ? Image.asset(ImageAssets.logoSplashScreen) : Image.network(widget.imageUrl!, fit: BoxFit.fitWidth,)
          ),
        ],
      ),
    );
  }
}
