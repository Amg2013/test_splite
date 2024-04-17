/// This class is used in the [userprofile2_item_widget] screen.

// ignore_for_file: must_be_immutable
class Userprofile2ItemModel {
  Userprofile2ItemModel(
      {this.age,
      this.month,
      this.donationType,
      this.donationDate,
      this.donationAmount,
      this.id}) {
    age = age ?? "25";
    month = month ?? "JAN";
    donationType = donationType ?? "Monthly Donation";
    donationDate = donationDate ?? "26 Jan 2023 at 3:00 PM";
    donationAmount = donationAmount ?? "\$587.00";
    id = id ?? "";
  }

  String? age;

  String? month;

  String? donationType;

  String? donationDate;

  String? donationAmount;

  String? id;
}
