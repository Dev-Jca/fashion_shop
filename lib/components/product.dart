import 'package:fashion_shop/pages/product_details.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
    {
      'name': 'Blazer',
      'picture': 'assets/images/products/blazer1.jpeg',
      'oldPrice': 120,
      'price': 95,
    },
    {
      'name': 'Skirts',
      'picture': 'assets/images/products/skt1.jpeg',
      'oldPrice': 80,
      'price': 55,
    },
    {
      'name': 'Red dress',
      'picture': 'assets/images/products/dress1.jpeg',
      'oldPrice': 100,
      'price': 60,
    },
    {
      'name': 'Pants',
      'picture': 'assets/images/products/pants1.jpg',
      'oldPrice': 105,
      'price': 65,
    },
    {
      'name': 'Casuals',
      'picture': 'assets/images/products/pants2.jpeg',
      'oldPrice': 79,
      'price': 69,
    },
    {
      'name': 'Blazer',
      'picture': 'assets/images/products/blazer2.jpeg',
      'oldPrice': 110,
      'price': 85,
    },
    {
      'name': 'Black dress',
      'picture': 'assets/images/products/dress2.jpeg',
      'oldPrice': 110,
      'price': 87,
    },
    {
      'name': 'Hills',
      'picture': 'assets/images/products/hills1.jpeg',
      'oldPrice': 150,
      'price': 105,
    },
    {
      'name': 'Hills',
      'picture': 'assets/images/products/hills2.jpeg',
      'oldPrice': 99,
      'price': 75,
    },
    {
      'name': 'Shoes',
      'picture': 'assets/images/products/shoe1.jpg',
      'oldPrice': 120,
      'price': 89,
    },
    {
      'name': 'Skirts',
      'picture': 'assets/images/products/skt2.jpeg',
      'oldPrice': 109,
      'price': 99,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productList.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: SingleProduct(
            productName: productList[index]['name'],
            productPicture: productList[index]['picture'],
            productOldPrice: productList[index]['oldPrice'],
            productPrice: productList[index]['price'],
          ),
        );
      },
    );
  }
}

class SingleProduct extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final productName;
  // ignore: prefer_typing_uninitialized_variables
  final productPicture;
  // ignore: prefer_typing_uninitialized_variables
  final productOldPrice;
  // ignore: prefer_typing_uninitialized_variables
  final productPrice;

  const SingleProduct({
    super.key,
    required this.productName,
    required this.productPicture,
    required this.productOldPrice,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: const Text('bbb'),
        child: Material(
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductDetails(
                    productDetailsName: productName,
                    productDetailsPrice: productPrice,
                    productDetailsOldPrice: productOldPrice,
                    productDetailsPicture: productPicture,
                  ),
                ),
              );
            },
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        productName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Text(
                        '\$$productOldPrice',
                        style: const TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      '\$$productPrice',
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              child: Image.asset(
                productPicture,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
