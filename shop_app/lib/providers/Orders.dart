import 'package:flutter/cupertino.dart';
import 'package:shop_app/models/Brand.dart';
import 'package:shop_app/models/CartItem.dart';
import 'package:shop_app/models/Category.dart';
import 'package:shop_app/models/Offer.dart';
import 'package:shop_app/models/Order.dart';
import 'package:shop_app/models/Product.dart';

class Orders with ChangeNotifier {
  List<Order> _orders = [
    // Order(
    //   products: [
    //     CartItem(
    //       product: Product(
    //         id: '607d84d25d6eb303c4b3e617',
    //         title: 'White Earphones',
    //         rating: 1.5,
    //         brand: Brand(
    //           id: '607d4ffc5cc5682098258ab6',
    //           name: 'White Fish',
    //           imageUrl:
    //               'https://www.iconsdb.com/icons/preview/white/fish-8-xxl.png',
    //         ),
    //         category: Category(
    //           id: '607d4ffc5cc5682098258ab4',
    //           name: 'Electronics',
    //           imageUrl:
    //               'https://www.iconsdb.com/icons/preview/black/electronics-xxl.png',
    //         ),
    //         offers: [
    //           Offer(
    //             offerType: OfferType.BankOffer,
    //             discount: 10.0,
    //             title:
    //                 '10% off on HDFC Bank Credit Card and Credit/Debit EMI Transactions',
    //           ),
    //           Offer(
    //             offerType: OfferType.BankOffer,
    //             discount: 5.0,
    //             title:
    //                 '5% Unlimited Cashback on Flipkart Axis Bank Credit Card',
    //           ),
    //           Offer(
    //             offerType: OfferType.BankOffer,
    //             discount: 10.0,
    //             title:
    //                 '10% Off on Bank of Baroda Mastercard debit card first time transaction, Terms and Condition apply',
    //           ),
    //           Offer(
    //             offerType: OfferType.NoCostEMIOffer,
    //             discount: 5.0,
    //             title: 'No Cost EMI on Flipkart Axis Bank Credit Card',
    //           ),
    //         ],
    //         description:
    //             'The Wireled Earphones will enhance the way you listen to music, with its convenient features. This pair of earphones supports quality. Oh, and it offers a playback time of up to 17 hours when it is fully charged.',
    //         features: {
    //           "Brand": "RedCherry",
    //           "Model": "E101B",
    //           "Color": "Pure White",
    //           "Headphone Type": "In The Ear",
    //           "Inline Remote": "Yes",
    //           "Sales Package": "Wireless Earphone, User Guide, Membership Card",
    //           "Sweat Proof": "Yes",
    //           "Deep Bass": "Yes",
    //           "With Microphone": "Yes",
    //           "Domestic Warranty": "1 Year"
    //         },
    //         imageUrl: [
    //           'https://cdn.pixabay.com/photo/2014/04/05/11/41/earphone-316753__340.jpg',
    //           'https://cdn.pixabay.com/photo/2017/12/26/22/06/flower-3041518__340.jpg'
    //         ],
    //         numberInStock: 10,
    //         price: 499,
    //         discount: 7.5,
    //         tags: ['earphones', 'headset', 'white'],
    //       ),
    //       qty: 3,
    //     ),
    //     CartItem(
    //       qty: 1,
    //       product: Product(
    //         id: '607d861022958819cc9b8278',
    //         title: 'Solid Men Henley Neck Red T-Shirt',
    //         rating: 4.5,
    //         brand: Brand(
    //           id: '607d7b7be9489b13d02f66fd',
    //           name: 'Red Cherry',
    //           imageUrl:
    //               'https://www.iconsdb.com/icons/preview/red/cherry-xxl.png',
    //         ),
    //         category: Category(
    //           id: '607d4ffc5cc5682098258ab6',
    //           name: 'Fashion',
    //           imageUrl:
    //               'https://cdn4.iconfinder.com/data/icons/geometrica-1/48/crutch-coat-hanger-dress-512.png',
    //         ),
    //         description: '',
    //         offers: [
    //           Offer(
    //             offerType: OfferType.BankOffer,
    //             discount: 10.0,
    //             title:
    //                 '10% off on HDFC Bank Credit Card and Credit/Debit EMI Transactions',
    //           ),
    //           Offer(
    //             offerType: OfferType.BankOffer,
    //             discount: 5.0,
    //             title:
    //                 '5% Unlimited Cashback on Flipkart Axis Bank Credit Card',
    //           ),
    //           Offer(
    //             offerType: OfferType.BankOffer,
    //             discount: 10.0,
    //             title:
    //                 '10% Off on Bank of Baroda Mastercard debit card first time transaction, Terms and Condition apply',
    //           ),
    //           Offer(
    //             offerType: OfferType.NoCostEMIOffer,
    //             discount: 5.0,
    //             title: 'No Cost EMI on Flipkart Axis Bank Credit Card',
    //           ),
    //           Offer(
    //             offerType: OfferType.PartnerOffer,
    //             discount: 28.0,
    //             title:
    //                 'GST Invoice Available! Save up to 28% for business purchases',
    //           ),
    //         ],
    //         features: {
    //           "Type": "Henley Neck",
    //           "Sleeve": "Full Sleeve",
    //           "Fabric": "Cotton Blend"
    //         },
    //         imageUrl: [
    //           'https://cdn.pixabay.com/photo/2013/07/13/14/08/apparel-162192__340.png',
    //           'https://cdn.pixabay.com/photo/2016/08/15/19/57/red-devils-1596355__340.jpg'
    //         ],
    //         numberInStock: 2,
    //         price: 1399,
    //         discount: 21.5,
    //         tags: ['tshirt', 'shirt', 'men', 'clothing', 'red'],
    //       ),
    //     ),
    //   ],
    //   amount: 2481,
    //   dateTime: DateTime.now(),
    //   id: DateTime.now().toString(),
    // ),
    // Order(
    //   products: [
    //     CartItem(
    //       product: Product(
    //         id: '607d84d25d6eb303c4b3e617',
    //         title: 'White Earphones',
    //         rating: 1.5,
    //         brand: Brand(
    //           id: '607d4ffc5cc5682098258ab6',
    //           name: 'White Fish',
    //           imageUrl:
    //               'https://www.iconsdb.com/icons/preview/white/fish-8-xxl.png',
    //         ),
    //         category: Category(
    //           id: '607d4ffc5cc5682098258ab4',
    //           name: 'Electronics',
    //           imageUrl:
    //               'https://www.iconsdb.com/icons/preview/black/electronics-xxl.png',
    //         ),
    //         offers: [
    //           Offer(
    //             offerType: OfferType.BankOffer,
    //             discount: 10.0,
    //             title:
    //                 '10% off on HDFC Bank Credit Card and Credit/Debit EMI Transactions',
    //           ),
    //           Offer(
    //             offerType: OfferType.BankOffer,
    //             discount: 5.0,
    //             title:
    //                 '5% Unlimited Cashback on Flipkart Axis Bank Credit Card',
    //           ),
    //           Offer(
    //             offerType: OfferType.BankOffer,
    //             discount: 10.0,
    //             title:
    //                 '10% Off on Bank of Baroda Mastercard debit card first time transaction, Terms and Condition apply',
    //           ),
    //           Offer(
    //             offerType: OfferType.NoCostEMIOffer,
    //             discount: 5.0,
    //             title: 'No Cost EMI on Flipkart Axis Bank Credit Card',
    //           ),
    //         ],
    //         description:
    //             'The Wireled Earphones will enhance the way you listen to music, with its convenient features. This pair of earphones supports quality. Oh, and it offers a playback time of up to 17 hours when it is fully charged.',
    //         features: {
    //           "Brand": "RedCherry",
    //           "Model": "E101B",
    //           "Color": "Pure White",
    //           "Headphone Type": "In The Ear",
    //           "Inline Remote": "Yes",
    //           "Sales Package": "Wireless Earphone, User Guide, Membership Card",
    //           "Sweat Proof": "Yes",
    //           "Deep Bass": "Yes",
    //           "With Microphone": "Yes",
    //           "Domestic Warranty": "1 Year"
    //         },
    //         imageUrl: [
    //           'https://cdn.pixabay.com/photo/2014/04/05/11/41/earphone-316753__340.jpg',
    //           'https://cdn.pixabay.com/photo/2017/12/26/22/06/flower-3041518__340.jpg'
    //         ],
    //         numberInStock: 10,
    //         price: 499,
    //         discount: 7.5,
    //         tags: ['earphones', 'headset', 'white'],
    //       ),
    //       qty: 3,
    //     ),
    //     CartItem(
    //       qty: 1,
    //       product: Product(
    //         id: '607d861022958819cc9b8278',
    //         title: 'Solid Men Henley Neck Red T-Shirt',
    //         rating: 4.5,
    //         brand: Brand(
    //           id: '607d7b7be9489b13d02f66fd',
    //           name: 'Red Cherry',
    //           imageUrl:
    //               'https://www.iconsdb.com/icons/preview/red/cherry-xxl.png',
    //         ),
    //         category: Category(
    //           id: '607d4ffc5cc5682098258ab6',
    //           name: 'Fashion',
    //           imageUrl:
    //               'https://cdn4.iconfinder.com/data/icons/geometrica-1/48/crutch-coat-hanger-dress-512.png',
    //         ),
    //         description: '',
    //         offers: [
    //           Offer(
    //             offerType: OfferType.BankOffer,
    //             discount: 10.0,
    //             title:
    //                 '10% off on HDFC Bank Credit Card and Credit/Debit EMI Transactions',
    //           ),
    //           Offer(
    //             offerType: OfferType.BankOffer,
    //             discount: 5.0,
    //             title:
    //                 '5% Unlimited Cashback on Flipkart Axis Bank Credit Card',
    //           ),
    //           Offer(
    //             offerType: OfferType.BankOffer,
    //             discount: 10.0,
    //             title:
    //                 '10% Off on Bank of Baroda Mastercard debit card first time transaction, Terms and Condition apply',
    //           ),
    //           Offer(
    //             offerType: OfferType.NoCostEMIOffer,
    //             discount: 5.0,
    //             title: 'No Cost EMI on Flipkart Axis Bank Credit Card',
    //           ),
    //           Offer(
    //             offerType: OfferType.PartnerOffer,
    //             discount: 28.0,
    //             title:
    //                 'GST Invoice Available! Save up to 28% for business purchases',
    //           ),
    //         ],
    //         features: {
    //           "Type": "Henley Neck",
    //           "Sleeve": "Full Sleeve",
    //           "Fabric": "Cotton Blend"
    //         },
    //         imageUrl: [
    //           'https://cdn.pixabay.com/photo/2013/07/13/14/08/apparel-162192__340.png',
    //           'https://cdn.pixabay.com/photo/2016/08/15/19/57/red-devils-1596355__340.jpg'
    //         ],
    //         numberInStock: 2,
    //         price: 1399,
    //         discount: 21.5,
    //         tags: ['tshirt', 'shirt', 'men', 'clothing', 'red'],
    //       ),
    //     ),
    //   ],
    //   amount: 2481,
    //   dateTime: DateTime.now(),
    //   id: DateTime.now().toString(),
    // ),
  ];

  List<Order> get orders {
    return [..._orders];
  }

  Future<void> addOrder(List<CartItem> products, double amount) async {
    _orders.insert(
      0,
      Order(
        products: products,
        amount: amount,
        dateTime: DateTime.now(),
        id: DateTime.now().toIso8601String(),
      ),
    );

    notifyListeners();
  }
}
