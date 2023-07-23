import 'package:flutter/material.dart';

class HomeModel {
  bool? status;
  DataHomeModel? data;

  HomeModel.FromJson(Map<String , dynamic> json)
  {
     status = json['status'];
     data = DataHomeModel.FromJson(json['data']);
  }
}

class DataHomeModel{

  List<BannerModel> banners = [];
  List<ProductModel> products = [];

  DataHomeModel.FromJson(Map<String , dynamic> json){

    json['banners'].forEach((element){
      banners.add(BannerModel.FromJson(element));
    });

    json['products'].forEach((element){
      products.add(ProductModel.FromJson(element));
    });
  }
}

class BannerModel{
  int? id;
  String? image;
  final String bannerImage ='';

  BannerModel.FromJson(Map<String , dynamic> json){
    id = json['id'];
    image = json['image'];
    this.bannerImage;
  }
}

class ProductModel{

    int? id;
    dynamic price;
    dynamic oldPrice;
    dynamic discount;
    String? image;
    String? name;
    bool? inFavorites;
    bool? inCart;

    ProductModel.FromJson(Map<String, dynamic> json)
    {
      id = json['id'];
      price = json['price'];
      oldPrice = json['old_price'];
      discount = json['discount'];
      image = json['image'];
      name = json['name'];
      inFavorites = json['in_favorites'];
      inCart = json['in_cart'];
    }
}

class BannerImagesModel {

  final String image;

  BannerImagesModel({
    required this.image,
  });
}