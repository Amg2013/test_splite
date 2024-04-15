import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'bloc/forgot_password_bloc.dart';
import 'models/forgot_password_model.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<ForgotPasswordBloc>(
      create: (context) => ForgotPasswordBloc(ForgotPasswordState(
        forgotPasswordModelObj: ForgotPasswordModel(),
      ))
        ..add(ForgotPasswordInitialEvent()),
      child: ForgotPasswordScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 5.v),
            child: _buildStackView(context),
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
  Widget _buildStackView(BuildContext context) {
    return Container(
      height: 389.v,
      width: 354.h,
      margin: EdgeInsets.only(
        left: 18.h,
        right: 18.h,
        bottom: 5.v,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            ImageConstant.imgSignIn,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 78.v,
              width: 74.h,
              margin: EdgeInsets.only(
                left: 110.h,
                bottom: 124.v,
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
            alignment: Alignment.bottomCenter,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: AppDecoration.fillOnPrimaryContainer2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "lbl_forgot_password".tr,
                    style: theme.textTheme.headlineLarge,
                  ),
                  SizedBox(height: 10.v),
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
                  SizedBox(height: 102.v),
                  BlocSelector<ForgotPasswordBloc, ForgotPasswordState,
                      TextEditingController?>(
                    selector: (state) => state.emailController,
                    builder: (context, emailController) {
                      return CustomTextFormField(
                        controller: emailController,
                        hintText: "lbl_email_address".tr,
                        textInputAction: TextInputAction.done,
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
                  SizedBox(height: 50.v),
                  CustomElevatedButton(
                    text: "msg_send_reset_email".tr,
                    buttonStyle: CustomButtonStyles.none,
                    decoration: CustomButtonStyles
                        .gradientPrimaryToSecondaryContainerDecoration,
                    buttonTextStyle:
                        CustomTextStyles.titleMediumOnPrimaryContainerSemiBold,
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
