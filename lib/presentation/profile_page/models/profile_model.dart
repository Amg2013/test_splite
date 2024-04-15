import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'userprofile2_item_model.dart';

/// This class defines the variables used in the [profile_page],
/// and is typically used to hold data that is passed between different parts of the application.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ProfileModel extends Equatable {
  ProfileModel({this.userprofile2ItemList = const []});

  List<Userprofile2ItemModel> userprofile2ItemList;

  ProfileModel copyWith({List<Userprofile2ItemModel>? userprofile2ItemList}) {
    return ProfileModel(
      userprofile2ItemList: userprofile2ItemList ?? this.userprofile2ItemList,
    );
  }

  @override
  List<Object?> get props => [userprofile2ItemList];
}
