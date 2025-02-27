import 'package:bumditbul_flutter/const/bumditbul_colors.dart';
import 'package:bumditbul_flutter/const/bumditbul_text_style.dart';
import 'package:flutter/material.dart';

class BannerText {
  static final List<List<TextSpan>> banners = [
    [
      TextSpan(
          text: "시험기간 일정을\n누구보다 ",
          style:
          BumditbulTextStyle.BannerTxtWhite(color: BumditbulColors.white)),
      TextSpan(
          text: "빠르고, 효율적!",
          style: BumditbulTextStyle.BannerTxtGreen(
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
          style: BumditbulTextStyle.BannerTxtGreen(
              color: BumditbulColors.green400)),
      TextSpan(
          text: "와",
          style:
          BumditbulTextStyle.BannerTxtWhite(color: BumditbulColors.white)),
      TextSpan(
          text: " 일정",
          style: BumditbulTextStyle.BannerTxtGreen(
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
          style: BumditbulTextStyle.BannerTxtGreen(
              color: BumditbulColors.green400)),
      TextSpan(
          text: "\n자신 있는 과목은 ",
          style:
          BumditbulTextStyle.BannerTxtWhite(color: BumditbulColors.white)),
      TextSpan(
          text: "줄이고",
          style: BumditbulTextStyle.BannerTxtGreen(
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
          style: BumditbulTextStyle.BannerTxtGreen(
              color: BumditbulColors.green400)),
      TextSpan(
          text: "확인!",
          style:
          BumditbulTextStyle.BannerTxtWhite(color: BumditbulColors.white)),
    ],
  ];
}