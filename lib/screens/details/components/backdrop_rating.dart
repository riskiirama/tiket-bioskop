import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hykii/models/movie.dart';

import '../../../constants.dart';

class BackdropAndRating extends StatelessWidget {
  const BackdropAndRating({
    Key key,
    @required this.size,
    @required this.movie,
  }) : super(key: key);

  final Size size;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // 40% of our total height
        height: size.height * 0.4,
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Container(
              height: size.height * 0.4 - 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(movie.backdrop),
                ),
              ),
            ),
            // Rating Box
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                // it will cover 90% of our total width
                width: size.width * 0.9,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    topLeft: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 50,
                      color: Color(0xff12153D).withOpacity(0.2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.asset("assets/icons/start_fill.svg"),
                        SizedBox(
                          height: kDefaultPadding / 4,
                        ),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: "${movie.rating}/",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              TextSpan(text: "10\n"),
                              TextSpan(
                                text: "(150.212)",
                                style:
                                    TextStyle(color: kTextColor, fontSize: 10),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    // Rate this
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.asset("assets/icons/star.svg"),
                        SizedBox(
                          height: kDefaultPadding / 4,
                        ),
                        Text(
                          "Rate this",
                          style: Theme.of(context).textTheme.bodyText2,
                        )
                      ],
                    ),
                    // MetaScore
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Color(0xff51CF66),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Text(
                            "${movie.metascoreRating}",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: kDefaultPadding / 4,
                        ),
                        Text(
                          "Metascore",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "62 critic reviews",
                          style: TextStyle(color: kTextLightColor),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            // Back Button
            SafeArea(
                child: BackButton(
              color: Colors.white,
            )),
          ],
        ),
      ),
    );
  }
}
