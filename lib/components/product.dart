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
      'name': 'Red dress',
      'picture': 'assets/images/products/dress1.jpeg',
      'oldPrice': 100,
      'price': 60,
    },
    {
      'name': 'Pants',
      'picture': 'assets/images/products/pants1.jpg',
      'oldPrice': 120,
      'price': 95,
    },
    {
      'name': 'Casuals',
      'picture': 'assets/images/products/pants2.jpeg',
      'oldPrice': 120,
      'price': 95,
    },
    {
      'name': 'Blazer',
      'picture': 'assets/images/products/blazer2.jpeg',
      'oldPrice': 120,
      'price': 95,
    },
    {
      'name': 'Black dress',
      'picture': 'assets/images/products/dress2.jpeg',
      'oldPrice': 120,
      'price': 95,
    },
    {
      'name': 'Hills',
      'picture': 'assets/images/products/hills1.jpeg',
      'oldPrice': 120,
      'price': 95,
    },
    {
      'name': 'Hills',
      'picture': 'assets/images/products/hills2.jpeg',
      'oldPrice': 120,
      'price': 95,
    },
    {
      'name': 'Shoes',
      'picture': 'assets/images/products/shoe1.jpg',
      'oldPrice': 120,
      'price': 95,
    },
    {
      'name': 'Skirts',
      'picture': 'assets/images/products/skt1.jpeg',
      'oldPrice': 120,
      'price': 95,
    },
    {
      'name': 'Skirts',
      'picture': 'assets/images/products/skt2.jpeg',
      'oldPrice': 120,
      'price': 95,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productList.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return SingleProduct(
          productName: productList[index]['name'],
          productPicture: productList[index]['picture'],
          productOldPrice: productList[index]['oldPrice'],
          productPrice: productList[index]['price'],
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
        tag: productName,
        child: Material(
          child: InkWell(
            onTap: () {},
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    productName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  title: Text(
                    '\$$productPrice',
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  subtitle: Text(
                    '\$$productOldPrice',
                    style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w800,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
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
