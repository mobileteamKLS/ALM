import 'package:alm/widgest/app_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/dimensions.dart';
import '../../core/img_assets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_theme.dart';
import '../../utils/media_query.dart';
import '../../widgest/common_widgests.dart';

class FlightCapacityDetailsScreen extends StatefulWidget {
  const FlightCapacityDetailsScreen({super.key});

  @override
  State<FlightCapacityDetailsScreen> createState() =>
      _FlightCapacityDetailsScreenState();
}

class _FlightCapacityDetailsScreenState
    extends State<FlightCapacityDetailsScreen> {
  List<FlightCapacityListItem> flightCapacityData = [
    FlightCapacityListItem(
      origin: 'ANC',
      destination: 'DXB',
      capacity: 3,
      time: '00:00 - 23:00',
      flightNo: "5Y919T",
    ),
    FlightCapacityListItem(
      origin: 'PHX',
      destination: 'LAX',
      capacity: 12,
      time: '06:00 - 20:00',
      flightNo: "AA1234",
    ),
    FlightCapacityListItem(
      origin: 'JFK',
      destination: 'LHR',
      capacity: 8,
      time: '08:00 - 22:00',
      flightNo: "BA567",
    ),
    FlightCapacityListItem(
      origin: 'SFO',
      destination: 'NRT',
      capacity: 5,
      time: '10:00 - 19:00',
      flightNo: "UA890",
    ),
    FlightCapacityListItem(
      origin: 'SYD',
      destination: 'SIN',
      capacity: 6,
      time: '07:00 - 21:00',
      flightNo: "QF456",
    ),
    FlightCapacityListItem(
      origin: 'MEX',
      destination: 'MIA',
      capacity: 10,
      time: '05:00 - 23:00',
      flightNo: "AM789",
    ),
    FlightCapacityListItem(
      origin: 'IST',
      destination: 'DOH',
      capacity: 7,
      time: '04:00 - 20:00',
      flightNo: "TK321",
    ),
    FlightCapacityListItem(
      origin: 'DXB',
      destination: 'CDG',
      capacity: 9,
      time: '02:00 - 18:00',
      flightNo: "EK456",
    )
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
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 6.0),
                              child: SvgPicture.asset(
                                back,
                                height: ScreenDimension.onePercentOfScreenHight * AppDimensions.cardIconsSize,
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          Text(
                            '  Flight Capacity Details',
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
                              "ANC",
                              style: TextStyle(
                                fontSize: ScreenDimension.textSize *
                                    AppDimensions.headingText3,
                                color: AppColors.cardTextColor,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child: SvgPicture.asset(
                                planeBlue,
                                height: ScreenDimension.onePercentOfScreenHight * AppDimensions.cardIconsSize,
                              ),
                            ),
                            Text(
                              "HKG",
                              style: TextStyle(
                                fontSize: ScreenDimension.textSize *
                                    AppDimensions.headingText3,
                                color: AppColors.cardTextColor,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: SvgPicture.asset(
                                    clockBlue,
                                    height: ScreenDimension.onePercentOfScreenHight * AppDimensions.cardIconsSize2,
                                  ),
                                ),
                                Text(
                                  "00:00 - 23:00",
                                  style: TextStyle(
                                    fontSize: ScreenDimension.textSize *
                                        AppDimensions.bodyTextSmall,
                                    color: AppColors.cardTextColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: SvgPicture.asset(
                                    ticketBlue,
                                    height: ScreenDimension.onePercentOfScreenHight * AppDimensions.cardIconsSize2,
                                  ),
                                ),
                                Text(
                                  "5Y919T",
                                  style: TextStyle(
                                    fontSize: ScreenDimension.textSize *
                                        AppDimensions.bodyTextSmall,
                                    color: AppColors.cardTextColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Total 4/4", style: AppStyle.defaultTitle),

                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenDimension.onePercentOfScreenWidth,
                      ),
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: flightCapacityData.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return FlightCapacityListItem(
                              origin: flightCapacityData[index].origin,
                              destination:
                                  flightCapacityData[index].destination,
                              capacity: flightCapacityData[index].capacity,
                              time: flightCapacityData[index].time,
                              flightNo: flightCapacityData[index].flightNo,
                            );
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
}
