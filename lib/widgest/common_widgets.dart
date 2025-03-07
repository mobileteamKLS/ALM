import 'dart:async';

import 'package:alm/modal/flight_capacity.dart';
import 'package:alm/theme/app_colors.dart';
import 'package:alm/widgest/progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../core/dimensions.dart';
import '../core/img_assets.dart';
import '../screens/service_provider/flight_capacity_details.dart';
import '../screens/service_provider/request_received_details.dart';
import '../theme/app_theme.dart';
import '../utils/media_query.dart';

class CommonCardWidgets {
  static Widget buildFlightCapacityListItem({
    required Flight flightDetails,
    required BuildContext context,
  }) {
    return Container(
      padding: EdgeInsets.all(ScreenDimension.onePercentOfScreenHight *
          AppDimensions.defaultContainerPadding),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0.5,
            blurRadius: 4,
            offset: const Offset(0, 1),
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
                    flightDetails.origin,
                    style: TextStyle(
                      fontSize: ScreenDimension.textSize *
                          AppDimensions.titleText2,
                      color: AppColors.textColorPrimary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: SvgPicture.asset(
                      plane,
                      height: ScreenDimension.onePercentOfScreenHight *
                          AppDimensions.cardIconsSize,
                    ),
                  ),
                  Text(
                    flightDetails.destination,
                    style: TextStyle(
                      fontSize: ScreenDimension.textSize *
                          AppDimensions.titleText2,
                      color: AppColors.textColorPrimary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: ScreenDimension.onePercentOfScreenHight * 0.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SvgPicture.asset(
                      clock,
                      height: ScreenDimension.onePercentOfScreenHight *
                          AppDimensions.cardIconsSize2,
                    ),
                  ),
                  Text(
                    flightDetails.time,
                    style: AppStyle.cardDescText,
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
              SizedBox(
                height: ScreenDimension.onePercentOfScreenHight * 0.5,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SvgPicture.asset(
                      ticket,
                      height: ScreenDimension.onePercentOfScreenHight *
                          AppDimensions.cardIconsSize2,
                    ),
                  ),
                  Text(
                    flightDetails.flightNo,
                    style: AppStyle.cardDescText,
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
                  flightDetails.capacity.toString(),
                  style: TextStyle(
                    fontSize:
                        ScreenDimension.textSize * AppDimensions.bodyTextSmall,
                    color: AppColors.textColorPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: ScreenDimension.onePercentOfScreenHight * 0.5,
              ),
              Text(
                "AVAILABLE",
                style: AppStyle.cardDescText,
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => FlightCapacityDetailsScreen()));
            },
            child: Container(
              width: ScreenDimension.onePercentOfScreenWidth * 7,
              height: ScreenDimension.onePercentOfScreenWidth * 7,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.gradient1,
              ),
              child: SvgPicture.asset(
                arrowRight,
                height: ScreenDimension.onePercentOfScreenHight *
                    AppDimensions.cardIconsSize,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildRequestReceivedListItem({
    required CapacityRequest requestDetails,
    required BuildContext context,
  }) {
    return Container(
      padding: EdgeInsets.all(ScreenDimension.onePercentOfScreenHight *
          AppDimensions.defaultContainerPadding),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0.5,
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(
            ScreenDimension.onePercentOfScreenWidth *
                AppDimensions.defaultContainerBorderRadiusCurve)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.lightYellow,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child:  Text(
                      requestDetails.status,
                      style:  AppStyle.statusText,
                    ),
                  ),
                   SizedBox(height: ScreenDimension.onePercentOfScreenHight*0.5),
                   Text(
                     requestDetails.airline,
                    style: AppStyle.subHeading,
                  ),
                ],
              ),
              SizedBox(
                width: ScreenDimension.onePercentOfScreenWidth*16,
                // height: ScreenDimension.onePercentOfScreenWidth*16,
                child: Image.asset(
                  americanAirline,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
          SizedBox(height: ScreenDimension.onePercentOfScreenHight),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text(
                      'Flight No.',
                      style: AppStyle.sideDescText,
                    ),
                    SizedBox(height: ScreenDimension.onePercentOfScreenHight*0.2),
                    Text(
                      requestDetails.flightNumber,
                      style:  AppStyle.defaultTitle,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text(
                      'RFC Date',
                      style: AppStyle.sideDescText,
                    ),
                    SizedBox(height: ScreenDimension.onePercentOfScreenHight*0.2),
                    Text(
                      requestDetails.rfcDate,
                      style:  AppStyle.defaultTitle,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                     Text(
                      'Exp. Revenue',
                      style: AppStyle.sideDescText,
                    ),
                    SizedBox(height: ScreenDimension.onePercentOfScreenHight*0.2),
                    Text(
                      requestDetails.formattedRevenue,
                      style: AppStyle.defaultTitle,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => RequestReceivedDetailsScreen()));
                },
                child: Container(
                  width: ScreenDimension.onePercentOfScreenWidth * 7,
                  height: ScreenDimension.onePercentOfScreenWidth * 7,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.gradient1,
                  ),
                  child: SvgPicture.asset(
                    arrowRight,
                    height: ScreenDimension.onePercentOfScreenHight *
                        AppDimensions.cardIconsSize,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Widget buildRequestReceivedDetailsCard(){
    return  Container(
      width: double.infinity,
      padding:  EdgeInsets.all(ScreenDimension.onePercentOfScreenHight *
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(

            children: [
              SizedBox(width: ScreenDimension.onePercentOfScreenWidth*44,
                  child: buildInfoColumn('RFC Date', '06 Sep 24'),
              ),
              SizedBox(width: ScreenDimension.onePercentOfScreenWidth*44, child: buildInfoColumn('Exp. Revenue', '16 Sep 24')),
            ],
          ),
           Padding(
             padding: const EdgeInsets.symmetric(vertical: 12.0),
             child: customDivider(
              space: 0,
              color: Colors.black,
              hasColor: true,
              thickness: 1,
                       ),
           ),
          SizedBox(height: ScreenDimension.onePercentOfScreenHight*0.5 ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: ScreenDimension.onePercentOfScreenWidth*44,child: buildInfoColumn('From Date', '06 Sep 24')),
              SizedBox(width: ScreenDimension.onePercentOfScreenWidth*44,child: buildInfoColumn('To Date', '16 Sep 24')),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: customDivider(
              space: 0,
              color: Colors.black,
              hasColor: true,
              thickness: 1,
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ULD Load',
                style: AppStyle.cardDescText,
              ),
               SizedBox(height: ScreenDimension.onePercentOfScreenHight * 0.01),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SvgPicture.asset(
                      cube,
                      height: ScreenDimension.onePercentOfScreenHight *
                          AppDimensions.cardIconsSize2,
                    ),
                  ),
                  Text(
                    '2 AA4 | 100.00 KG | 10.00 CBM',
                    style: AppStyle.cardValueText,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: ScreenDimension.onePercentOfScreenHight*0.5 ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Loose Load',
                style:AppStyle.cardDescText,
              ),
              SizedBox(height: ScreenDimension.onePercentOfScreenHight * 0.01),
              Row(
                children: [
                  Padding(
                    padding:EdgeInsets.only(right: 8.0),
                    child: SvgPicture.asset(
                      dolly,
                      height: ScreenDimension.onePercentOfScreenHight *
                          AppDimensions.cardIconsSize2,
                    ),
                  ),
                  Text(
                    '10 PCS | 100.00 KG | 10.00 CBM',
                    style: AppStyle.cardValueText,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Widget buildInfoColumn(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppStyle.cardDescText,
        ),
         SizedBox(height: ScreenDimension.onePercentOfScreenHight*0.1),
        Text(
          value,
          style: AppStyle.cardValueText,
        ),
      ],
    );
  }

  static Widget buildAttachedDocumentCard(){
    return  Container(
      width: double.infinity,
      padding:  EdgeInsets.all(ScreenDimension.onePercentOfScreenHight *
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "ATTACHED DOCUMENTS",
            style: AppStyle.defaultTitle,
          ),
          SizedBox(height: ScreenDimension.onePercentOfScreenHight),
          Text(
            "document_1.pdf",
            style: AppStyle.cardBlueText,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: customDivider(
              space: 0,
              color: Colors.black,
              hasColor: true,
              thickness: 1,
            ),
          ),
          Text(
            "document_sample_2.pdf",
            style: AppStyle.cardBlueText,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: customDivider(
              space: 0,
              color: Colors.black,
              hasColor: true,
              thickness: 1,
            ),
          ),
          Text(
            "reference.xlx",
            style: AppStyle.cardBlueText,
          ),

        ],
      ),
    );
  }


  static Widget buildDashboardCard({
    required String numValue,
    required String unit,
    required IconData icon,
    required String desc,
    required Color color,
    BuildContext? context,
  }) {
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

  static Widget customDivider({
    double space = 20,
    Color color = AppColors.black,
    bool hasColor = false,
    double? height = 0.5,
    double? thickness = 0.5,
  }) {
    return Column(
      children: [
        Divider(
          color: hasColor ? color.withOpacity(0.2) : color.withOpacity(0),
          height: height,
          thickness: thickness,
        ),
      ],
    );
  }
}

class ButtonWidgets {
  static Widget buildRoundedGradientButton({
    required String text,
    required VoidCallback press,
    Color color = AppColors.primary,
    Color? textColor = AppColors.white,
    double horizontalPadding = 20,
    double verticalPadding = 12,
    double cornerRadius = 10,
    double textSize = 16,
    bool isborderButton = false,
    BuildContext? context,
  }) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
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



class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final double initialHeight;
  final double errorHeight;
  final String validationMessage;
  final TextInputType inputType;
  final List<TextInputFormatter>? inputFormatters;
  final RegExp? validationPattern;
  final String patternErrorMessage;
  final double? customWidth;
  final bool isValidationRequired;
  final bool isEnabled;
  final Function(VoidCallback)? registerTouchedCallback;
  final Function(String)? onApiCall;
  final FocusNode? focusNode;

  CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.initialHeight = 45,
    this.errorHeight = 65,
    this.validationMessage = 'Field is Required',
    this.isEnabled = true,
    this.inputType = TextInputType.text,
    this.inputFormatters,
    this.validationPattern,
    this.patternErrorMessage = 'Invalid input',
    this.customWidth,
    this.isValidationRequired = true,
    this.registerTouchedCallback,
    this.onApiCall,
    this.focusNode, // Optional focusNode
  })  : assert(
  !isValidationRequired || registerTouchedCallback != null,
  'registerTouchedCallback must be provided when isValidationRequired is true',
  ),
        super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late double fieldHeight;
  String? errorMessage;
  bool _isTouched = false;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    fieldHeight = widget.initialHeight;
    if (widget.isValidationRequired && widget.registerTouchedCallback != null) {
      widget.registerTouchedCallback!(
          _markTouched); // Register the callback if required
    }
  }

  void _markTouched() {
    setState(() {
      _isTouched = true;
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onChanged(String value) {
    setState(() {
      _isTouched = true;
    });

    if (widget.isValidationRequired) {
      final isValid = widget.validationPattern?.hasMatch(value) ?? true;
      setState(() {
        if (value.isEmpty) {
          fieldHeight = widget.errorHeight;
          errorMessage = widget.validationMessage;
        } else if (!isValid) {
          fieldHeight = widget.errorHeight;
          errorMessage = widget.patternErrorMessage;
        } else {
          fieldHeight = widget.initialHeight;
          errorMessage = null;
        }
      });
      Form.of(context)?.validate();
    }

    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (widget.onApiCall != null) {
        widget.onApiCall!(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = widget.customWidth ?? MediaQuery.of(context).size.width;

    return SizedBox(
      height: fieldHeight,
      width: width,
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.inputType,
        inputFormatters: widget.inputFormatters,
        focusNode: widget.focusNode,
        enabled: widget.isEnabled,
        validator: widget.isValidationRequired
            ? (value) {
          if (!_isTouched) return null;

          if (value == null || value.isEmpty) {
            setState(() {
              fieldHeight = widget.errorHeight;
              errorMessage = widget.validationMessage;
            });
            return errorMessage;
          }
          if (widget.validationPattern != null &&
              !widget.validationPattern!.hasMatch(value)) {
            setState(() {
              fieldHeight = widget.errorHeight;
              errorMessage = widget.patternErrorMessage;
            });
            return errorMessage;
          }
          setState(() {
            fieldHeight = widget.initialHeight;
            errorMessage = null;
          });
          return null;
        }
            : null,
        onChanged: _onChanged,
        decoration: InputDecoration(
          contentPadding:
          const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
          errorStyle: const TextStyle(height: 0),
          labelText: widget.isValidationRequired
              ? "${widget.labelText}*"
              : widget.labelText,
          labelStyle: TextStyle(color: AppColors.textColorPrimary),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide(color: AppColors.textFieldBorderColor, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide(color: AppColors.textFieldBorderColor, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide(color: AppColors.textFieldBorderColor, width: 0.5),
          ),
          errorText: _isTouched ? errorMessage : null,
        ),
      ),
    );
  }
}

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Filter/Sort',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton.icon(
                icon: Icon(Icons.refresh, size: 18),
                label: Text('Clear', style: TextStyle(color: Colors.blue)),
                onPressed: () {

                },
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'FILTER BY',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Origin',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Destination',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text('Cancel'),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text('Apply'),
                  ),
                  onPressed: () {
                    // Apply filter logic
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}


class FlightCapacityCard extends StatefulWidget {
  final FlightCapacityDetails flightCapacityDetails;
  const FlightCapacityCard({super.key, required this.flightCapacityDetails});

  @override
  _FlightCapacityCardState createState() => _FlightCapacityCardState();
}

class _FlightCapacityCardState extends State<FlightCapacityCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ScreenDimension.onePercentOfScreenHight *
          AppDimensions.defaultContainerPadding),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0.5,
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(
            ScreenDimension.onePercentOfScreenWidth *
                AppDimensions.defaultContainerBorderRadiusCurve)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.flightCapacityDetails.date,
                    style: AppStyle.subHeading,
                  ),
                  SizedBox(height: ScreenDimension.onePercentOfScreenHight,),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SvgPicture.asset(
                          cube,
                          height: ScreenDimension.onePercentOfScreenHight *
                              AppDimensions.cardIconsSize,
                        ),
                      ),
                      Text(
                        "${widget.flightCapacityDetails.amount} ${widget.flightCapacityDetails.currency}",
                        style: AppStyle.cardDescText,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  GradientCircularProgressIndicator(
                    targetProgress: widget.flightCapacityDetails.progress,
                    backgroundColor: Colors.grey.shade200,
                    size: ScreenDimension.onePercentOfScreenHight*5,
                    strokeWidth: 4,
                  ),
                ],
              ),
            ],
          ),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Padding(
                   padding: const EdgeInsets.only(right: 8.0),
                   child: SvgPicture.asset(
                     dolly,
                     height: ScreenDimension.onePercentOfScreenHight *
                         AppDimensions.cardIconsSize,
                   ),
                 ),
                 Text(
                   "${widget.flightCapacityDetails.rate} / ${widget.flightCapacityDetails.unit} ${widget.flightCapacityDetails.currency}",
                   style: AppStyle.cardDescText,
                 ),
               ],
             ),
             Text.rich(
               TextSpan(
                 children: [
                   TextSpan(
                     text: "${widget.flightCapacityDetails.weightCurrent} / ${widget.flightCapacityDetails.weightTotal}",
                     style: TextStyle(
                       fontSize: ScreenDimension.textSize * AppDimensions.titleText3,
                       color: AppColors.textColorPrimary,
                       fontWeight: FontWeight.normal,
                     ),
                   ),
                   TextSpan(
                     text: " ${widget.flightCapacityDetails.unit}",
                     style: TextStyle(
                       fontSize: ScreenDimension.textSize * AppDimensions.titleText3,
                       color: AppColors.textColorPrimary,
                       fontWeight: FontWeight.w800,
                     ),
                   ),
                 ],
               ),
               textAlign: TextAlign.start,
             ),
           ],
         )
        ],
      ),
    );
  }
}

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
            offset: const Offset(0, 1),
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
                      height: ScreenDimension.onePercentOfScreenHight *
                          AppDimensions.cardIconsSize2,
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
              SizedBox(
                height: ScreenDimension.onePercentOfScreenHight * 0.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SvgPicture.asset(
                      clock,
                      height: ScreenDimension.onePercentOfScreenHight *
                          AppDimensions.cardIconsSize2,
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
              SizedBox(
                height: ScreenDimension.onePercentOfScreenHight * 0.5,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SvgPicture.asset(
                      ticket,
                      height: ScreenDimension.onePercentOfScreenHight *
                          AppDimensions.cardIconsSize2,
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
              SizedBox(
                height: ScreenDimension.onePercentOfScreenHight * 0.5,
              ),
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
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => FlightCapacityDetailsScreen()));
            },
            child: Container(
              width: ScreenDimension.onePercentOfScreenWidth * 7,
              height: ScreenDimension.onePercentOfScreenWidth * 7,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.gradient1,
              ),
              child: SvgPicture.asset(
                arrowRight,
                height: ScreenDimension.onePercentOfScreenHight *
                    AppDimensions.cardIconsSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
