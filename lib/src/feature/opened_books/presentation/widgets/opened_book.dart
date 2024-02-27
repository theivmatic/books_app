import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class OpenedBookWidget extends StatelessWidget {
  const OpenedBookWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        20.dg,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 350.w,
            height: 190.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Image.asset(
              'assets/images/upload_image.png',
              scale: 0.5,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(10.dg),
              width: 350.w,
              height: 95.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                    20.r,
                  ),
                  bottomRight: Radius.circular(
                    20.r,
                  ),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('11111111111'),
                      Text('11111111111'),
                      Text('11111111111'),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('11111111111'),
                      Text('11111111111'),
                      Text('11111111111'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          LinearProgressBar(
            progressColor: AppColors.yellow,
            backgroundColor: AppColors.grey,
            maxSteps: 100,
            currentStep: 50,
            minHeight: 2.h,
          ),
        ],
      ),
    );
  }
}
