// ignore_for_file: unnecessary_new, unused_local_variable

import 'package:wallpaper/models/category_model.dart';

String apiKey = "563492ad6f9170000100000164209f98b9d7482182a9232f8c7a9806";

List<CategoryName> getcategory() {
  List<CategoryName> categories = [];
  CategoryName categoryName = new CategoryName();

  categoryName.imgUrl =
      "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoryName.categoryName = "Street Art";
  categories.add(categoryName);
  categoryName = new CategoryName();

  //
  categoryName.imgUrl =
      "https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoryName.categoryName = "Wild Life";
  categories.add(categoryName);
  categoryName = new CategoryName();

  //
  categoryName.imgUrl =
      "https://images.pexels.com/photos/34950/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoryName.categoryName = "Nature";
  categories.add(categoryName);
  categoryName = new CategoryName();

  //
  categoryName.imgUrl =
      "https://images.pexels.com/photos/466685/pexels-photo-466685.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoryName.categoryName = "City";
  categories.add(categoryName);
  categoryName = new CategoryName();

  //
  categoryName.imgUrl =
      "https://images.pexels.com/photos/1434819/pexels-photo-1434819.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  categoryName.categoryName = "Motivation";
  categories.add(categoryName);
  categoryName = new CategoryName();

  //
  categoryName.imgUrl =
      "https://images.pexels.com/photos/2116475/pexels-photo-2116475.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoryName.categoryName = "Bikes";
  categories.add(categoryName);
  categoryName = new CategoryName();

  //
  categoryName.imgUrl =
      "https://images.pexels.com/photos/1149137/pexels-photo-1149137.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoryName.categoryName = "Cars";
  categories.add(categoryName);
  categoryName = new CategoryName();

  return categories;
}
