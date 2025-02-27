import 'package:bumditbul_flutter/widget/banner_text.dart';
import 'package:bumditbul_flutter/const/bumditbul_colors.dart';
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

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _stopAutoScroll();
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentPage < BannerText.banners.length - 1) {
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
              itemCount: BannerText.banners.length,
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
                          children: BannerText.banners[index],
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
