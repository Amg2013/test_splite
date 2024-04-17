import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/app_export.dart';
import 'bloc/home_bloc.dart';
import 'models/home_model.dart';
import 'models/userprofile1_item_model.dart';
import 'models/userprofile_item_model.dart';
import 'widgets/userprofile1_item_widget.dart';
import 'widgets/userprofile_item_widget.dart'; // ignore_for_file: must_be_immutable

class HomePage extends StatelessWidget {
  const HomePage({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(HomeState(
        homeModelObj: HomeModel(),
      ))
        ..add(HomeInitialEvent()),
      child: HomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          height: 795.3.v,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SingleChildScrollView(
                      child: SizedBox(
                        height: 879.v,
                        width: double.maxFinite,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgCaptureDECran,
                                    height: 208.v,
                                    width: 388.h,
                                  ),
                                  SizedBox(height: 16.v),
                                  SizedBox(
                                    height: 615.v,
                                    width: double.maxFinite,
                                    child: Stack(
                                      alignment: Alignment.topLeft,
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            height: 615.v,
                                            width: double.maxFinite,
                                            decoration: BoxDecoration(
                                              color: theme.colorScheme
                                                  .onPrimaryContainer
                                                  .withOpacity(1),
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                top: Radius.circular(34.h),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(
                                            height: 78.v,
                                            width: 74.h,
                                            margin: EdgeInsets.only(
                                              left: 128.h,
                                              top: 23.v,
                                            ),
                                            decoration: BoxDecoration(
                                              color: appTheme.cyanA100,
                                              borderRadius:
                                                  BorderRadius.circular(
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
                                          margin: EdgeInsets.only(top: 62.v),
                                        ),
                                        Align(
                                          alignment: Alignment.topCenter,
                                          child: Opacity(
                                            opacity: 0.7,
                                            child: Container(
                                              width: 351.h,
                                              margin:
                                                  EdgeInsets.only(top: 55.v),
                                              child: Text(
                                                "msg_lorem_ipsum_dolor".tr,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: CustomTextStyles
                                                    .bodyMediumErrorContainer
                                                    .copyWith(
                                                  height: 1.54,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              left: 18.h,
                                              top: 20.v,
                                            ),
                                            child: Text(
                                              "lbl_most_recent".tr,
                                              style:
                                                  theme.textTheme.titleMedium,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              top: 23.v,
                                              right: 18.h,
                                            ),
                                            child: Text(
                                              "lbl_view_all".tr,
                                              style: CustomTextStyles
                                                  .titleSmallBlue600Medium,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topCenter,
                                          child: Container(
                                            height: 4.v,
                                            margin: EdgeInsets.only(top: 287.v),
                                            child: AnimatedSmoothIndicator(
                                              activeIndex: 0,
                                              count: 5,
                                              effect: ScrollingDotsEffect(
                                                spacing: 6,
                                                activeDotColor:
                                                    appTheme.blue600,
                                                dotColor: appTheme.blueGray100,
                                                dotHeight: 4.v,
                                                dotWidth: 4.h,
                                              ),
                                            ),
                                          ),
                                        ),
                                        _buildUserProfile(context),
                                        _buildNewsEvents(context)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: SizedBox(
                                height: SizeUtils.height,
                                width: double.maxFinite,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgGroup2,
                height: 844.v,
                width: 390.h,
                alignment: Alignment.topCenter,
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 106.v),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return CarouselSlider.builder(
            options: CarouselOptions(
              height: 165.v,
              initialPage: 0,
              autoPlay: true,
              viewportFraction: 1.0,
              enableInfiniteScroll: false,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                state.sliderIndex = index;
              },
            ),
            itemCount: state.homeModelObj?.userprofileItemList.length ?? 0,
            itemBuilder: (context, index, realIndex) {
              UserprofileItemModel model =
                  state.homeModelObj?.userprofileItemList[index] ??
                      UserprofileItemModel();
              return UserprofileItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildNewsEvents(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(
          left: 18.h,
          bottom: 105.v,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 18.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "lbl_news_events".tr,
                    style: theme.textTheme.titleMedium,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 2.v,
                      bottom: 3.v,
                    ),
                    child: Text(
                      "lbl_view_all".tr,
                      style: CustomTextStyles.titleSmallBlue600Medium,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 14.v),
            SizedBox(
              height: 163.v,
              child: BlocSelector<HomeBloc, HomeState, HomeModel?>(
                selector: (state) => state.homeModelObj,
                builder: (context, homeModelObj) {
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 15.h,
                      );
                    },
                    itemCount: homeModelObj?.userprofile1ItemList.length ?? 0,
                    itemBuilder: (context, index) {
                      Userprofile1ItemModel model =
                          homeModelObj?.userprofile1ItemList[index] ??
                              Userprofile1ItemModel();
                      return Userprofile1ItemWidget(
                        model,
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
