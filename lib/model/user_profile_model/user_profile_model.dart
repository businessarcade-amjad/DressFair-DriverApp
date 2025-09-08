class Profile {
  int? shipping_provider_id;
  String? name;
  String? mobile_number;


  Profile(
      {this.shipping_provider_id,
      this.name,
      this.mobile_number,

      });
  Profile.fromJson(Map<String, dynamic> json) {
    shipping_provider_id = json['shipping_provider_id'];
    name = json['name'];
    mobile_number = json['mobile_number'];

  }
  Map<String, dynamic> toJson() {
    return {
      "shipping_provider_id": shipping_provider_id,
      "name": name,
      "mobile_number": mobile_number,
    };
  }
}
