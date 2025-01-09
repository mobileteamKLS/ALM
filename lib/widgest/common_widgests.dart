import 'package:alm/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../core/dimensions.dart';
import '../theme/app_theme.dart';
import '../utils/media_query.dart';

class RoundedGradientButton extends StatelessWidget {
  final bool isborderButton;
  final String text;
  final VoidCallback press;
  final Color color;
  final Color? textColor;
  final double horizontalPadding;
  final double verticalPadding;
  final double cornerRadius;
  final double textSize;

  const RoundedGradientButton({
    Key? key,
    required this.text,
    required this.press,
    this.color=AppColors.primary,
    this.textColor=AppColors.white,
    this.horizontalPadding = 20,
    this.verticalPadding = 12,
    this.cornerRadius = 10,
    this.textSize = 16,
    this.isborderButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
        decoration: BoxDecoration(
          color: isborderButton ? Colors.transparent : color,
          borderRadius: BorderRadius.circular(cornerRadius),
          border: isborderButton ? Border.all(color: color, width: 2) : null,
          gradient: !isborderButton
              ? const LinearGradient(
            colors: [AppColors.primary, AppColors.secondary],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          )
              : null,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: textSize,
            ),
          ),
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String numValue;
  final String unit;
  final IconData icon;
  final String desc;
  final Color color;
  const DashboardCard({
    super.key, required this.numValue, required this.unit, required this.icon, required this.desc, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenDimension.onePercentOfScreenWidth*47,
      padding: EdgeInsets.all(ScreenDimension.onePercentOfScreenHight*defaultContainerPadding),
      decoration:  BoxDecoration(
        color:AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0.5,
            blurRadius: 4,
            offset: const Offset(
                0, 1), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(ScreenDimension.onePercentOfScreenWidth*defaultContainerBorderRadiusCurve)),
      ),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start                        ,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "$numValue",
                          style:  TextStyle(
                            fontSize:ScreenDimension.textSize * headingText2,
                            color: AppColors.textColorPrimary,
                            fontWeight: FontWeight.w800,
                          ),

                        ),
                        TextSpan(
                          text: "$unit",
                          style: TextStyle(
                            fontSize: ScreenDimension.textSize *bodyTextMedium,
                            color: AppColors.textColorPrimary,
                            fontWeight: FontWeight.w500,
                          ),

                        ),


                      ],
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: ScreenDimension.onePercentOfScreenHight*0.5),
                    height: 2,
                    width: 32,
                    color: AppColors.lightBlue,
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                ),

                child:Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    icon,
                    color: AppColors.textColorPrimary,

                  ),
                ),
              )
            ],),
          Text(
              "$desc",
              style: AppStyle.sideDescText),
        ],
      ),
    );
  }
}