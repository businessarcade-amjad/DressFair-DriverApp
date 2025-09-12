import 'package:get/get_rx/src/rx_types/rx_types.dart';

class PendingShipment {
  int? id;
  int? tenantId;
  int? paymentMethodId;
  int? toCityId;
  int? spStatusId;
  int? toCityAreaId;
  String? spAwbNumber;
  String? toAddress;
  String? toMobile;
  String? toAlternateMobile;
  String? contents;
  String? amount;
  final String deliveryLat; // map_latitude
  final String deliveryLng; // map_longitude
  Status? status;
  PaymentMethod? paymentMethod;
  City? city;
  CityArea? cityArea;
  Currency? currency;

  String? deliveryDate;

  /// ✅ Local field only (not part of API JSON)
  RxBool isSelected;
  double? distanceKm;

  PendingShipment({
    this.id,
    this.tenantId,
    this.paymentMethodId,
    this.toCityId,
    this.spStatusId,
    this.toCityAreaId,
    this.spAwbNumber,
    this.toAddress,
    this.toMobile,
    this.toAlternateMobile,
    this.contents,
    this.amount,
    required this.deliveryLat,
    required this.deliveryLng,
    this.status,
    this.paymentMethod,
    this.city,
    this.cityArea,
    this.currency,
    this.deliveryDate,
    RxBool? isSelected,
    this.distanceKm, // 👈 allow injection
  }) : isSelected = isSelected ?? false.obs;

  PendingShipment.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      tenantId = json['tenant_id'],
      paymentMethodId = json['payment_method_id'],
      toCityId = json['to_city_id'],
      spStatusId = json['sp_status_id'],
      toCityAreaId = json['to_city_area_id'],
      spAwbNumber = json['sp_awb_number'],
      toAddress = json['to_address'],
      toMobile = json['to_mobile'],
      toAlternateMobile = json['to_alternate_mobile'],
      contents = json['contents'],
      amount = json['amount'],
      deliveryLat = json['map_latitude']?.toString() ?? "",
      deliveryLng = json['map_longitude']?.toString() ?? "",

      status = json['status'] != null ? Status.fromJson(json['status']) : null,
      paymentMethod = json['payment_method'] != null
          ? PaymentMethod.fromJson(json['payment_method'])
          : null,
      city = json['city'] != null ? City.fromJson(json['city']) : null,
      cityArea = json['city_area'] != null
          ? CityArea.fromJson(json['city_area'])
          : null,
      currency = json['currency'] != null
          ? Currency.fromJson(json['currency'])
          : null,
      deliveryDate = json['delivery_date'],
      // ✅ always default false from API
      isSelected = false.obs;

  static List<PendingShipment> listFromJson(dynamic json) {
    if (json == null) return [];
    if (json is List) {
      return json
          .map((e) => PendingShipment.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    }
    throw ArgumentError('Invalid JSON passed to PendingShipment.listFromJson');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['id'] = id;
    map['tenant_id'] = tenantId;
    map['payment_method_id'] = paymentMethodId;
    map['to_city_id'] = toCityId;
    map['sp_status_id'] = spStatusId;
    map['to_city_area_id'] = toCityAreaId;
    map['sp_awb_number'] = spAwbNumber;
    map['to_address'] = toAddress;
    map['to_mobile'] = toMobile;
    map['to_alternate_mobile'] = toAlternateMobile;
    map['contents'] = contents;
    map['amount'] = amount;
    map['map_latitude'] = deliveryLat?.toString() ?? "";
    map['map_longitude'] = deliveryLng?.toString() ?? "";
    if (status != null) map['status'] = status!.toJson();
    if (paymentMethod != null) map['payment_method'] = paymentMethod!.toJson();
    if (city != null) map['city'] = city!.toJson();
    if (cityArea != null) map['city_area'] = cityArea!.toJson();
    if (currency != null) map['currency'] = currency!.toJson();
    map['delivery_date'] = deliveryDate;

    // ❌ do not include isSelected (local only)
    return map;
  }
}

class Status {
  int? id;
  String? name;

  Status({this.id, this.name});

  Status.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      name = json['name'];

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}

class PaymentMethod {
  int? id;
  String? name;
  String? code;

  PaymentMethod({this.id, this.name, this.code});

  PaymentMethod.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      name = json['name'],
      code = json['code'];

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'code': code};
}

class City {
  int? id;
  String? name;

  City({this.id, this.name});

  City.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      name = json['name'];

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}

class CityArea {
  int? id;
  String? name;

  CityArea({this.id, this.name});

  CityArea.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      name = json['name'];

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}

class Currency {
  String? code;
  int? laravelThroughKey;

  Currency({this.code, this.laravelThroughKey});

  Currency.fromJson(Map<String, dynamic> json)
    : code = json['code'],
      laravelThroughKey = json['laravel_through_key'];

  Map<String, dynamic> toJson() => {
    'code': code,
    'laravel_through_key': laravelThroughKey,
  };
}
