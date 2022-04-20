// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:netflix_clone/models/content_model.dart';
import 'package:netflix_clone/widgets/widgets.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;
  const ContentHeader({Key? key, required this.featuredContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(featuredContent.imageUrl), fit: BoxFit.cover),
          ),
        ),
        Container(
          height: 500,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter),
          ),
        ),
        Positioned(
          bottom: 100,
          child: SizedBox(
            width: 250,
            child: Image.asset(
              (featuredContent.titleImageUrl.toString()),
            ),
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VerticalIconButton(
                  icon: Icons.add,
                  title: "List",
                  onTap: () => debugPrint("My List"),
                ),
                const _PlayButton(),
                VerticalIconButton(
                  icon: Icons.info_outline,
                  title: "Info",
                  onTap: () => debugPrint("Info"),
                ),
              ],
            ))
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      padding: const EdgeInsets.fromLTRB(15, 5, 20, 5),
      color: Colors.white,
      onPressed: () => debugPrint("Play"),
      icon: const Icon(
        Icons.play_arrow,
        size: 30,
        color: Colors.black,
      ),
      label: const Text(
        "Play",
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
      ),
    );
  }
}
