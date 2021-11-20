import 'dart:ui';
import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:painai/models/market_model.dart';
import 'package:painai/screens/selectplace_screen_mark.dart';

class Marketscreen extends StatefulWidget {
  final String title;
  Marketscreen({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Marketscreen();
}

class _Marketscreen extends State<Marketscreen> {
  //final _pagecontroller = PageController(initialPage: 0);//
  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // ListView widget with pageView
        // Recommendation Section

        child: Container(
          height: 350,
          margin: EdgeInsets.only(top: 16),
          child: PageView(
            physics: BouncingScrollPhysics(),
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            children: List.generate(
                markets.length,
                (int index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SelectedPlaceScreen5(
                            marketModel: markets[index],
                          ),
                        ));
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 25, left: 10),
                        width: 350,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.6),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                  markets[index].image)),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              bottom: 19.2,
                              left: 19.2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4.8),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaY: 19.2,
                                    sigmaX: 19.2,
                                  ),
                                  child: Container(
                                    height: 30,
                                    padding:
                                        EdgeInsets.only(left: 10, right: 20),
                                    child: Row(
                                      children: <Widget>[
                                        Image.asset('assets/images/pin.png'),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 5.0, right: 5)),
                                        Text(
                                          markets[index].name,
                                          style: GoogleFonts.lato(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                            fontSize: 16.8,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
          ),
        ),
      ),
    );
  }
}
