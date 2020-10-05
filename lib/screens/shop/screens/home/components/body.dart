import 'package:socialcoupons/screens/shop/models/Product.dart';
import 'package:socialcoupons/screens/shop/screens/details/details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'categories.dart';
import 'itemCard.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
          "100% authentic products",
          style: Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.bold),
      ),
        ),
        Categories(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
            itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) => ItemCard(
                product: products[index],
                press: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>
                DetailsScreen(
                  product: products[index],
                ))),
              ),
            ),
          ),
        ),
      ],
    );
  }
}






