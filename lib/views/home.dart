// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new

import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:wallpaper/data/data.dart';
import 'package:wallpaper/models/category_model.dart';
import 'package:wallpaper/models/wallpaper_model.dart';
import 'package:wallpaper/views/categories.dart';
import 'package:wallpaper/views/image_view.dart';
import 'package:wallpaper/views/search.dart';
import 'package:wallpaper/widgets/widget.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryName> categories = [];
  List<WallpaperModel> wallpapers = [];
  TextEditingController searchcontroller = new TextEditingController();
  gettrendingwallpaper() async {
    var response = await http.get(
        Uri.parse("https://api.pexels.com/v1/curated?per_page=15"),
        headers: {"Authorization": apiKey});
    //print(response.body.toString());

    Map<String, dynamic> jsondata = jsonDecode(response.body);
    jsondata["photos"].forEach((element) {
      // print(element);
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });
    setState(() {});
  }

  @override
  void initState() {
    gettrendingwallpaper();
    categories = getcategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: brandName(),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Color(0xfff5f8fd),
                  borderRadius: BorderRadius.circular(30)),
              margin: EdgeInsets.symmetric(horizontal: 24),
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: searchcontroller,
                      decoration: InputDecoration(
                          hintText: "Search Wallpaper",
                          border: InputBorder.none),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Search(
                                      searchquery: searchcontroller.text,
                                    )));
                      },
                      child: Container(child: Icon(Icons.search))),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 80,
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: ListView.builder(
                  itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategoryTile(
                        imgUrl: categories[index].imgUrl,
                        title: categories[index].categoryName);
                  }),
            ),
            SizedBox(
              height: 16,
            ),
            WallpaperList(wallpapers: wallpapers, context: context),
          ],
        )),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  const CategoryTile({Key? key, required this.imgUrl, required this.title})
      : super(key: key);
  final String imgUrl, title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Category(categoryName: title.toLowerCase())));
      },
      child: Container(
        margin: EdgeInsets.only(right: 4),
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imgUrl,
              height: 50,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(8),
            ),
            height: 50,
            width: 100,
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
