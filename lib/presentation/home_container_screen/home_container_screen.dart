import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../home_page/home_page.dart';
import '../profile_page/profile_page.dart';
import 'bloc/home_container_bloc.dart';
import 'models/home_container_model.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class HomeContainerScreen extends StatelessWidget {
  HomeContainerScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<HomeContainerBloc>(
      create: (context) => HomeContainerBloc(HomeContainerState(
        homeContainerModelObj: HomeContainerModel(),
      ))
        ..add(HomeContainerInitialEvent()),
      child: HomeContainerScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeContainerBloc, HomeContainerState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Navigator(
              key: navigatorKey,
              initialRoute: AppRoutes.homePage,
              onGenerateRoute: (routeSetting) => PageRouteBuilder(
                pageBuilder: (ctx, ani, ani1) =>
                    getCurrentPage(context, routeSetting.name!),
                transitionDuration: Duration(seconds: 0),
              ),
            ),
            bottomNavigationBar: _buildBottombar(context),
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildBottombar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homePage;
      case BottomBarEnum.Donate:
        return "/";
      case BottomBarEnum.Profile:
        return AppRoutes.profilePage;
      case BottomBarEnum.More:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.homePage:
        return HomePage.builder(context);
      case AppRoutes.profilePage:
        return ProfilePage.builder(context);
      default:
        return DefaultWidget();
    }
  }
}
