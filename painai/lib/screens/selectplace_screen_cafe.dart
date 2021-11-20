//import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:painai/models/cafe_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class SelectedPlaceScreen4 extends StatelessWidget {
  final _pageController = PageController();
  final CafeModel cafeModel;

  SelectedPlaceScreen4({Key key, @required this.cafeModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            //PageView
            PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              children: List.generate(
                cafeModel.images.length,
                (int index) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                            cafeModel.images[index])),
                  ),
                ),
              ),
            ),

            // Custom Nevigator
            SafeArea(
              child: Container(
                height: 50,
                margin: EdgeInsets.only(top: 28.8, left: 28.8, right: 28.8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 45,
                        width: 45,
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.6),
                          color: Colors.white70,
                        ),
                        child: SvgPicture.asset('assets/svg/arrow.svg'),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Content
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 346.8,
                margin: EdgeInsets.only(left: 28.8, bottom: 48, right: 28.8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: cafeModel.images.length,
                      effect: ExpandingDotsEffect(
                        activeDotColor: Color(0xffffffff),
                        dotColor: Color(0xffababab),
                        dotHeight: 4.8,
                        dotWidth: 6,
                        spacing: 4.8,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 19.2),
                      child: Text(
                        cafeModel.tagLine,
                        maxLines: 2,
                        style: GoogleFonts.playfairDisplay(
                            fontSize: 42.6,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 19.2),
                      child: Text(
                        cafeModel.description,
                        maxLines: 2,
                        style: GoogleFonts.lato(
                          fontSize: 19.2,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 48,
                    ),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => launch(
                              'https://www.wongnai.com/listings/attractions-in-hatyai'),
                          child: Container(
                            height: 62.4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9.6),
                                color: Colors.white),
                            child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 28.8, right: 28.8),
                                child: Text(
                                  'Explore Now >>',
                                  style: GoogleFonts.lato(
                                    fontSize: 19.2,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
