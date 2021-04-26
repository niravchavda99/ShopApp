import 'package:flutter/material.dart';

enum OfferType { BankOffer, PartnerOffer, SpecialPriceOffer, NoCostEMIOffer }

class Offer {
  final OfferType offerType;
  final String title;
  final double discount;

  Offer({
    @required this.offerType,
    @required this.title,
    @required this.discount,
  });

  String get type {
    switch (offerType) {
      case OfferType.BankOffer:
        return 'Bank Offer';
      case OfferType.PartnerOffer:
        return 'Partner Offer';
      case OfferType.SpecialPriceOffer:
        return 'Special Price Offer';
      case OfferType.NoCostEMIOffer:
        return 'No Cost EMI Offer';
      default:
        return 'Other Offer';
    }
  }
}
