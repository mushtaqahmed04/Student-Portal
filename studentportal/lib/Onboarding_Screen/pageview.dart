import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:studentportal/Authentication/panel.dart';
import 'package:studentportal/UI_Helper/Colors.dart';
import 'package:studentportal/UI_Helper/widget.dart';

class Pageviewscreen extends StatefulWidget {
  const Pageviewscreen({super.key});

  @override
  State<Pageviewscreen> createState() => _PageviewscreenState();
}

class _PageviewscreenState extends State<Pageviewscreen> {
  double height = 40;
  double width = 50;
  Color? color = colors.secondary;
  int _currentIndex = 0;
  List Pages = [
    custom.Images(img: "Onboarding 1"),
    custom.Images(img: "Onboarding 3"),
    custom.Images(img: "Onboarding 2"),
  ];
  final controller = PageController();
  void _changesize() {
    setState(() {
      height = 40.toDouble();
      width = 100.toDouble();
      color = colors.pirmary;
    });
  }

  void _changeback() {
    setState(() {
      height = 40.toDouble();
      width = 50.toDouble();
      color = colors.secondary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: PageView.builder(
              controller: controller,
              itemCount: Pages.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) => Pages[index],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(35),
              child: SmoothPageIndicator(
                controller: controller,
                count: Pages.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 12,
                  dotWidth: 12,
                  dotColor: colors.pirmary,
                  activeDotColor: colors.secondary,
                  spacing: 12,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: InkWell(
                onTap: () {
                  _currentIndex == Pages.length - 1
                      ? Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          // isIos: true,
                          duration: Duration(milliseconds: 2000),
                          child: Panel(),
                        ),
                      )
                      : controller.nextPage(
                        duration: Duration(seconds: 1),
                        curve: Curves.easeIn,
                      );
                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 2),
                  curve: Curves.fastOutSlowIn,
                  width:
                      _currentIndex == Pages.length - 1
                          ? width = 80
                          : width = 50,
                  height:
                      _currentIndex == Pages.length - 1
                          ? height = 40
                          : width = 40,
                  decoration: BoxDecoration(
                    color:
                        _currentIndex == Pages.length - 1
                            ? color = colors.pirmary
                            : colors.secondary,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child:
                      _currentIndex == Pages.length - 1
                          ? Center(
                            child: Text(
                              "Start",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          )
                          : Center(
                            child: Icon(
                              Icons.arrow_forward,
                              color: colors.pirmary,
                            ),
                          ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
