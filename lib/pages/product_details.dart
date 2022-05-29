import 'package:fashion_shop/components/product.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final productDetailsName;
  // ignore: prefer_typing_uninitialized_variables
  final productDetailsPrice;
  // ignore: prefer_typing_uninitialized_variables
  final productDetailsOldPrice;
  // ignore: prefer_typing_uninitialized_variables
  final productDetailsPicture;

  const ProductDetails({
    super.key,
    required this.productDetailsName,
    required this.productDetailsPrice,
    required this.productDetailsOldPrice,
    required this.productDetailsPicture,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.lightGreen,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
            )),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(85, 0, 0, 0),
          child: InkWell(
            onTap: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/app/', (route) => false);
            },
            child: const Text('Grande'),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 300.0,
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    widget.productDetailsName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  title: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "\$${widget.productDetailsOldPrice}",
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "\$${widget.productDetailsPrice}",
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              child: Container(
                color: Colors.white70,
                child: Image.asset(widget.productDetailsPicture),
              ),
            ),
          ),
//       =============== the first buttons ==================
          Row(
            children: [
//       ============= the size button ===================
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                            'Size',
                          ),
                          content: const Text(
                            'Choose the size',
                          ),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'close',
                                style: (TextStyle(color: Colors.lightGreen)),
                              ),
                            )
                          ],
                        );
                      },
                    );
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text('Size'),
                      ),
                      Expanded(
                        child: Icon(
                          Icons.arrow_drop_down,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //       ============= the color button ===================
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                            'Color',
                          ),
                          content: const Text(
                            'Choose a color',
                          ),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'close',
                                style: (TextStyle(color: Colors.lightGreen)),
                              ),
                            )
                          ],
                        );
                      },
                    );
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text('Color'),
                      ),
                      Expanded(
                        child: Icon(
                          Icons.arrow_drop_down,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //       ============= the qty button ===================
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                            'Quantity',
                          ),
                          content: const Text(
                            'Choose the quantity',
                          ),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'close',
                                style: (TextStyle(color: Colors.lightGreen)),
                              ),
                            )
                          ],
                        );
                      },
                    );
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text('Qty'),
                      ),
                      Expanded(
                        child: Icon(
                          Icons.arrow_drop_down,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          //       =============== the second buttons ==================
          Row(
            children: [
//       ============= the buy now button ===================
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.lightGreen,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: const Text('Buy now'),
                ),
              ),

              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border,
                  color: Colors.lightGreen,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add_shopping_cart,
                  color: Colors.lightGreen,
                ),
              ),
            ],
          ),
          const Divider(),

          const ListTile(
            title: Text('Product Details'),
            subtitle: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
            ),
          ),

          const Divider(),

          Row(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text(
                  'Product name:',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(widget.productDetailsName),
              )
            ],
          ),

          Row(
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text(
                  'Product brand:',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text('Brand X'),
              ),
            ],
          ),

          Row(
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text(
                  'Product condition:',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text('NEW'),
              )
            ],
          ),
          //     =====================SIMILAR PRODUCTS==========================
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Similar products'),
          ),
          Container(
            height: 300,
            child: const SimilarProducts(),
          )
        ],
      ),
    );
  }
}

class SimilarProducts extends StatefulWidget {
  const SimilarProducts({Key? key}) : super(key: key);

  @override
  State<SimilarProducts> createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
  var productList = [
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
        return SimilarSingleProduct(
          productName: productList[index]['name'],
          productPicture: productList[index]['picture'],
          productOldPrice: productList[index]['oldPrice'],
          productPrice: productList[index]['price'],
        );
      },
    );
  }
}

class SimilarSingleProduct extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final productName;
  // ignore: prefer_typing_uninitialized_variables
  final productPicture;
  // ignore: prefer_typing_uninitialized_variables
  final productOldPrice;
  // ignore: prefer_typing_uninitialized_variables
  final productPrice;

  const SimilarSingleProduct({
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
