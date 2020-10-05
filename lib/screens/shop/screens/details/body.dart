import 'package:socialcoupons/screens/shop/models/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'AddToCart.dart';
import 'CartCounter.dart';
import 'ColorAndSize.dart';
import 'CounterWithFavButton.dart';
import 'ProductTitleWithImage.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top : size.height*0.3),
                  padding: EdgeInsets.only(top: size.height*0.12, left: 20,right: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)
                    )
                  ),
                  child: Column(
                    children: <Widget>[
                      ColorAndSize(product: product),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical:20),
                        child: Text(
                          product.description,
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      SizedBox(height: 20,),
                      CounterWithFavButton(),
                      SizedBox(height: 20,),
                      AddToCart(product: product),
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product),
              ],
            ),
          )
        ],
      ),
    );
  }
}


