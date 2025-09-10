import 'package:get/get.dart';

class DeliveredModel {
  final int id;
  final int tenantId;
  final int paymentMethodId;
  final int? courierVoucherId; // ✅ added with null safety
  final int toCityId;
  final int spStatusId;
  final int toCityAreaId;
  final String spAwbNumber;
  final String toAddress;
  final String toMobile;
  final String? toAlternateMobile;
  final String contents;
  final String amount;
  final Status status;
  final PaymentMethod paymentMethod;
  final City city;
  final CityArea cityArea;
  final Currency currency;

  /// ✅ Local UI field (not in API JSON)
  RxBool isSelected;

  DeliveredModel({
    required this.id,
    required this.tenantId,
    required this.paymentMethodId,
    this.courierVoucherId,
    required this.toCityId,
    required this.spStatusId,
    required this.toCityAreaId,
    required this.spAwbNumber,
    required this.toAddress,
    required this.toMobile,
    this.toAlternateMobile,
    required this.contents,
    required this.amount,
    required this.status,
    required this.paymentMethod,
    required this.city,
    required this.cityArea,
    required this.currency,
    RxBool? isSelected,
  }) : isSelected = isSelected ?? false.obs;

  factory DeliveredModel.fromJson(Map<String, dynamic> json) {
    return DeliveredModel(
      id: json['id'] ?? 0,
      tenantId: json['tenant_id'] ?? 0,
      paymentMethodId: json['payment_method_id'] ?? 0,
      courierVoucherId: json['courier_voucher_id'], // ✅ handled safely
      toCityId: json['to_city_id'] ?? 0,
      spStatusId: json['sp_status_id'] ?? 0,
      toCityAreaId: json['to_city_area_id'] ?? 0,
      spAwbNumber: json['sp_awb_number'] ?? '',
      toAddress: json['to_address'] ?? '',
      toMobile: json['to_mobile'] ?? '',
      toAlternateMobile: json['to_alternate_mobile'],
      contents: json['contents'] ?? '',
      amount: json['amount'] ?? '',
      status: Status.fromJson(json['status'] ?? {}),
      paymentMethod: PaymentMethod.fromJson(json['payment_method'] ?? {}),
      city: City.fromJson(json['city'] ?? {}),
      cityArea: CityArea.fromJson(json['city_area'] ?? {}),
      currency: Currency.fromJson(json['currency'] ?? {}),
      isSelected: false.obs, // ✅ always default false from API
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "tenant_id": tenantId,
      "payment_method_id": paymentMethodId,
      "courier_voucher_id": courierVoucherId,
      "to_city_id": toCityId,
      "sp_status_id": spStatusId,
      "to_city_area_id": toCityAreaId,
      "sp_awb_number": spAwbNumber,
      "to_address": toAddress,
      "to_mobile": toMobile,
      "to_alternate_mobile": toAlternateMobile,
      "contents": contents,
      "amount": amount,
      "status": status.toJson(),
      "payment_method": paymentMethod.toJson(),
      "city": city.toJson(),
      "city_area": cityArea.toJson(),
      "currency": currency.toJson(),
      // ❌ isSelected not included in API payload
    };
  }

  /// ✅ Parse list safely
  static List<DeliveredModel> listFromJson(dynamic json) {
    if (json == null) return [];
    if (json is List) {
      return json
          .map((e) => DeliveredModel.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    }
    throw ArgumentError('Invalid JSON passed to DeliveredModel.listFromJson');
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

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
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

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "code": code,
  };
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

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
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

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class Currency {
  final String code;
  final int laravelThroughKey;

  Currency({required this.code, required this.laravelThroughKey});

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      code: json['code'] ?? '',
      laravelThroughKey: json['laravel_through_key'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "code": code,
    "laravel_through_key": laravelThroughKey,
  };
}
