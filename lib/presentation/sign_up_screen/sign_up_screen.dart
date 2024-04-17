import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'bloc/sign_up_bloc.dart';
import 'models/sign_up_model.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<SignUpBloc>(
      create: (context) => SignUpBloc(SignUpState(
        signUpModelObj: SignUpModel(),
      ))
        ..add(SignUpInitialEvent()),
      child: SignUpScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
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
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 4.v),
              child: Container(
                height: 784.v,
                width: 354.h,
                margin: EdgeInsets.only(
                  left: 18.h,
                  right: 18.h,
                  bottom: 5.v,
                ),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: 78.v,
                        width: 74.h,
                        margin: EdgeInsets.only(
                          left: 110.h,
                          top: 188.v,
                        ),
                        decoration: BoxDecoration(
                          color: appTheme.cyanA100,
                          borderRadius: BorderRadius.circular(
                            37.h,
                          ),
                        ),
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgLogoLight,
                      height: 163.v,
                      width: 284.h,
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.only(top: 227.v),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        decoration: AppDecoration.fillOnPrimaryContainer2,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "lbl_sign_up2".tr,
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
                            _buildRowfirstname(context),
                            SizedBox(height: 16.v),
                            _buildEmail(context),
                            SizedBox(height: 16.v),
                            _buildPassword(context),
                            SizedBox(height: 16.v),
                            _buildConfirmPassword(context),
                            SizedBox(height: 58.v),
                            _buildSignIn(context),
                            SizedBox(height: 57.v),
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
                                      imagePath:
                                          ImageConstant.imgFrameGray60001,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 62.v),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 34.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 1.v),
                                    child: Text(
                                      "msg_already_have_an".tr,
                                      style: CustomTextStyles.bodyMediumGray600,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.h),
                                    child: Text(
                                      "lbl_sign_in2".tr,
                                      style: CustomTextStyles
                                          .titleSmallPrimaryBold,
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
  Widget _buildRowFirstName(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: 7.h),
        child: BlocSelector<SignUpBloc, SignUpState, TextEditingController?>(
          selector: (state) => state.rowFirstNameController,
          builder: (context, rowFirstNameController) {
            return CustomTextFormField(
              controller: rowFirstNameController,
              hintText: "lbl_first_name".tr,
              validator: (value) {
                if (!isText(value)) {
                  return "err_msg_please_enter_valid_text".tr;
                }
                return null;
              },
            );
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildRowLastName(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 7.h),
        child: BlocSelector<SignUpBloc, SignUpState, TextEditingController?>(
          selector: (state) => state.rowLastNameController,
          builder: (context, rowLastNameController) {
            return CustomTextFormField(
              controller: rowLastNameController,
              hintText: "lbl_last_name".tr,
              validator: (value) {
                if (!isText(value)) {
                  return "err_msg_please_enter_valid_text".tr;
                }
                return null;
              },
            );
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildRowfirstname(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [_buildRowFirstName(context), _buildRowLastName(context)],
    );
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return BlocSelector<SignUpBloc, SignUpState, TextEditingController?>(
      selector: (state) => state.emailController,
      builder: (context, emailController) {
        return CustomTextFormField(
          controller: emailController,
          hintText: "lbl_email_address".tr,
          textInputType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || (!isValidEmail(value, isRequired: true))) {
              return "err_msg_please_enter_valid_email".tr;
            }
            return null;
          },
        );
      },
    );
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return BlocSelector<SignUpBloc, SignUpState, TextEditingController?>(
      selector: (state) => state.passwordController,
      builder: (context, passwordController) {
        return CustomTextFormField(
          controller: passwordController,
          hintText: "lbl_password".tr,
          textInputType: TextInputType.visiblePassword,
          validator: (value) {
            if (value == null || (!isValidPassword(value, isRequired: true))) {
              return "err_msg_please_enter_valid_password".tr;
            }
            return null;
          },
          obscureText: true,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildConfirmPassword(BuildContext context) {
    return BlocSelector<SignUpBloc, SignUpState, TextEditingController?>(
      selector: (state) => state.confirmPasswordController,
      builder: (context, confirmPasswordController) {
        return CustomTextFormField(
          controller: confirmPasswordController,
          hintText: "msg_confirm_password".tr,
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          validator: (value) {
            if (value == null || (!isValidPassword(value, isRequired: true))) {
              return "err_msg_please_enter_valid_password".tr;
            }
            return null;
          },
          obscureText: true,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildSignIn(BuildContext context) {
    return CustomElevatedButton(
      text: "lbl_sign_in".tr,
      buttonStyle: CustomButtonStyles.none,
      decoration:
          CustomButtonStyles.gradientPrimaryToSecondaryContainerDecoration,
      buttonTextStyle: CustomTextStyles.titleMediumOnPrimaryContainerSemiBold,
    );
  }
}
