class PendingShipment {
  final int id;
  //final String mobile_no;
  final int paymentMethodId;
  final int toCityId;
  final int spStatusId;
  final int toCityAreaId;
  final String spAwbNumber;
  final String toAddress;
  final String to_mobile;
  final Status status;
  final PaymentMethod paymentMethod;
  final City city;
  final CityArea cityArea;

  PendingShipment({
    required this.id,
    required this.paymentMethodId,
    required this.toCityId,
    required this.spStatusId,
    required this.toCityAreaId,
    required this.spAwbNumber,
    required this.toAddress,
    required this.to_mobile,
    required this.status,
    required this.paymentMethod,
    required this.city,
    required this.cityArea,
  });

  factory PendingShipment.fromJson(Map<String, dynamic> json) {
    return PendingShipment(
      id: json['id'] ?? 0,
      paymentMethodId: json['payment_method_id'] ?? 0,
      toCityId: json['to_city_id'] ?? 0,
      spStatusId: json['sp_status_id'] ?? 0,
      toCityAreaId: json['to_city_area_id'] ?? 0,
      spAwbNumber: json['sp_awb_number'] ?? '',
      toAddress: json['to_address'] ?? '',
      to_mobile: json['to_mobile'] ?? '',
      status: Status.fromJson(json['status'] ?? {}),
      paymentMethod: PaymentMethod.fromJson(json['payment_method'] ?? {}),
      city: City.fromJson(json['city'] ?? {}),
      cityArea: CityArea.fromJson(json['city_area'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'payment_method_id': paymentMethodId,
      'to_city_id': toCityId,
      'sp_status_id': spStatusId,
      'to_city_area_id': toCityAreaId,
      'sp_awb_number': spAwbNumber,
      'to_address': toAddress,
      'to_mobile': to_mobile,
      'status': status.toJson(),
      'payment_method': paymentMethod.toJson(),
      'city': city.toJson(),
      'city_area': cityArea.toJson(),
    };
  }

  /// Helper to parse list of shipments
  static List<PendingShipment> listFromJson(List<dynamic> json) {
    return json.map((e) => PendingShipment.fromJson(e)).toList();
  }
}

class Status {
  final int id;
  final String name;

  Status({required this.id, required this.name});

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
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
      name: json['name'] ?? '',
      code: json['code'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'code': code};
  }
}

class City {
  final int id;
  final String name;

  City({required this.id, required this.name});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}

class CityArea {
  final int id;
  final String name;

  CityArea({required this.id, required this.name});

  factory CityArea.fromJson(Map<String, dynamic> json) {
    return CityArea(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
