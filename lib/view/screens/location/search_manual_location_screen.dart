import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/manual_location_controller.dart';
import 'widget/custom_location_results_list.dart';
import 'widget/custom_manual_location_search_input.dart';
import 'widget/custom_manual_location_top_bar.dart';
import 'widget/custom_use_current_location_tile.dart';

class SearchManualLocationScreen extends StatelessWidget {
  const SearchManualLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManualLocationController>(
      init: ManualLocationController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                const CustomManualLocationTopBar(),
                Expanded(
                  child: SingleChildScrollView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomManualLocationSearchInput(controller: controller),
                        SizedBox(height: 16.h),
                        CustomUseCurrentLocationTile(
                          onTap: controller.useCurrentLocation,
                        ),
                        SizedBox(height: 20.h),
                        CustomLocationResultsList(controller: controller),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
