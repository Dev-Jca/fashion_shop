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
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/homePage/', (route) => false);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            )),
        title: const Text('Product Details'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
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
                  onPressed: () {},
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
                  onPressed: () {},
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
                  onPressed: () {},
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
//       ============= the size button ===================
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
          )
        ],
      ),
    );
  }
}
