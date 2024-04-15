/// This class is used in the [userprofile1_item_widget] screen.

// ignore_for_file: must_be_immutable
class Userprofile1ItemModel {
  Userprofile1ItemModel({this.title, this.date, this.id}) {
    title = title ?? "Eid -ul-Fitr 2023";
    date = date ?? "26 Jan 2023";
    id = id ?? "";
  }

  String? title;

  String? date;

  String? id;
}
