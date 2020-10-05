import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../sizeConfig.dart';

class CustomSuffixIcon extends StatelessWidget {
  const CustomSuffixIcon({
    Key key, this.url,
  }) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          0,
          getProportionateScreenWidth(20),
          getProportionateScreenWidth(20),
          getProportionateScreenWidth(20)
      ),
      child: SvgPicture.asset(
        url,
        height: getProportionateScreenHeight(18),),
    );
  }
}
