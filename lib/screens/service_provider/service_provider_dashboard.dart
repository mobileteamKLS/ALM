import 'package:alm/theme/app_colors.dart';
import 'package:alm/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/dimensions.dart';
import '../../core/img_assets.dart';
import '../../utils/media_query.dart';
import '../../widgest/app_drawer.dart';
import '../../widgest/common_widgests.dart';

class ProviderDashboardScreen extends StatefulWidget {
  const ProviderDashboardScreen({super.key});

  @override
  State<ProviderDashboardScreen> createState() =>
      _ProviderDashboardScreenState();
}

class _ProviderDashboardScreenState extends State<ProviderDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenDimension().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white, size: 32),
        toolbarHeight: 60,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF0057D8),
                Color(0xFF1c86ff),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        actions: [
          SvgPicture.asset(
            userSettings,
            height: 25,
          ),
          const SizedBox(
            width: 10,
          ),
          SvgPicture.asset(
            notificationBell,
            height: 25,
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      drawer: AppDrawer(selectedScreen: "Dashboard"),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(
            vertical: ScreenDimension.onePercentOfScreenHight *
                AppDimensions.defaultPageVerticalPadding,
            horizontal: ScreenDimension.onePercentOfScreenWidth *
                AppDimensions.defaultPageHorizontalPadding),
        decoration: const BoxDecoration(
          color: AppColors.background,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(
                    ScreenDimension.onePercentOfScreenHight *
                        AppDimensions.defaultContainerPadding),
                decoration: BoxDecoration(
                  color: AppColors.lightBlue,
                  borderRadius: BorderRadius.all(Radius.circular(
                      ScreenDimension.onePercentOfScreenWidth *
                          AppDimensions.defaultContainerBorderRadiusCurve)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hello Harsh,",
                        style: TextStyle(
                            color: AppColors.textColorPrimary,
                            letterSpacing: 0.8,
                            fontSize: ScreenDimension.textSize * AppDimensions.titleText2,
                            fontWeight: FontWeight.w700)),
                    Text("Welcome to Anchorage Logistics Marketplace",
                        style: TextStyle(
                            color: AppColors.textColorPrimary,
                            letterSpacing: 0.8,
                            fontSize: ScreenDimension.textSize * AppDimensions.bodyTextMedium,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenDimension.onePercentOfScreenWidth,
                    vertical: ScreenDimension.onePercentOfScreenHight),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("CAPACITY SUMMARY", style: AppStyle.sideDashboardTitleText),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: SvgPicture.asset(
                          filter,
                          height: ScreenDimension.onePercentOfScreenHight *
                              AppDimensions.defaultIconSize,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: ScreenDimension.onePercentOfScreenHight * 0.5),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DashboardCard(
                      numValue: "22.5 ",
                      unit: "MT",
                      icon: Icons.shopping_bag_outlined,
                      color: AppColors.lightBlue,
                      desc: "Total Capacity Booked",
                    ),
                    DashboardCard(
                      numValue: "6.5 ",
                      unit: "MT",
                      icon: Icons.shopping_bag_outlined,
                      color: AppColors.lightRed,
                      desc: "Unutilized Capacity",
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: ScreenDimension.onePercentOfScreenHight * AppDimensions.dashboardCardVerticalPaddingLong,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(
                        ScreenDimension.onePercentOfScreenHight *
                            AppDimensions. defaultContainerPadding),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 0.5,
                          blurRadius: 4,
                          offset:
                              const Offset(0, 1), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(
                          ScreenDimension.onePercentOfScreenWidth *
                              AppDimensions.defaultContainerBorderRadiusCurve)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: ScreenDimension.onePercentOfScreenWidth * 42,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "18 \n",
                                  style: TextStyle(
                                    fontSize: ScreenDimension.textSize * AppDimensions.headingText2,
                                    color: AppColors.textColorPrimary,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                TextSpan(
                                  text: "Offer Sent",
                                  style: AppStyle.sideDescText,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(
                          width: ScreenDimension.onePercentOfScreenWidth * 42,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "22 \n",
                                      style: TextStyle(
                                        fontSize:
                                            ScreenDimension.textSize * AppDimensions.headingText2,
                                        color: AppColors.textColorPrimary,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Loads Booked",
                                      style: AppStyle.sideDescText,
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.start,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.lightGreen,
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Icon(
                                    Icons.airplane_ticket_outlined,
                                    color: AppColors.textColorPrimary,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: ScreenDimension.onePercentOfScreenHight * AppDimensions.dashboardCardVerticalPadding,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(
                        ScreenDimension.onePercentOfScreenHight *
                            AppDimensions.defaultContainerPadding),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 0.5,
                          blurRadius: 4,
                          offset:
                              const Offset(0, 1), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(
                          ScreenDimension.onePercentOfScreenWidth *
                              AppDimensions.defaultContainerBorderRadiusCurve)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "\$ 21.6K \n",
                                style: TextStyle(
                                  fontSize:
                                      ScreenDimension.textSize * AppDimensions.titleText,
                                  color: AppColors.textColorPrimary,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              TextSpan(
                                text: "Revenue",
                                style: AppStyle.sideDescText,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "9.7 MT \n",
                                style: TextStyle(
                                  fontSize:
                                      ScreenDimension.textSize * AppDimensions.titleText,
                                  color: AppColors.textColorPrimary,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              TextSpan(
                                text: "Load",
                                style: AppStyle.sideDescText,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "\$2.25/KG \n",
                                style: TextStyle(
                                  fontSize:
                                      ScreenDimension.textSize * AppDimensions.titleText,
                                  color: AppColors.textColorPrimary,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              TextSpan(
                                text: "Yield",
                                style: AppStyle.sideDescText,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.lightPurple,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.monetization_on_outlined,
                              color: AppColors.textColorPrimary,
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenDimension.onePercentOfScreenWidth,
                    vertical: ScreenDimension.onePercentOfScreenHight),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("BOOKING REQUEST", style: AppStyle.sideDashboardTitleText),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: SvgPicture.asset(
                          filter,
                          height: ScreenDimension.onePercentOfScreenHight *
                              AppDimensions.defaultIconSize,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: ScreenDimension.onePercentOfScreenHight * AppDimensions.dashboardCardVerticalPadding,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(
                        ScreenDimension.onePercentOfScreenHight *
                            AppDimensions.defaultContainerPadding),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 0.5,
                          blurRadius: 4,
                          offset:
                              const Offset(0, 1), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(
                          ScreenDimension.onePercentOfScreenWidth *
                              AppDimensions.defaultContainerBorderRadiusCurve)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: ScreenDimension.onePercentOfScreenWidth * 42,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "18 \n",
                                  style: TextStyle(
                                    fontSize: ScreenDimension.textSize * AppDimensions.headingText,
                                    color: AppColors.textColorPrimary,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                TextSpan(
                                  text: "Request Sent",
                                  style: AppStyle.sideDescText,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(
                          width: ScreenDimension.onePercentOfScreenWidth * 32,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "22 \n",
                                      style: TextStyle(
                                        fontSize:
                                            ScreenDimension.textSize * AppDimensions.headingText,
                                        color: AppColors.textColorPrimary,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Booked",
                                      style: AppStyle.sideDescText,
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.start,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.lightPurple,
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Icon(
                                    Icons.airplane_ticket_outlined,
                                    color: AppColors.textColorPrimary,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: ScreenDimension.onePercentOfScreenHight * AppDimensions.dashboardCardVerticalPaddingLong),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DashboardCard(
                      numValue: "22.5 ",
                      unit: "MT",
                      icon: Icons.shopping_bag_outlined,
                      color: AppColors.lightBlue,
                      desc: "Total Loads Booked",
                    ),
                    DashboardCard(
                      numValue: "6.8 ",
                      unit: "MT",
                      icon: Icons.shopping_bag_outlined,
                      color: AppColors.lightRed,
                      desc: "Un-Fulfilled Loads",
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: ScreenDimension.onePercentOfScreenHight * AppDimensions.dashboardCardVerticalPadding),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DashboardCard(
                      numValue: "48.8 ",
                      unit: "MT",
                      icon: Icons.shopping_bag_outlined,
                      color: AppColors.lightGreen,
                      desc: "Total Load Posted",
                    ),
                    DashboardCard(
                      numValue: "9.6 ",
                      unit: "MT",
                      icon: Icons.shopping_bag_outlined,
                      color: AppColors.lightYellow,
                      desc: "Total Load Requested",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
