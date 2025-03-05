import 'package:alm/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../core/dimensions.dart';
import '../core/img_assets.dart';
import '../screens/service_provider/flight_capacity_details.dart';
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
    this.color = AppColors.primary,
    this.textColor = AppColors.white,
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
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding, vertical: verticalPadding),
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
    super.key,
    required this.numValue,
    required this.unit,
    required this.icon,
    required this.desc,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenDimension.onePercentOfScreenWidth * 47,
      padding: EdgeInsets.all(ScreenDimension.onePercentOfScreenHight *
          AppDimensions.defaultContainerPadding),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0.5,
            blurRadius: 4,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(
            ScreenDimension.onePercentOfScreenWidth *
                AppDimensions.defaultContainerBorderRadiusCurve)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          style: TextStyle(
                            fontSize: ScreenDimension.textSize *
                                AppDimensions.headingText3,
                            color: AppColors.textColorPrimary,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        TextSpan(
                          text: "$unit",
                          style: TextStyle(
                            fontSize: ScreenDimension.textSize *
                                AppDimensions.bodyTextMedium,
                            color: AppColors.textColorPrimary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical:
                            ScreenDimension.onePercentOfScreenHight * 0.5),
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
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    icon,
                    color: AppColors.textColorPrimary,
                  ),
                ),
              )
            ],
          ),
          Text("$desc", style: AppStyle.sideDescText),
        ],
      ),
    );
  }
}

class FlightCapacityListItem extends StatelessWidget {
  final String origin;
  final String destination;
  final int capacity;
  final String time;
  final String flightNo;

  const FlightCapacityListItem({
    super.key,
    required this.origin,
    required this.destination,
    required this.capacity,
    required this.time,
    required this.flightNo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ScreenDimension.onePercentOfScreenHight *
          AppDimensions.defaultContainerPadding),
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0.5,
            blurRadius: 4,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(
            ScreenDimension.onePercentOfScreenWidth *
                AppDimensions.defaultContainerBorderRadiusCurve)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    origin,
                    style: TextStyle(
                      fontSize: ScreenDimension.textSize *
                          AppDimensions.bodyTextLarge,
                      color: AppColors.textColorPrimary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: SvgPicture.asset(
                      plane,
                      height: ScreenDimension.onePercentOfScreenHight * AppDimensions.cardIconsSize2,
                    ),
                  ),
                  Text(
                    destination,
                    style: TextStyle(
                      fontSize: ScreenDimension.textSize *
                          AppDimensions.bodyTextLarge,
                      color: AppColors.textColorPrimary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              SizedBox(height: ScreenDimension.onePercentOfScreenHight*0.5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SvgPicture.asset(
                      clock,
                      height: ScreenDimension.onePercentOfScreenHight * AppDimensions.cardIconsSize2,
                    ),
                  ),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: ScreenDimension.textSize *
                          AppDimensions.bodyTextSmall,
                      color: AppColors.textColorSecondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "",
                style: TextStyle(
                  fontSize:
                      ScreenDimension.textSize * AppDimensions.bodyTextSmall,
                  color: AppColors.textColorSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: ScreenDimension.onePercentOfScreenHight*0.5,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SvgPicture.asset(
                      ticket,
                      height: ScreenDimension.onePercentOfScreenHight * AppDimensions.cardIconsSize2,
                    ),
                  ),
                  Text(
                    flightNo,
                    style: TextStyle(
                      fontSize: ScreenDimension.textSize *
                          AppDimensions.bodyTextSmall,
                      color: AppColors.textColorSecondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.containerBgColor,
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenDimension.onePercentOfScreenWidth * 3),
                child: Text(
                  capacity.toString(),
                  style: TextStyle(
                    fontSize:
                        ScreenDimension.textSize * AppDimensions.bodyTextSmall,
                    color: AppColors.textColorPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: ScreenDimension.onePercentOfScreenHight*0.5,),
              Text(
                "AVAILABLE",
                style: TextStyle(
                  fontSize:
                      ScreenDimension.textSize * AppDimensions.bodyTextSmall,
                  color: AppColors.textColorSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context)=>FlightCapacityDetailsScreen()));
            },
            child: Container(
             width: ScreenDimension.onePercentOfScreenWidth*7,
             height: ScreenDimension.onePercentOfScreenWidth*7,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.gradient1,
              ),
              child: SvgPicture.asset(
                arrowRight,
                height: ScreenDimension.onePercentOfScreenHight * AppDimensions.cardIconsSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
