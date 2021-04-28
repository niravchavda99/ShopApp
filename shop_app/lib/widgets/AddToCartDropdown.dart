import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/providers/Cart.dart';
import 'package:shop_app/utils/Utils.dart';

class AddToCartDropdown extends StatefulWidget {
  final Product product;

  AddToCartDropdown({Key key, this.product}) : super(key: key);

  @override
  _AddToCartDropdownState createState() => _AddToCartDropdownState();
}

class _AddToCartDropdownState extends State<AddToCartDropdown> {
  int _selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButton(
            value: _selectedValue,
            items: List<int>.generate(
                    widget.product.numberInStock > 10
                        ? 10
                        : widget.product.numberInStock,
                    (i) => i + 1)
                .map((i) =>
                    DropdownMenuItem(child: Text(i.toString()), value: i))
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedValue = value;
              });
            },
          ),
          ElevatedButton.icon(
            onPressed: () async {
              await Provider.of<Cart>(context, listen: false).addItem(
                productId: widget.product.id,
                price: widget.product.price,
                qty: _selectedValue,
              );

              Utils.showErrorDialog(
                  context, 'Added to Cart', 'Added $_selectedValue item(s).');
            },
            icon: Icon(
              Icons.shopping_cart,
              size: 15,
            ),
            label: Text(
              'Add to Cart',
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
