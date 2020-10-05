import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialcoupons/components/defaultButton.dart';
import 'package:socialcoupons/constants.dart';
import 'package:socialcoupons/screens/signIn/signIn.dart';
import 'package:socialcoupons/sizeConfig.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Donate",
      "content":"Donate to a cause you like and help make a difference",
      "image": "assets/images/donate.jpg"
    },
    {
      "text":
      "Add event",
      "content":"NGOs can add events and raise money for them",
      "image": "assets/images/event.jpg"
    },
    {
      "text": "Share",
      "content":"Share with your friends and family",
      "image": "assets/images/share.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  text: splashData[index]["text"],
                  content: splashData[index]["content"],
                  image: splashData[index]["image"],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                            (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: "Continue",
                      press: () {
                        Navigator.push(context, new MaterialPageRoute(
                            builder: (context) => new SignInScreen())
                        );
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key, this.text, this.image, this.content,
  }) : super(key: key);
  final String text, image, content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          Spacer(),
          Text(
            text,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(36),
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
//        Text(
//          text,
//          textAlign: TextAlign.center,
//        ),
          Text(
            content,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(20),
              color: kPrimaryColor,

            ),
            textAlign: TextAlign.center,
          ),
          Spacer(flex: 2,),
          Image.asset(
            image,
            height: getProportionateScreenHeight(265),
            width: getProportionateScreenWidth(235),
          )
        ],
      ),
    );
  }
}
