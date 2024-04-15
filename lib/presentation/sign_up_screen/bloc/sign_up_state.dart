part of 'sign_up_bloc.dart';

/// Represents the state of SignUp in the application.

// ignore_for_file: must_be_immutable
class SignUpState extends Equatable {
  SignUpState(
      {this.rowFirstNameController,
      this.rowLastNameController,
      this.emailController,
      this.passwordController,
      this.confirmPasswordController,
      this.signUpModelObj});

  TextEditingController? rowFirstNameController;

  TextEditingController? rowLastNameController;

  TextEditingController? emailController;

  TextEditingController? passwordController;

  TextEditingController? confirmPasswordController;

  SignUpModel? signUpModelObj;

  @override
  List<Object?> get props => [
        rowFirstNameController,
        rowLastNameController,
        emailController,
        passwordController,
        confirmPasswordController,
        signUpModelObj
      ];
  SignUpState copyWith({
    TextEditingController? rowFirstNameController,
    TextEditingController? rowLastNameController,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    TextEditingController? confirmPasswordController,
    SignUpModel? signUpModelObj,
  }) {
    return SignUpState(
      rowFirstNameController:
          rowFirstNameController ?? this.rowFirstNameController,
      rowLastNameController:
          rowLastNameController ?? this.rowLastNameController,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      confirmPasswordController:
          confirmPasswordController ?? this.confirmPasswordController,
      signUpModelObj: signUpModelObj ?? this.signUpModelObj,
    );
  }
}
