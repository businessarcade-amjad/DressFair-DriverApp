class ShowOfdsModel {
  final int id;
  final int tenantId;
  final int paymentMethodId;
  final int toCityId;
  final int spStatusId;
  final int toCityAreaId;
  final String spAwbNumber;
  final String toAddress;
  final String toMobile;
  final String? toAlternateMobile;
  final String contents;
  final String amount;
  final String deliveryLat; // map_latitude
  final String deliveryLng; // map_longitude
  final Status? status;
  final PaymentMethod? paymentMethod;
  final City? city;
  final CityArea? cityArea;
  final Currency? currency;

  double? distanceKm; // 👈 Added for live distance

  ShowOfdsModel({
    required this.id,
    required this.tenantId,
    required this.paymentMethodId,
    required this.toCityId,
    required this.spStatusId,
    required this.toCityAreaId,
    required this.spAwbNumber,
    required this.toAddress,
    required this.toMobile,
    this.toAlternateMobile,
    required this.contents,
    required this.amount,
    required this.deliveryLat,
    required this.deliveryLng,
    this.status,
    this.paymentMethod,
    this.city,
    this.cityArea,
    this.currency,
    this.distanceKm,
  });

  factory ShowOfdsModel.fromJson(Map<String, dynamic> json) {
    return ShowOfdsModel(
      id: json['id'] ?? 0,
      tenantId: json['tenant_id'] ?? 0,
      paymentMethodId: json['payment_method_id'] ?? 0,
      toCityId: json['to_city_id'] ?? 0,
      spStatusId: json['sp_status_id'] ?? 0,
      toCityAreaId: json['to_city_area_id'] ?? 0,
      spAwbNumber: json['sp_awb_number'] ?? "",
      toAddress: json['to_address'] ?? "",
      toMobile: json['to_mobile'] ?? "",
      toAlternateMobile: json['to_alternate_mobile'],
      contents: json['contents'] ?? "",
      amount: json['amount'] ?? "",
      deliveryLat: json['map_latitude']?.toString() ?? "",
      deliveryLng: json['map_longitude']?.toString() ?? "",
      status: json['status'] != null ? Status.fromJson(json['status']) : null,
      paymentMethod: json['payment_method'] != null
          ? PaymentMethod.fromJson(json['payment_method'])
          : null,
      city: json['city'] != null ? City.fromJson(json['city']) : null,
      cityArea: json['city_area'] != null
          ? CityArea.fromJson(json['city_area'])
          : null,
      currency: json['currency'] != null
          ? Currency.fromJson(json['currency'])
          : null,
    );
  }
}

class Status {
  final int id;
  final String name;

  Status({required this.id, required this.name});

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(id: json['id'] ?? 0, name: json['name'] ?? "");
  }
}

class PaymentMethod {
  final int id;
  final String name;
  final String code;

  PaymentMethod({required this.id, required this.name, required this.code});

  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return PaymentMethod(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      code: json['code'] ?? "",
    );
  }
}

class City {
  final int id;
  final String name;

  City({required this.id, required this.name});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(id: json['id'] ?? 0, name: json['name'] ?? "");
  }
}

class CityArea {
  final int id;
  final String name;

  CityArea({required this.id, required this.name});

  factory CityArea.fromJson(Map<String, dynamic> json) {
    return CityArea(id: json['id'] ?? 0, name: json['name'] ?? "");
  }
}

class Currency {
  final String code;
  final int laravelThroughKey;

  Currency({required this.code, required this.laravelThroughKey});

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      code: json['code'] ?? "",
      laravelThroughKey: json['laravel_through_key'] ?? 0,
    );
  }
}
