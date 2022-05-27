import 'package:fashion_shop/components/product.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:fashion_shop/components/horizontal_list_view.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget imageCarousel = Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: const [
          AssetImage('assets/images/c1.jpg'),
          AssetImage('assets/images/m1.jpeg'),
          AssetImage('assets/images/m2.jpg'),
          AssetImage('assets/images/w1.jpeg'),
          AssetImage('assets/images/w3.jpeg'),
          AssetImage('assets/images/w4.jpeg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: const Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.lightGreen,
        title: const Text('Grande'),
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
      drawer: Drawer(
        child: ListView(
          children: [
//               header
            UserAccountsDrawerHeader(
              accountName: const Text('Charles Adebola'),
              accountEmail: const Text('charlesadebola@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: const CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                color: Colors.lightGreen,
              ),
            ),
//                body
            InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text('Home Page'),
                leading: Icon(
                  Icons.home,
                ),
              ),
            ),

            InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text('My Account'),
                leading: Icon(
                  Icons.person,
                ),
              ),
            ),

            InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text('My Orders'),
                leading: Icon(
                  Icons.shopping_basket,
                ),
              ),
            ),

            InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text('Categories'),
                leading: Icon(
                  Icons.dashboard,
                ),
              ),
            ),

            InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text('Favorites'),
                leading: Icon(
                  Icons.favorite,
                ),
              ),
            ),

            const Divider(),

            InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text('Settings'),
                leading: Icon(
                  Icons.settings,
                  color: Colors.blue,
                ),
              ),
            ),

            InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text('About'),
                leading: Icon(
                  Icons.help,
                  color: Colors.orange,
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
//         image carousel
          imageCarousel,
//           padding widget
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Categories'),
          ),
//          Horizontal list view
          const HorizontalList(),
//           padding widget
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text('Recent products'),
          ),

//        grid view
          Container(
            height: 320.0,
            child: const Products(),
          )
        ],
      ),
    );
  }
}
