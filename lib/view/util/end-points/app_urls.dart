class AppUrl {
  static const baseUrl = "https://ecomplug.com/api/shipping/plug/courier/mobile/app";
  static const login = "$baseUrl/authorize";
  static const scanPickUP = "$baseUrl/scan/pickup?sp_awb_number=";
  static const confirmBarCode = "$baseUrl/confirm/scanned/pickup";
  static const pendingShipment = "$baseUrl/pending";

}
