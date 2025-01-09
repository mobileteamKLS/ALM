import 'package:alm/widgest/app_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/dimensions.dart';
import '../../core/img_assets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_theme.dart';
import '../../utils/media_query.dart';

class FlightCapacityScreen extends StatefulWidget {
  const FlightCapacityScreen({super.key});

  @override
  State<FlightCapacityScreen> createState() => _FlightCapacityScreenState();
}

class _FlightCapacityScreenState extends State<FlightCapacityScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenDimension().init(context);
    return  Scaffold(
      appBar: AppBar(
        title: const Text(
          '',
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
          // SvgPicture.asset(
          //   userSettings,
          //   height: 25,
          // ),
          // const SizedBox(
          //   width: 10,
          // ),
          SvgPicture.asset(
            notificationBell,
            height: 25,
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      drawer: AppDrawer(selectedScreen: "Flight Capacity"),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.symmetric(vertical: ScreenDimension.onePercentOfScreenHight*defaultPageVerticalPadding,horizontal: ScreenDimension.onePercentOfScreenWidth*defaultPageHorizontalPadding),
            decoration: const BoxDecoration(
              color: AppColors.background,
            ),
            child:  SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Row(
                        children: [
                          Icon(CupertinoIcons.cube),
                          Text(
                            '  SHIPMENT LIST',
                            style: AppStyle.screenHeading,
                          ),
                        ],
                      ),

                    ],
                  ),
                 Padding(padding: EdgeInsets.symmetric(vertical: ScreenDimension.onePercentOfScreenHight*0.5,),
                 child: Row(children: [

                 ],),)

              ],),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: IgnorePointer(
              child: CustomPaint(
                size: Size(MediaQuery.of(context).size.width,
                    100), // Adjust the height as needed
                painter: AppBarPainterGradient(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
