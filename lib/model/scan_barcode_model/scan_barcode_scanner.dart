

class ScanBarcodeScannerModel {
  final int? id;
  final int? paymentMethodId;
  final int? toCityId;
  final int? spStatusId;
  final int? toCityAreaId;
  final String? spAwbNumber;
  final String? toAddress;
  final ShipmentStatus? status;
  final PaymentMethod? paymentMethod;
  final City? city;
  final City? cityArea;

  ScanBarcodeScannerModel({
    this.id,
    this.paymentMethodId,
    this.toCityId,
    this.spStatusId,
    this.toCityAreaId,
    this.spAwbNumber,
    this.toAddress,
    this.status,
    this.paymentMethod,
    this.city,
    this.cityArea,
  });

  factory ScanBarcodeScannerModel.fromJson(Map<String, dynamic> json) {
    return ScanBarcodeScannerModel(
      id: json['id'],
      paymentMethodId: json['payment_method_id'],
      toCityId: json['to_city_id'],
      spStatusId: json['sp_status_id'],
      toCityAreaId: json['to_city_area_id'],
      spAwbNumber: json['sp_awb_number'],
      toAddress: json['to_address'],
      status: json['status'] != null ? ShipmentStatus.fromJson(json['status']) : null,
      paymentMethod: json['payment_method'] != null ? PaymentMethod.fromJson(json['payment_method']) : null,
      city: json['city'] != null ? City.fromJson(json['city']) : null,
      cityArea: json['city_area'] != null ? City.fromJson(json['city_area']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "payment_method_id": paymentMethodId,
      "to_city_id": toCityId,
      "sp_status_id": spStatusId,
      "to_city_area_id": toCityAreaId,
      "sp_awb_number": spAwbNumber,
      "to_address": toAddress,
      "status": status?.toJson(),
      "payment_method": paymentMethod?.toJson(),
      "city": city?.toJson(),
      "city_area": cityArea?.toJson(),
    };
  }
}

class ShipmentStatus {
  final int? id;
  final String? name;

  ShipmentStatus({this.id, this.name});

  factory ShipmentStatus.fromJson(Map<String, dynamic> json) {
    return ShipmentStatus(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
    };
  }
}

class PaymentMethod {
  final int? id;
  final String? name;
  final String? code;

  PaymentMethod({this.id, this.name, this.code});

  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return PaymentMethod(
      id: json['id'],
      name: json['name'],
      code: json['code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "code": code,
    };
  }
}

class City {
  final int? id;
  final String? name;

  City({this.id, this.name});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
    };
  }
}
