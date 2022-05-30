import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  const CartProducts({Key? key}) : super(key: key);

  @override
  State<CartProducts> createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var productsOnTheCart = [
    {
      'name': 'Blazer',
      'picture': 'assets/images/products/blazer1.jpeg',
      'price': 95,
      'size': 'M',
      'color': 'Black',
      'quantity': 1,
    },
    {
      'name': 'Hills',
      'picture': 'assets/images/products/hills1.jpeg',
      'price': 105,
      'size': '7',
      'color': 'Green',
      'quantity': 1,
    },
    {
      'name': 'Hills',
      'picture': 'assets/images/products/hills1.jpeg',
      'price': 105,
      'size': '7',
      'color': 'Green',
      'quantity': 1,
    },
    {
      'name': 'Hills',
      'picture': 'assets/images/products/hills1.jpeg',
      'price': 105,
      'size': '7',
      'color': 'Green',
      'quantity': 1,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productsOnTheCart.length,
      itemBuilder: ((context, index) {
        return SingleCartProduct(
          cartProductName: productsOnTheCart[index]['name'],
          cartProductPicture: productsOnTheCart[index]['picture'],
          cartProductPrice: productsOnTheCart[index]['price'],
          cartProductColor: productsOnTheCart[index]['color'],
          cartProductSize: productsOnTheCart[index]['size'],
          cartProductQuantity: productsOnTheCart[index]['quantity'],
        );
      }),
    );
  }
}

class SingleCartProduct extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final cartProductName;
  // ignore: prefer_typing_uninitialized_variables
  final cartProductPicture;
  // ignore: prefer_typing_uninitialized_variables
  final cartProductPrice;
  // ignore: prefer_typing_uninitialized_variables
  final cartProductColor;
  // ignore: prefer_typing_uninitialized_variables
  final cartProductSize;
  // ignore: prefer_typing_uninitialized_variables
  final cartProductQuantity;

  const SingleCartProduct({
    super.key,
    required this.cartProductName,
    required this.cartProductPicture,
    required this.cartProductPrice,
    required this.cartProductColor,
    required this.cartProductSize,
    required this.cartProductQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
// =================this section is for the image========================
        leading: Image.asset(
          cartProductPicture,
        ),
//=================this section is for the product name=================
        title: Text(cartProductName),
        subtitle: Column(
          children: [
            Row(
              children: [
// ==============this section is for the size of the product==================
                const Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Text('Size:'),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    cartProductSize,
                    style: const TextStyle(
                      color: Colors.lightGreen,
                    ),
                  ),
                ),
// =================This section is for the color of the product==============
                const Padding(
                  padding: EdgeInsets.fromLTRB(15, 8, 8, 8),
                  child: Text('Color:'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    cartProductColor,
                    style: const TextStyle(
                      color: Colors.lightGreen,
                    ),
                  ),
                ),
              ],
            ),
// ======================This section is for the product price==========
            Container(
                alignment: Alignment.topLeft,
                child: Text(
                  '\$$cartProductPrice',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ))
          ],
        ),
        trailing: Column(
          children: [
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_drop_up),
              ),
            ),
            Text('$cartProductQuantity'),
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_drop_down),
              ),
            )
          ],
        ),
      ),
    );
  }
}
