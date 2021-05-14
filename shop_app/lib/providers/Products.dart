import 'package:flutter/material.dart';
import 'package:shop_app/models/Offer.dart';

import '../models/Product.dart';
import '../models/Category.dart';
import '../models/Brand.dart';

class Products with ChangeNotifier {
  Map<String, Product> _products = {
    '607d84d25d6eb303c4b3e617': Product(
      id: '607d84d25d6eb303c4b3e617',
      title: 'White Earphones',
      rating: 1.5,
      brand: Brand(
        id: '607d4ffc5cc5682098258ab6',
        name: 'White Fish',
        imageUrl: 'https://www.iconsdb.com/icons/preview/white/fish-8-xxl.png',
      ),
      category: Category(
        id: '607d4ffc5cc5682098258ab4',
        name: 'Electronics',
        imageUrl:
            'https://www.iconsdb.com/icons/preview/black/electronics-xxl.png',
      ),
      offers: [
        Offer(
          offerType: OfferType.BankOffer,
          discount: 10.0,
          title:
              '10% off on HDFC Bank Credit Card and Credit/Debit EMI Transactions',
        ),
        Offer(
          offerType: OfferType.BankOffer,
          discount: 5.0,
          title: '5% Unlimited Cashback on Flipkart Axis Bank Credit Card',
        ),
        Offer(
          offerType: OfferType.BankOffer,
          discount: 10.0,
          title:
              '10% Off on Bank of Baroda Mastercard debit card first time transaction, Terms and Condition apply',
        ),
        Offer(
          offerType: OfferType.NoCostEMIOffer,
          discount: 5.0,
          title: 'No Cost EMI on Flipkart Axis Bank Credit Card',
        ),
      ],
      description:
          'The Wireled Earphones will enhance the way you listen to music, with its convenient features. This pair of earphones supports quality. Oh, and it offers a playback time of up to 17 hours when it is fully charged.',
      features: {
        "Brand": "RedCherry",
        "Model": "E101B",
        "Color": "Pure White",
        "Headphone Type": "In The Ear",
        "Inline Remote": "Yes",
        "Sales Package": "Wireless Earphone, User Guide, Membership Card",
        "Sweat Proof": "Yes",
        "Deep Bass": "Yes",
        "With Microphone": "Yes",
        "Domestic Warranty": "1 Year"
      },
      imageUrl: [
        'https://cdn.pixabay.com/photo/2014/04/05/11/41/earphone-316753__340.jpg',
        'https://cdn.pixabay.com/photo/2017/12/26/22/06/flower-3041518__340.jpg'
      ],
      numberInStock: 10,
      price: 499,
      discount: 7.5,
      tags: ['earphones', 'headset', 'white'],
    ),
    '607d84d95d6eb303c4b3e619': Product(
      id: '607d84d95d6eb303c4b3e619',
      title: 'Matte Black Headphones',
      brand: Brand(
        id: '607d7b7be9489b13d02f66fc',
        name: 'Black Horse',
        imageUrl: 'https://image.flaticon.com/icons/png/512/32/32707.png',
      ),
      category: Category(
        id: '607d4ffc5cc5682098258ab4',
        name: 'Electronics',
        imageUrl:
            'https://www.iconsdb.com/icons/preview/black/electronics-xxl.png',
      ),
      rating: 4,
      offers: [
        Offer(
          offerType: OfferType.BankOffer,
          discount: 10.0,
          title:
              '10% off on HDFC Bank Credit Card and Credit/Debit EMI Transactions',
        ),
        Offer(
          offerType: OfferType.BankOffer,
          discount: 5.0,
          title: '5% Unlimited Cashback on Flipkart Axis Bank Credit Card',
        ),
        Offer(
          offerType: OfferType.BankOffer,
          discount: 10.0,
          title:
              '10% Off on Bank of Baroda Mastercard debit card first time transaction, Terms and Condition apply',
        ),
        Offer(
          offerType: OfferType.NoCostEMIOffer,
          discount: 5.0,
          title: 'No Cost EMI on Flipkart Axis Bank Credit Card',
        ),
        Offer(
          offerType: OfferType.PartnerOffer,
          discount: 28.0,
          title: 'GST Invoice Available! Save up to 28% for business purchases',
        ),
      ],
      description:
          'Are you looking for a headset that features eye-catching aesthetics and dual modes? If yes, bring home the boAt Rockerz 450 that has an AUX-mode as well as the Bluetooth connectivity feature. The 40-mm drivers and adjustable earcups ensure you enjoy a comfortable listening experience that is immersive.',
      features: {
        "Model Name": "Rockerz 450",
        "Color": "Matte White",
        "Headphone Type": "On The Ear",
        "Inline Remote": "Yes",
        "Sales Package":
            "Rockerz 450, Charging Cable, User Manual, Warranty Card",
        "Connectivity": "Bluetooth"
      },
      imageUrl: [
        'https://cdn.pixabay.com/photo/2016/01/09/07/44/headphone-1129896__340.png',
        'https://cdn.pixabay.com/photo/2015/03/26/09/58/headphones-690685__340.jpg'
      ],
      numberInStock: 3,
      price: 1999,
      discount: 10,
      tags: ['headphones', 'black', 'bluetooth', 'wireless'],
    ),
    '607d861022958819cc9b8278': Product(
      id: '607d861022958819cc9b8278',
      title: 'Solid Men Henley Neck Red T-Shirt',
      rating: 4.5,
      brand: Brand(
        id: '607d7b7be9489b13d02f66fd',
        name: 'Red Cherry',
        imageUrl: 'https://www.iconsdb.com/icons/preview/red/cherry-xxl.png',
      ),
      category: Category(
        id: '607d4ffc5cc5682098258ab6',
        name: 'Fashion',
        imageUrl:
            'https://cdn4.iconfinder.com/data/icons/geometrica-1/48/crutch-coat-hanger-dress-512.png',
      ),
      description: '',
      offers: [
        Offer(
          offerType: OfferType.BankOffer,
          discount: 10.0,
          title:
              '10% off on HDFC Bank Credit Card and Credit/Debit EMI Transactions',
        ),
        Offer(
          offerType: OfferType.BankOffer,
          discount: 5.0,
          title: '5% Unlimited Cashback on Flipkart Axis Bank Credit Card',
        ),
        Offer(
          offerType: OfferType.BankOffer,
          discount: 10.0,
          title:
              '10% Off on Bank of Baroda Mastercard debit card first time transaction, Terms and Condition apply',
        ),
        Offer(
          offerType: OfferType.NoCostEMIOffer,
          discount: 5.0,
          title: 'No Cost EMI on Flipkart Axis Bank Credit Card',
        ),
        Offer(
          offerType: OfferType.PartnerOffer,
          discount: 28.0,
          title: 'GST Invoice Available! Save up to 28% for business purchases',
        ),
      ],
      features: {
        "Type": "Henley Neck",
        "Sleeve": "Full Sleeve",
        "Fabric": "Cotton Blend"
      },
      imageUrl: [
        'https://cdn.pixabay.com/photo/2013/07/13/14/08/apparel-162192__340.png',
        'https://cdn.pixabay.com/photo/2016/08/15/19/57/red-devils-1596355__340.jpg'
      ],
      numberInStock: 2,
      price: 1399,
      discount: 21.5,
      tags: ['tshirt', 'shirt', 'men', 'clothing', 'red'],
    ),
    '607d861a22958819cc9b827a': Product(
      id: '607d861a22958819cc9b827a',
      title: '3 Seater Sofa  (Finish Color - Dark Grey)',
      rating: 5,
      brand: Brand(
        id: '607d4ffc5cc5682098258ab4',
        name: 'Blue Dragon',
        imageUrl:
            'https://pixfeeds.com/images/astrology/zodiac-signs/1200-92040747-dragon-zodiac-sign.jpg',
      ),
      category: Category(
        id: '607d7b7be9489b13d02f66fc',
        name: 'Home',
        imageUrl: 'https://www.iconsdb.com/icons/preview/black/home-xxl.png',
      ),
      description: '',
      features: {
        "Secondary Material": "Solid Wood",
        "Width": "95 cm",
        "Height": "36 cm",
        "Depth": "40 cm",
        "Weight": "35 kg"
      },
      offers: [
        Offer(
          offerType: OfferType.BankOffer,
          discount: 10.0,
          title:
              '10% off on HDFC Bank Credit Card and Credit/Debit EMI Transactions',
        ),
        Offer(
          offerType: OfferType.BankOffer,
          discount: 5.0,
          title: '5% Unlimited Cashback on Flipkart Axis Bank Credit Card',
        ),
        Offer(
          offerType: OfferType.BankOffer,
          discount: 10.0,
          title:
              '10% Off on Bank of Baroda Mastercard debit card first time transaction, Terms and Condition apply',
        ),
        Offer(
          offerType: OfferType.NoCostEMIOffer,
          discount: 5.0,
          title: 'No Cost EMI on Flipkart Axis Bank Credit Card',
        ),
        Offer(
          offerType: OfferType.PartnerOffer,
          discount: 28.0,
          title: 'GST Invoice Available! Save up to 28% for business purchases',
        ),
      ],
      imageUrl: [
        'https://cdn.pixabay.com/photo/2017/08/02/01/01/living-room-2569325__340.jpg',
        'https://cdn.pixabay.com/photo/2017/05/23/14/11/sofa-2337362__340.jpg'
      ],
      numberInStock: 1,
      discount: 15,
      price: 8499,
      tags: ['sofa', 'living', 'room'],
    ),
    '607d862122958819cc9b827c': Product(
      id: '607d862122958819cc9b827c',
      title: 'L Frost Free Double Door 3 Star Convertible Refrigerator',
      rating: 4.5,
      brand: Brand(
        id: '607d4ffc5cc5682098258ab5',
        name: 'Orange Jelly',
        imageUrl:
            'https://image.freepik.com/free-vector/orange-slice-jelly-candy-icon_100011-189.jpg',
      ),
      category: Category(
        id: '607d4ffc5cc5682098258ab4',
        name: 'Electronics',
        imageUrl:
            'https://www.iconsdb.com/icons/preview/black/electronics-xxl.png',
      ),
      description:
          'Beat the heat this summer with this double-door 3-in-1 convertible refrigerator. It provides you with extra cooling space by easily converting your freezer into a fridge. Moreover, the built-in deodorizer of this product removes odours and keeps your food fresh. Furthermore, the all-around cooling system optimally cools every nook and cranny of this refrigerator.',
      features: {
        "Type": "Double Door",
        "Capacity": "253 L",
        "Star Rating": "3",
        "Shelf Material": "Toughened Glass"
      },
      offers: [
        Offer(
          offerType: OfferType.BankOffer,
          discount: 10.0,
          title:
              '10% off on HDFC Bank Credit Card and Credit/Debit EMI Transactions',
        ),
        Offer(
          offerType: OfferType.BankOffer,
          discount: 5.0,
          title: '5% Unlimited Cashback on Flipkart Axis Bank Credit Card',
        ),
        Offer(
          offerType: OfferType.BankOffer,
          discount: 10.0,
          title:
              '10% Off on Bank of Baroda Mastercard debit card first time transaction, Terms and Condition apply',
        ),
        Offer(
          offerType: OfferType.NoCostEMIOffer,
          discount: 5.0,
          title: 'No Cost EMI on Flipkart Axis Bank Credit Card',
        ),
        Offer(
          offerType: OfferType.SpecialPriceOffer,
          discount: 5.0,
          title: 'Get extra 5% off',
        ),
        Offer(
          offerType: OfferType.PartnerOffer,
          discount: 28.0,
          title: 'GST Invoice Available! Save up to 28% for business purchases',
        ),
      ],
      imageUrl: [
        'https://cdn.pixabay.com/photo/2016/10/24/21/03/appliance-1767311__340.jpg',
        'https://media.istockphoto.com/photos/double-door-fridge-refrigerator-with-sidebyside-door-system-on-the-picture-id1284615609?b=1&k=6&m=1284615609&s=170667a&w=0&h=4O9HYrd2Sk7VP-oPyZxh7zp4acUwVNnUpoVhiMNVlss='
      ],
      numberInStock: 1,
      price: 31990,
      discount: 5,
      tags: ['fridge', 'refrigerator', 'double', 'door'],
    ),
    '607d85e0e23b9720ac65cb59': Product(
      id: '607d85e0e23b9720ac65cb59',
      title: 'Jewel Set (White)',
      rating: 2,
      brand: Brand(
        id: '607d4ffc5cc5682098258ab4',
        name: 'Blue Dragon',
        imageUrl:
            'https://pixfeeds.com/images/astrology/zodiac-signs/1200-92040747-dragon-zodiac-sign.jpg',
      ),
      category: Category(
        id: '607d4ffc5cc5682098258ab5',
        name: 'Others',
        imageUrl:
            'https://cdn1.iconfinder.com/data/icons/smoothline-action/30/action_028-detail-more-info-others-512.png',
      ),
      description: '',
      offers: [
        Offer(
          offerType: OfferType.BankOffer,
          discount: 10.0,
          title:
              '10% off on HDFC Bank Credit Card and Credit/Debit EMI Transactions',
        ),
        Offer(
          offerType: OfferType.BankOffer,
          discount: 5.0,
          title: '5% Unlimited Cashback on Flipkart Axis Bank Credit Card',
        ),
        Offer(
          offerType: OfferType.BankOffer,
          discount: 10.0,
          title:
              '10% Off on Bank of Baroda Mastercard debit card first time transaction, Terms and Condition apply',
        ),
        Offer(
          offerType: OfferType.NoCostEMIOffer,
          discount: 5.0,
          title: 'No Cost EMI on Flipkart Axis Bank Credit Card',
        ),
        Offer(
          offerType: OfferType.PartnerOffer,
          discount: 28.0,
          title: 'GST Invoice Available! Save up to 28% for business purchases',
        ),
      ],
      features: {
        "Model Number": "R165",
        "Base Material": "Alloy",
        "Color": "White"
      },
      imageUrl: [
        'https://cdn.pixabay.com/photo/2014/11/05/19/26/woman-518275__340.jpg',
        'https://cdn.pixabay.com/photo/2015/03/12/01/42/apatite-669515__340.jpg'
      ],
      numberInStock: 0,
      price: 849,
      discount: 3,
      tags: ['jewellery', 'white', 'set'],
    ),
  };

  List<Product> get products {
    return [..._products.values];
  }

  List<Product> fetchByBrand(Brand brand) {
    return _products.values.where((p) => p.brand.id == brand.id).toList();
  }

  List<Product> fetchByCategory(Category category) {
    return _products.values.where((p) => p.category.id == category.id).toList();
  }

  Product findById(String id) {
    return _products[id];
  }

  Set<Brand> getBrandsByCategory(Category category) {
    return _products.values
        .where((p) => p.category.id == category.id)
        .map((p) => p.brand)
        .toSet();
  }

  void decreaseQuantity(String id, int qtyToDecrease) {
    _products.update(
        id,
        (p) => Product(
              brand: p.brand,
              category: p.category,
              description: p.description,
              discount: p.discount,
              features: p.features,
              id: p.id,
              imageUrl: p.imageUrl,
              offers: p.offers,
              price: p.price,
              rating: p.rating,
              tags: p.tags,
              title: p.title,
              numberInStock: (p.numberInStock - qtyToDecrease) > 0
                  ? p.numberInStock - qtyToDecrease
                  : 0,
            ));
  }
}
