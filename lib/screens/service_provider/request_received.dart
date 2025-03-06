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

class RequestReceivedScreen extends StatefulWidget {
  const RequestReceivedScreen({super.key});

  @override
  State<RequestReceivedScreen> createState() => _RequestReceivedScreenState();
}

class _RequestReceivedScreenState extends State<RequestReceivedScreen> {

  List<CapacityRequest> capacityRequests = [
    CapacityRequest(
      airline: 'AMERICAN AIRLINES',
      flightNumber: 'AA4204',
      rfcDate: '06 Sep 24',
      expectedRevenue: 1500.00,
      status: 'CAPACITY REQUESTED',
      logoUrl: 'assets/images/american_airlines_logo.png',
    ),
    CapacityRequest(
      airline: 'DELTA AIR LINES',
      flightNumber: 'DL1822',
      rfcDate: '12 Sep 24',
      expectedRevenue: 2350.75,
      status: 'CAPACITY REQUESTED',
      logoUrl: 'assets/images/delta_logo.png',
    ),
    CapacityRequest(
      airline: 'UNITED AIRLINES',
      flightNumber: 'UA5591',
      rfcDate: '15 Sep 24',
      expectedRevenue: 1875.50,
      status: 'CONFIRMED',
      logoUrl: 'assets/images/united_logo.png',
    ),
    CapacityRequest(
      airline: 'SOUTHWEST AIRLINES',
      flightNumber: 'WN3325',
      rfcDate: '18 Sep 24',
      expectedRevenue: 1200.00,
      status: 'PENDING APPROVAL',
      logoUrl: 'assets/images/southwest_logo.png',
    ),
    CapacityRequest(
      airline: 'BRITISH AIRWAYS',
      flightNumber: 'BA0289',
      rfcDate: '22 Sep 24',
      expectedRevenue: 3450.00,
      status: 'CAPACITY REQUESTED',
      logoUrl: 'assets/images/british_airways_logo.png',
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
      drawer: AppDrawer(selectedScreen: "Request Received"),
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
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: SvgPicture.asset(
                              menu,
                              height: ScreenDimension.onePercentOfScreenHight *
                                  AppDimensions.defaultIconSize1,
                            ),
                          ),
                          Text(
                            '  Request Received Listing',
                            style: AppStyle.defaultHeading,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenDimension.onePercentOfScreenWidth,
                        vertical: ScreenDimension.onePercentOfScreenHight),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total 4/4", style: AppStyle.defaultTitle),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                showFlightSearchBottomSheet(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: SvgPicture.asset(
                                  search,
                                  height:
                                      ScreenDimension.onePercentOfScreenHight *
                                          AppDimensions.defaultIconSize1,
                                ),
                              ),
                            ),
                            SizedBox(
                                width: ScreenDimension.onePercentOfScreenWidth *
                                    4),
                            InkWell(
                              onTap: () {
                                showFlightFilterBottomSheet(context);
                                //const FilterBottomSheet();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: SvgPicture.asset(
                                  filter,
                                  height:
                                      ScreenDimension.onePercentOfScreenHight *
                                          AppDimensions.defaultIconSize1,
                                ),
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
                    ),
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: capacityRequests.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return CommonCardWidgets.buildRequestReceivedListItem(
                              context: context,requestDetails: capacityRequests[index]);
                        }),
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

  void showFlightFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (BuildContext context) {
        TextEditingController originController = TextEditingController();
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return FractionallySizedBox(
              widthFactor: 1,
              child: Container(
                height: ScreenDimension.onePercentOfScreenHight * 32,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Filter/Sort',
                              style: AppStyle.defaultHeading,
                            ),
                            InkWell(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: SvgPicture.asset(
                                      clear,
                                      height: ScreenDimension
                                              .onePercentOfScreenHight *
                                          AppDimensions.cardIconsSize,
                                    ),
                                  ),
                                  Text("Clear",
                                      style: TextStyle(
                                        color: AppColors.primary,
                                        fontSize: ScreenDimension.textSize *
                                            AppDimensions.bodyTextLarge,
                                        fontWeight: FontWeight.w500,
                                      )),
                                ],
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                      const CustomDivider(
                        space: 0,
                        color: Colors.black,
                        hasColor: true,
                        thickness: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 16.0, bottom: 0),
                        child: Text(
                          "FILTER BY",
                          style: TextStyle(
                            fontSize: ScreenDimension.textSize *
                                AppDimensions.bodyTextSmall,
                            color: AppColors.textColorSecondary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Expanded(
                                  child: CustomTextField(
                                controller: originController,
                                labelText: 'Origin',
                                isValidationRequired: false,
                              )),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                  child: CustomTextField(
                                controller: originController,
                                labelText: 'Destination',
                                isValidationRequired: false,
                              )),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: ScreenDimension.onePercentOfScreenHight,
                      ),
                      const CustomDivider(
                        space: 0,
                        color: Colors.black,
                        hasColor: true,
                        thickness: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Expanded(
                                child: ButtonWidgets.buildRoundedGradientButton(
                                  text: 'Cancel',
                                  isborderButton: true,
                                  textColor: AppColors.primary,
                                  verticalPadding: 10,
                                  press: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: ButtonWidgets.buildRoundedGradientButton(
                                  text: 'Apply',
                                  press: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void showFlightSearchBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (BuildContext context) {
        TextEditingController originController = TextEditingController();
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return FractionallySizedBox(
              widthFactor: 1,
              child: Container(
                height: ScreenDimension.onePercentOfScreenHight * 96,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: SvgPicture.asset(
                                    searchBlack,
                                    height: ScreenDimension
                                            .onePercentOfScreenHight *
                                        AppDimensions.defaultIconSize,
                                  ),
                                ),
                                Text(
                                  'Search Flight',
                                  style: AppStyle.defaultHeading,
                                ),
                              ],
                            ),
                            InkWell(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: SvgPicture.asset(
                                      cancel,
                                      height: ScreenDimension
                                              .onePercentOfScreenHight *
                                          AppDimensions.defaultIconSize,
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                      const CustomDivider(
                        space: 0,
                        color: Colors.black,
                        hasColor: true,
                        thickness: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 16.0, bottom: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Enter details to search",
                              style: TextStyle(
                                fontSize: ScreenDimension.textSize *
                                    AppDimensions.titleText3,
                                color: AppColors.textColorPrimary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: SvgPicture.asset(
                                    clear,
                                    height: ScreenDimension
                                            .onePercentOfScreenHight *
                                        AppDimensions.cardIconsSize2,
                                  ),
                                ),
                                Text("Clear",
                                    style: TextStyle(
                                      color: AppColors.primary,
                                      fontSize: ScreenDimension.textSize *
                                          AppDimensions.bodyTextMedium,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Expanded(
                                  child: CustomTextField(
                                controller: originController,
                                labelText: 'Origin*',
                                isValidationRequired: false,
                              )),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                  child: CustomTextField(
                                controller: originController,
                                labelText: 'Destination*',
                                isValidationRequired: false,
                              )),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Expanded(
                                  child: CustomTextField(
                                controller: originController,
                                labelText: 'Flight No',
                                isValidationRequired: false,
                              )),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: ScreenDimension.onePercentOfScreenHight * 60,
                      ),
                      const CustomDivider(
                        space: 0,
                        color: Colors.black,
                        hasColor: true,
                        thickness: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Expanded(
                                child: ButtonWidgets.buildRoundedGradientButton(
                                  text: 'Cancel',
                                  isborderButton: true,
                                  textColor: AppColors.primary,
                                  verticalPadding: 10,
                                  press: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: ButtonWidgets.buildRoundedGradientButton(
                                  text: 'Apply',
                                  press: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
