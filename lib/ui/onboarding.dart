import 'package:e_commerce_app_aast/model/onboarding_data.dart';
import 'package:e_commerce_app_aast/resources/colors.dart';
import 'package:e_commerce_app_aast/resources/images.dart';
import 'package:e_commerce_app_aast/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/style.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final List<OnboardingData> _list = [
    OnboardingData(ImageManager.img1, 'Choose Products',
        'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.'),
    OnboardingData(ImageManager.img2, 'Make Payment',
        'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.'),
    OnboardingData(ImageManager.img3, 'Get Your Order',
        'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.'),
  ];

  final PageController _pageController = PageController();
  int _pageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.bgColor,
      body: SafeArea(
        child: PageView.builder(
            controller: _pageController,
            onPageChanged: (pageIndex) {
              setState(() {
                _pageIndex = pageIndex;
              });
            },
            itemCount: _list.length,
            itemBuilder: (context, index) => _buildPage(index)),
      ),
    );
  }

  Widget _buildPage(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${index + 1}/3', style: TextStyles.defaultStyle),
              TextButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      )),
                  child: Text('Skip', style: TextStyles.defaultStyle))
            ],
          ),
          SizedBox(
            height: 110,
          ),
          SvgPicture.asset(
            _list[index].image,
            height: 250,
          ),
          SizedBox(
            height: 18,
          ),
          Text(_list[index].title, style: TextStyles.titleStyle),
          SizedBox(
            height: 10,
          ),
          Text(
            _list[index].description,
            style: TextStyles.descriptionStyle,
            textAlign: TextAlign.center,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(bottom: 21.0),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      child: TextButton(
                          onPressed: () {
                            _pageController.animateToPage(--_pageIndex,
                                duration: Duration(milliseconds: 400),
                                curve: Curves.easeIn);
                          },
                          child: Text(
                            'Prev',
                            style: TextStyles.prevStyle,
                          )),
                      visible: index != 0,
                    ),
                    SizedBox(
                        height: 20,
                        child: Row(
                          children: List.generate(
                            _list.length,
                            (i) => Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: AnimatedContainer(
                                width: i == index ? 25 : 8,
                                height: 8,
                                decoration: BoxDecoration(
                                    color: i == index
                                        ? ColorManager.blackColor
                                        : ColorManager.greyColorA8,
                                    borderRadius: BorderRadius.circular(5)),
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                              ),
                            ),
                          ),
                        )),
                    TextButton(
                        onPressed: () {
                          if (_pageIndex == _list.length - 1) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Home(),
                                ));
                          } else {
                            _pageController.animateToPage(++_pageIndex,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeIn);
                          }
                        },
                        child: Text(
                          index < 2 ? 'Next' : 'Get Started',
                          style: TextStyles.nextStyle,
                        )),
                  ],
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
