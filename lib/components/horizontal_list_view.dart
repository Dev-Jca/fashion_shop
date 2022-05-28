import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          Category(
            imageLocation: 'assets/images/cats/formal.png',
            imageCaption: 'formal',
          ),
          Category(
            imageLocation: 'assets/images/cats/dress.png',
            imageCaption: 'dress',
          ),
          Category(
            imageLocation: 'assets/images/cats/informal.png',
            imageCaption: 'informal',
          ),
          Category(
            imageLocation: 'assets/images/cats/accessories.png',
            imageCaption: 'accessories',
          ),
          Category(
            imageLocation: 'assets/images/cats/tshirt.png',
            imageCaption: 't-shirt',
          ),
          Category(
            imageLocation: 'assets/images/cats/jeans.png',
            imageCaption: 'pant',
          ),
          Category(
            imageLocation: 'assets/images/cats/shoe.png',
            imageCaption: 'shoes',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;

  const Category(
      {super.key, required this.imageLocation, required this.imageCaption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(
              imageLocation,
              width: 80.0,
              height: 80.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(
                imageCaption,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
