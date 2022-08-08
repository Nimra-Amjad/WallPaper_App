// ignore_for_file: prefer_const_constructors

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:wallpaper/models/wallpaper_model.dart';
import 'package:wallpaper/views/image_view.dart';

Widget brandName() {
  return RichText(
      text:
          TextSpan(style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              // ignore: prefer_const_literals_to_create_immutables
              children: [
        TextSpan(text: 'Wallpaper', style: TextStyle(color: Colors.black)),
        TextSpan(text: 'Hub', style: TextStyle(color: Colors.blue)),
      ]));
}

Widget WallpaperList({required List<WallpaperModel> wallpapers, context}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map((wallpaper) {
        return GridTile(
            child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ImageView(
                          imgUrl: wallpaper.src!.portrait,
                        )));
          },
          child: Hero(
            tag: wallpaper.src!.portrait,
            child: Container(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                wallpaper.src!.portrait,
                fit: BoxFit.cover,
              ),
            )),
          ),
        ));
      }).toList(),
    ),
  );
}
