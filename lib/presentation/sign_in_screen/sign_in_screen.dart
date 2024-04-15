import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'bloc/sign_in_bloc.dart';
import 'models/sign_in_model.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<SignInBloc>(
      create: (context) => SignInBloc(SignInState(
        signInModelObj: SignInModel(),
      ))
        ..add(SignInInitialEvent()),
      child: SignInScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: theme.colorScheme.onPrimaryContainer.withOpacity(0.1),
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            color: theme.colorScheme.onPrimaryContainer.withOpacity(0.1),
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgSignIn,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 18.h,
                  vertical: 4.v,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "lbl_sign_in".tr,
                        style: theme.textTheme.headlineLarge,
                      ),
                    ),
                    SizedBox(height: 11.v),
                    SizedBox(
                      width: 354.h,
                      child: Text(
                        "msg_lorem_ipsum_dolor".tr,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyles.bodyMedium13.copyWith(
                          height: 1.54,
                        ),
                      ),
                    ),
                    SizedBox(height: 25.v),
                    BlocSelector<SignInBloc, SignInState,
                        TextEditingController?>(
                      selector: (state) => state.emailController,
                      builder: (context, emailController) {
                        return CustomTextFormField(
                          controller: emailController,
                          hintText: "lbl_email_address".tr,
                          textInputType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null ||
                                (!isValidEmail(value, isRequired: true))) {
                              return "err_msg_please_enter_valid_email".tr;
                            }
                            return null;
                          },
                        );
                      },
                    ),
                    SizedBox(height: 4.v),
                    _buildStackLogoLight(context),
                    SizedBox(height: 51.v),
                    Text(
                      "msg_or_continue_with".tr,
                      style: theme.textTheme.bodyMedium,
                    ),
                    SizedBox(height: 31.v),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 39.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomIconButton(
                            height: 67.adaptSize,
                            width: 67.adaptSize,
                            padding: EdgeInsets.all(20.h),
                            child: CustomImageView(
                              imagePath: ImageConstant.imgGroup122,
                            ),
                          ),
                          Spacer(
                            flex: 49,
                          ),
                          CustomIconButton(
                            height: 67.adaptSize,
                            width: 67.adaptSize,
                            padding: EdgeInsets.all(20.h),
                            child: CustomImageView(
                              imagePath: ImageConstant.imgFrame,
                            ),
                          ),
                          Spacer(
                            flex: 50,
                          ),
                          CustomIconButton(
                            height: 67.adaptSize,
                            width: 67.adaptSize,
                            padding: EdgeInsets.all(18.h),
                            child: CustomImageView(
                              imagePath: ImageConstant.imgFrameGray60001,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 58.v),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 1.v),
                            child: Text(
                              "msg_don_t_have_any_account".tr,
                              style: CustomTextStyles.bodyMediumGray600,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 13.h),
                            child: Text(
                              "lbl_sign_up".tr,
                              style: CustomTextStyles.titleSmallPrimaryBold,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 5.v)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: double.maxFinite,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgGroup1,
        margin: EdgeInsets.fromLTRB(18.h, 16.v, 348.h, 16.v),
      ),
    );
  }

  /// Section Widget
  Widget _buildStackLogoLight(BuildContext context) {
    return SizedBox(
      height: 254.v,
      width: 354.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgLogoLight,
            height: 163.v,
            width: 284.h,
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 39.v),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BlocSelector<SignInBloc, SignInState, TextEditingController?>(
                  selector: (state) => state.passwordController,
                  builder: (context, passwordController) {
                    return CustomTextFormField(
                      controller: passwordController,
                      hintText: "lbl_password".tr,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value == null ||
                            (!isValidPassword(value, isRequired: true))) {
                          return "err_msg_please_enter_valid_password".tr;
                        }
                        return null;
                      },
                      obscureText: true,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 24.h,
                        vertical: 27.v,
                      ),
                    );
                  },
                ),
                SizedBox(height: 23.v),
                Text(
                  "msg_forgot_password".tr,
                  style: CustomTextStyles.titleSmallPrimary,
                ),
                SizedBox(height: 73.v),
                CustomElevatedButton(
                  text: "lbl_sign_in".tr,
                  buttonStyle: CustomButtonStyles.none,
                  decoration: CustomButtonStyles
                      .gradientPrimaryToSecondaryContainerDecoration,
                  buttonTextStyle:
                      CustomTextStyles.titleMediumOnPrimaryContainerSemiBold,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
