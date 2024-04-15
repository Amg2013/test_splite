import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/userprofile1_item_model.dart'; // ignore: must_be_immutable
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class Userprofile1ItemWidget extends StatelessWidget {
  Userprofile1ItemWidget(this.userprofile1ItemModelObj, {Key? key})
      : super(
          key: key,
        );

  Userprofile1ItemModel userprofile1ItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 163.v,
      width: 272.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgImage7,
            height: 163.v,
            width: 272.h,
            radius: BorderRadius.circular(
              24.h,
            ),
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.fromLTRB(26.h, 96.v, 22.h, 21.v),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userprofile1ItemModelObj.title!,
                        style: CustomTextStyles.titleMediumOnPrimaryContainer,
                      ),
                      SizedBox(height: 1.v),
                      Opacity(
                        opacity: 0.5,
                        child: Text(
                          userprofile1ItemModelObj.date!,
                          style: theme.textTheme.labelMedium,
                        ),
                      )
                    ],
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgArrowRight,
                    height: 10.v,
                    width: 5.h,
                    margin: EdgeInsets.only(
                      top: 22.v,
                      bottom: 12.v,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
