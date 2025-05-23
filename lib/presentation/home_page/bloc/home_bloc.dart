import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/home_model.dart';
import '../models/userprofile1_item_model.dart';
import '../models/userprofile_item_model.dart';
part 'home_event.dart';
part 'home_state.dart';

/// A bloc that manages the state of a Home according to the event that is dispatched to it.
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(initialState) {
    on<HomeInitialEvent>(_onInitialize);
  }

  List<UserprofileItemModel> fillUserprofileItemList() {
    return List.generate(1, (index) => UserprofileItemModel());
  }

  List<Userprofile1ItemModel> fillUserprofile1ItemList() {
    return [
      Userprofile1ItemModel(title: "Eid -ul-Fitr 2023", date: "26 Jan 2023")
    ];
  }

  _onInitialize(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(
      sliderIndex: 0,
    ));
    emit(state.copyWith(
        homeModelObj: state.homeModelObj?.copyWith(
      userprofileItemList: fillUserprofileItemList(),
      userprofile1ItemList: fillUserprofile1ItemList(),
    )));
  }
}
