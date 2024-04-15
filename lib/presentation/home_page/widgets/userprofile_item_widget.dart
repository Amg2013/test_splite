import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/userprofile_item_model.dart'; // ignore: must_be_immutable
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class UserprofileItemWidget extends StatelessWidget {
  UserprofileItemWidget(this.userprofileItemModelObj, {Key? key})
      : super(
          key: key,
        );

  UserprofileItemModel userprofileItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        margin: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusStyle.roundedBorder24,
        ),
        child: Container(
          height: 165.v,
          width: 354.h,
          decoration: AppDecoration.gradientPrimaryContainerToBlue.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder24,
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Opacity(
                opacity: 0.1,
                child: CustomImageView(
                  imagePath: ImageConstant.imgImage5,
                  height: 165.v,
                  width: 354.h,
                  radius: BorderRadius.circular(
                    24.h,
                  ),
                  alignment: Alignment.center,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 36.h),
                  child: Row(
                    children: [
                      Card(
                        clipBehavior: Clip.antiAlias,
                        elevation: 0,
                        margin: EdgeInsets.only(top: 1.v),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: theme.colorScheme.onPrimaryContainer
                                .withOpacity(1),
                            width: 5.h,
                          ),
                          borderRadius: BorderRadiusStyle.roundedBorder44,
                        ),
                        child: Container(
                          height: 89.adaptSize,
                          width: 89.adaptSize,
                          decoration:
                              AppDecoration.outlineOnPrimaryContainer.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder44,
                          ),
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: SizedBox(
                                  height: 67.v,
                                  width: 44.h,
                                  child: CircularProgressIndicator(
                                    value: 0.5,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 23.v),
                                  child: Text(
                                    "lbl_18".tr,
                                    style: CustomTextStyles
                                        .titleMediumOnPrimaryContainer,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 26.v),
                                  child: Text(
                                    "lbl_10_days_left".tr,
                                    style: CustomTextStyles
                                        .bodySmallOnPrimaryContainer9,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 29.h,
                          bottom: 4.v,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Opacity(
                              opacity: 0.7,
                              child: Text(
                                "msg_ramadan_fundraise".tr,
                                style: CustomTextStyles
                                    .bodySmallOnPrimaryContainer,
                              ),
                            ),
                            SizedBox(height: 6.v),
                            Text(
                              "lbl_8_475_00".tr,
                              style: theme.textTheme.headlineMedium,
                            ),
                            SizedBox(height: 5.v),
                            Opacity(
                              opacity: 0.5,
                              child: Text(
                                "msg_goals_58_251_00".tr,
                                style: CustomTextStyles
                                    .bodySmallOnPrimaryContainer12,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
