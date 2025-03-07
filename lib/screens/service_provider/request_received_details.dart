import 'package:alm/widgest/app_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/dimensions.dart';
import '../../core/img_assets.dart';
import '../../modal/flight_capacity.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_theme.dart';
import '../../utils/media_query.dart';
import '../../widgest/common_widgets.dart';

class RequestReceivedDetailsScreen extends StatefulWidget {
  const RequestReceivedDetailsScreen({super.key});

  @override
  State<RequestReceivedDetailsScreen> createState() =>
      _RequestReceivedDetailsScreenState();
}

class _RequestReceivedDetailsScreenState
    extends State<RequestReceivedDetailsScreen> {
  List<FlightCapacityDetails> shipmentsCapacity = [
    FlightCapacityDetails(
      date: 'Sat, 02 May 24',
      amount: 11500.00,
      rate: 1.60,
      weightCurrent: 42000,
      weightTotal: 51208,
      unit: 'KG',
      currency: 'USD',
      progress: 0.60,
    ),
    FlightCapacityDetails(
      date: 'Thu, 03 May 24',
      amount: 9800.00,
      rate: 1.60,
      weightCurrent: 36750,
      weightTotal: 45000,
      unit: 'KG',
      currency: 'USD',
      progress: 0.82,
    ),
    FlightCapacityDetails(
      date: 'Tue, 04 May 24',
      amount: 15200.00,
      rate: 1.75,
      weightCurrent: 52000,
      weightTotal: 65000,
      unit: 'KG',
      currency: 'USD',
      progress: 0.80,
    ),
    FlightCapacityDetails(
      date: 'Wed, 21 Aug 24',
      amount: 8300.00,
      rate: 1.55,
      weightCurrent: 32000,
      weightTotal: 40000,
      unit: 'KG',
      currency: 'USD',
      progress: 0.80,
    ),
    FlightCapacityDetails(
      date: 'Mon, 02 May 24',
      amount: 12700.00,
      rate: 1.65,
      weightCurrent: 38500,
      weightTotal: 55000,
      unit: 'KG',
      currency: 'USD',
      progress: 0.70,
    ),
    FlightCapacityDetails(
      date: 'Sat, 02 May 24',
      amount: 11500.00,
      rate: 1.60,
      weightCurrent: 42000,
      weightTotal: 51208,
      unit: 'KG',
      currency: 'USD',
      progress: 0.60,
    ),
    FlightCapacityDetails(
      date: 'Thu, 03 May 24',
      amount: 9800.00,
      rate: 1.60,
      weightCurrent: 36750,
      weightTotal: 45000,
      unit: 'KG',
      currency: 'USD',
      progress: 0.82,
    ),
  ];


  @override
  Widget build(BuildContext context) {
    ScreenDimension().init(context);
    return Scaffold(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            child: Container(
                              color: AppColors.gradient1,
                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(5),
                              //
                              // ),
                              padding: const EdgeInsets.only(left: 8.0,right: 12,top: 8,bottom: 8),
                              child: SvgPicture.asset(
                                back,
                                height: ScreenDimension.onePercentOfScreenHight * AppDimensions.defaultIconSize1,
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          Text(
                            'Request Received Details',
                            style: AppStyle.defaultHeading,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: ScreenDimension.onePercentOfScreenHight,),
                  Container(
                    padding: EdgeInsets.all(ScreenDimension.onePercentOfScreenHight *
                        AppDimensions.defaultContainerPadding),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          AppColors.gradient1,
                          AppColors.gradient2,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: const Offset(
                              0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "AMERICAN AIRLINES",
                              style: TextStyle(
                                fontSize: ScreenDimension.textSize *
                                    AppDimensions.headingText4,
                                color: AppColors.cardTextColor,
                                fontWeight: FontWeight.w800,
                              ),
                            ),

                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 0.0,right: 4.0),
                                  child: SvgPicture.asset(
                                    ticketBlue,
                                    height: ScreenDimension.onePercentOfScreenHight * AppDimensions.defaultIconSize1,
                                  ),
                                ),
                                Text(
                                  "5Y919T",
                                  style: TextStyle(
                                    fontSize: ScreenDimension.textSize *
                                        AppDimensions.bodyTextMedium,
                                    color: AppColors.cardTextColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child:  Text(
                                "CAPACITY REQUESTED",
                                style:  AppStyle.statusText,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenDimension.onePercentOfScreenWidth,
                        vertical: ScreenDimension.onePercentOfScreenHight),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CommonCardWidgets.buildRequestReceivedDetailsCard(),
                        SizedBox(height: ScreenDimension.onePercentOfScreenHight ),
                        CommonCardWidgets.buildAttachedDocumentCard(),
                        SizedBox(height: ScreenDimension.onePercentOfScreenHight ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(
                              ScreenDimension.onePercentOfScreenHight *
                                  AppDimensions.defaultContainerPadding),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 0.5,
                                blurRadius: 4,
                                offset: const Offset(0, 1),
                              ),
                            ],
                            // border: Border.all(color: Colors.grey.shade200),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(width: ScreenDimension.onePercentOfScreenWidth*44,child: CommonCardWidgets.buildInfoColumn('SHC', 'GEN,PER')),
                              SizedBox(width: ScreenDimension.onePercentOfScreenWidth*44,child: CommonCardWidgets.buildInfoColumn('Assigned AWB', '125-20234568')),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                ],
              ),
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
