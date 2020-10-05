import 'package:socialcoupons/screens/shop/models/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:socialcoupons/screens/shop/screens/details/body.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.color,
      appBar: AppBar(
        backgroundColor: product.color,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back),
          onPressed: ()=> Navigator.pop(context),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),
            onPressed: ()=> Navigator.pop(context),
          ),
          IconButton(icon: Icon(Icons.shopping_cart),
            onPressed: ()=> Navigator.pop(context),
          ),
          SizedBox(
            width:10,
          ),
        ],
      ),
      body: Body(product: product),
    );
  }
}
