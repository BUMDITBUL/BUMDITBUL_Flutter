import 'package:bumditbul_flutter/const/bumditbul_colors.dart';
import 'package:bumditbul_flutter/const/bumditbul_text_style.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class MainScreenBanner extends StatefulWidget {
  const MainScreenBanner({super.key});

  @override
  State<MainScreenBanner> createState() => _MainScreenBannerState();
}

class _MainScreenBannerState extends State<MainScreenBanner> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  Timer? _timer;
  int _currentPage = 0;
  final List<List<TextSpan>> banners = [
    [
      TextSpan(
          text: "시험기간 일정을\n누구보다 ",
          style:
              BumditbulTextStyle.BannerTxtWhite(color: BumditbulColors.white)),
      TextSpan(
          text: "빠르고, 효율적!",
          style: BumditbulTextStyle.BannerTextGreen(
              color: BumditbulColors.green400)),
      TextSpan(
          text: "으로!",
          style:
              BumditbulTextStyle.BannerTxtWhite(color: BumditbulColors.white)),
    ],
    [
      TextSpan(
          text: "내가 하지 않아도\n정리해주는",
          style:
              BumditbulTextStyle.BannerTxtWhite(color: BumditbulColors.white)),
      TextSpan(
          text: "공부 범위",
          style: BumditbulTextStyle.BannerTextGreen(
              color: BumditbulColors.green400)),
      TextSpan(
          text: "와",
          style:
              BumditbulTextStyle.BannerTxtWhite(color: BumditbulColors.white)),
      TextSpan(
          text: " 일정",
          style: BumditbulTextStyle.BannerTextGreen(
              color: BumditbulColors.green400)),
      TextSpan(
          text: "!",
          style:
              BumditbulTextStyle.BannerTxtWhite(color: BumditbulColors.white)),
    ],
    [
      TextSpan(
          text: "중요한 과목은 ",
          style:
              BumditbulTextStyle.BannerTxtWhite(color: BumditbulColors.white)),
      TextSpan(
          text: "늘리고",
          style: BumditbulTextStyle.BannerTextGreen(
              color: BumditbulColors.green400)),
      TextSpan(
          text: "\n자신 있는 과목은 ",
          style:
              BumditbulTextStyle.BannerTxtWhite(color: BumditbulColors.white)),
      TextSpan(
          text: "줄이고",
          style: BumditbulTextStyle.BannerTextGreen(
              color: BumditbulColors.green400)),
      TextSpan(
          text: "!",
          style:
              BumditbulTextStyle.BannerTxtWhite(color: BumditbulColors.white)),
    ],
    [
      TextSpan(
          text: "체크를 통해\n현재 ",
          style:
              BumditbulTextStyle.BannerTxtWhite(color: BumditbulColors.white)),
      TextSpan(
          text: "진행 상태 ",
          style: BumditbulTextStyle.BannerTextGreen(
              color: BumditbulColors.green400)),
      TextSpan(
          text: "확인!",
          style:
              BumditbulTextStyle.BannerTxtWhite(color: BumditbulColors.white)),
    ],
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _stopAutoScroll();
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentPage < banners.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  void _stopAutoScroll() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _stopAutoScroll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: GestureDetector(
            onTapDown: (_) => _stopAutoScroll(),
            onTapUp: (_) => _startAutoScroll(),
            child: PageView.builder(
              controller: _pageController,
              itemCount: banners.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
                _startAutoScroll();
              },
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: BumditbulColors.black900,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          children: banners[index],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
