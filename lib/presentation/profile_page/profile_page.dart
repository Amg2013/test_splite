import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'bloc/profile_bloc.dart';
import 'models/profile_model.dart';
import 'models/userprofile2_item_model.dart';
import 'widgets/userprofile2_item_widget.dart'; // ignore_for_file: must_be_immutable

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (context) => ProfileBloc(ProfileState(
        profileModelObj: ProfileModel(),
      ))
        ..add(ProfileInitialEvent()),
      child: ProfilePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgSignIn,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: AppDecoration.fillOnPrimaryContainer1.copyWith(
              image: DecorationImage(
                image: AssetImage(
                  ImageConstant.imgSignIn,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 116.adaptSize,
                        width: 116.adaptSize,
                        decoration: AppDecoration.fillPrimaryContainer.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder58,
                        ),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgGroup153,
                          height: 93.v,
                          width: 116.h,
                          alignment: Alignment.bottomCenter,
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgNotification,
                        height: 24.v,
                        width: 12.h,
                        margin: EdgeInsets.only(
                          left: 107.h,
                          top: 6.v,
                          bottom: 86.v,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.v),
                Text(
                  "lbl_mark_hamlin".tr,
                  style: theme.textTheme.headlineSmall,
                ),
                SizedBox(height: 5.v),
                Opacity(
                  opacity: 0.7,
                  child: Text(
                    "msg_hamlin84_mail_com".tr,
                    style: CustomTextStyles.bodyMediumErrorContainer_1,
                  ),
                ),
                SizedBox(height: 26.v),
                _buildDonationHistory(context),
                SizedBox(height: 10.v),
                _buildUserProfile(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildDonationHistory(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "msg_donation_history".tr,
          style: theme.textTheme.titleMedium,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 4.v),
          child: Text(
            "lbl_view_all".tr,
            style: CustomTextStyles.titleSmallBlue600Medium,
          ),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {
    return BlocSelector<ProfileBloc, ProfileState, ProfileModel?>(
      selector: (state) => state.profileModelObj,
      builder: (context, profileModelObj) {
        return ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 16.v,
            );
          },
          itemCount: profileModelObj?.userprofile2ItemList.length ?? 0,
          itemBuilder: (context, index) {
            Userprofile2ItemModel model =
                profileModelObj?.userprofile2ItemList[index] ??
                    Userprofile2ItemModel();
            return Userprofile2ItemWidget(
              model,
            );
          },
        );
      },
    );
  }
}
