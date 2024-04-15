import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/profile_model.dart';
import '../models/userprofile2_item_model.dart';
part 'profile_event.dart';
part 'profile_state.dart';

/// A bloc that manages the state of a Profile according to the event that is dispatched to it.
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(ProfileState initialState) : super(initialState) {
    on<ProfileInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ProfileInitialEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(
        profileModelObj: state.profileModelObj?.copyWith(
      userprofile2ItemList: fillUserprofile2ItemList(),
    )));
  }

  List<Userprofile2ItemModel> fillUserprofile2ItemList() {
    return [
      Userprofile2ItemModel(
          age: "25",
          month: "JAN",
          donationType: "Monthly Donation",
          donationDate: "26 Jan 2023 at 3:00 PM",
          donationAmount: "\$587.00"),
      Userprofile2ItemModel(
          age: "02",
          month: "MAR",
          donationType: "Islamic Zakat",
          donationDate: "26 Jan 2023 at 3:00 PM",
          donationAmount: "\$14,000.00"),
      Userprofile2ItemModel(
          age: "20",
          month: "APR",
          donationType: "Monthly Donation",
          donationDate: "26 Jan 2023 at 3:00 PM",
          donationAmount: "\$587.00")
    ];
  }
}
