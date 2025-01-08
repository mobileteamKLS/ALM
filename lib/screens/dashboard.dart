import 'package:alm/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../core/dimensions.dart';
import '../core/img_assets.dart';
import '../utils/media_query.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
      drawer: const Drawer(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(ScreenDimension.onePercentOfScreenHight),
        decoration: const BoxDecoration(
          color: AppColors.background,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(ScreenDimension.onePercentOfScreenHight*1.2),
                decoration:  BoxDecoration(
                  color:AppColors.draft,
                  borderRadius: BorderRadius.all(Radius.circular(ScreenDimension.onePercentOfScreenWidth*2)),
                ),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Hello Harsh,",
                        style:  TextStyle(
                            color: AppColors.textColorPrimary,
                            letterSpacing: 0.8,
                            fontSize: ScreenDimension.textSize * 1.8,
                            fontWeight: FontWeight.w700)),
                    Text(
                        "Welcome to Anchorage Logistics Marketplace",
                        style:  TextStyle(
                            color: AppColors.textColorPrimary,
                            letterSpacing: 0.8,
                            fontSize: ScreenDimension.textSize * 1.4,
                            fontWeight: FontWeight.w500)),
                ],),
              )

            ],
          ),
        ),
      ),

    );
  }
}
