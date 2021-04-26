import 'package:flutter/material.dart';
import 'package:shop_app/models/Offer.dart';
import './Category.dart';
import './Brand.dart';

class Product {
  final String id;
  final String title;
  final String description;
  final Category category;
  final Brand brand;
  final List<String> imageUrl;
  final List<String> tags;
  final int numberInStock;
  final double price;
  final double discount;
  final Map<String, String> features;
  final double rating;
  final List<Offer> offers;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.category,
    @required this.brand,
    @required this.imageUrl,
    @required this.tags,
    @required this.numberInStock,
    @required this.price,
    @required this.discount,
    @required this.features,
    @required this.rating,
    @required this.offers,
  });

  List<Offer> getOffers(OfferType type) {
    return offers.where((o) => o.offerType == type).toList();
  }
}
