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

class FlightCapacityScreen extends StatefulWidget {
  const FlightCapacityScreen({super.key});

  @override
  State<FlightCapacityScreen> createState() => _FlightCapacityScreenState();
}

class _FlightCapacityScreenState extends State<FlightCapacityScreen> {

  List<Flight> flights = [
    Flight(
      origin: 'ANC',
      destination: 'DXB',
      capacity: 3,
      time: '00:00 - 23:00',
      flightNo: '5Y919T',
    ),
    Flight(
      origin: 'JFK',
      destination: 'LHR',
      capacity: 4,
      time: '08:30 - 19:45',
      flightNo: '5Y827B',
    ),
    Flight(
      origin: 'LAX',
      destination: 'HKG',
      capacity: 5,
      time: '06:15 - 22:30',
      flightNo: '5Y345C',
    ),
    Flight(
      origin: 'CDG',
      destination: 'SIN',
      capacity: 2,
      time: '12:00 - 04:15',
      flightNo: '5Y562D',
    ),
    Flight(
      origin: 'AMS',
      destination: 'ICN',
      capacity: 4,
      time: '14:30 - 09:45',
      flightNo: '5Y784F',
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
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 8.0,right: 12,top: 8,bottom: 8),
                            child: SvgPicture.asset(
                              menu,
                              height: ScreenDimension.onePercentOfScreenHight *
                                  AppDimensions.defaultIconSize1,
                            ),
                          ),
                          Text(
                            'Flight Capacity Listing',
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
                          itemCount: flights.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return CommonCardWidgets
                                .buildFlightCapacityListItem(
                                    context: context,
                                    flightDetails: flights[index]);
                          })),
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
                      CommonCardWidgets.customDivider(
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
                      CommonCardWidgets.customDivider(
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
                      CommonCardWidgets.customDivider(
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
                      CommonCardWidgets.customDivider(
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
