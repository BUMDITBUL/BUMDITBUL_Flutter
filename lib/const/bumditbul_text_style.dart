import 'package:flutter/material.dart';
import 'package:bumditbul_flutter/const/bumditbul_colors.dart';

class BumditbulTextStyle{
  static TextStyle JoinLogin({required Color color}){
    return TextStyle(
      color: BumditbulColors.white,
      fontSize: 15,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
    );
  }
  static TextStyle HintTxt({required Color color}){
    return TextStyle(
      color: BumditbulColors.black300,
      fontSize: 12,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      overflow: TextOverflow.ellipsis,
    );
  }
  static TextStyle ErrorMsg({required Color color}){
    return TextStyle(
      color: BumditbulColors.green400,
      fontSize: 8,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      overflow: TextOverflow.ellipsis,
    );
  }
  static TextStyle BarLogo({required Color color}){
    return TextStyle(
      color: BumditbulColors.green400,
      fontSize: 12,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
    );
  }
  static TextStyle BannerTxtWhite({required Color color}){
    return TextStyle(
      color: BumditbulColors.white,
      fontSize: 16,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
      overflow: TextOverflow.ellipsis,
    );
  }
  static TextStyle BannerTxtGreen({required Color color}){
    return TextStyle(
      color: BumditbulColors.green400,
      fontSize: 16,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
      overflow: TextOverflow.ellipsis,
    );
  }
  static TextStyle MainDate({required Color color}){
    return TextStyle(
      color: BumditbulColors.white,
      fontSize: 15,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
    );
  }
  static TextStyle TaskName({required Color color}){
    return TextStyle(
      color: BumditbulColors.white,
      fontSize: 13,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
    );
  }
  static TextStyle TaskTime({required Color color}){
    return TextStyle(
      color: BumditbulColors.white,
      fontSize: 8,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
    );
  }
  static TextStyle TaskRange({required Color color}){
    return TextStyle(
      color: BumditbulColors.white,
      fontSize: 10,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
    );
  }
}