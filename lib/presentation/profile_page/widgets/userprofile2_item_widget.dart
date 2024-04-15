import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/userprofile2_item_model.dart'; // ignore: must_be_immutable
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class Userprofile2ItemWidget extends StatelessWidget {
  Userprofile2ItemWidget(this.userprofile2ItemModelObj, {Key? key})
      : super(
          key: key,
        );

  Userprofile2ItemModel userprofile2ItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 22.v,
      ),
      decoration: AppDecoration.sd.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 1.v),
            padding: EdgeInsets.symmetric(
              horizontal: 12.h,
              vertical: 6.v,
            ),
            decoration: AppDecoration.fillPrimaryContainer.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder21,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    userprofile2ItemModelObj.age!,
                    style: theme.textTheme.titleSmall,
                  ),
                ),
                SizedBox(height: 1.v),
                Opacity(
                  opacity: 0.5,
                  child: Text(
                    userprofile2ItemModelObj.month!,
                    style: CustomTextStyles.bodySmallOnPrimaryContainer8,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10.h,
              bottom: 5.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userprofile2ItemModelObj.donationType!,
                  style: CustomTextStyles.titleSmallGray900,
                ),
                SizedBox(height: 1.v),
                Text(
                  userprofile2ItemModelObj.donationDate!,
                  style: CustomTextStyles.bodySmallErrorContainer,
                )
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
              top: 10.v,
              right: 1.h,
              bottom: 11.v,
            ),
            child: Text(
              userprofile2ItemModelObj.donationAmount!,
              style: CustomTextStyles.titleSmallBlue600,
            ),
          )
        ],
      ),
    );
  }
}
