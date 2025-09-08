import 'dart:developer';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class SimpleMethode{
  //For Open Dialer Mobile Tab
  static void openPhone(String phone) async {
  try {
  Uri phoneNo = Uri.parse('tel:$phone');
  if (await canLaunchUrl(phoneNo)) {
  await launchUrl(phoneNo);
  } else {
  log("Cannot Launch Url");
  }
  } catch (e) {
  log("Error =${e.toString()}");
  }
  }
  Future<void> openWhatsApp(String text) async {
    final link = WhatsAppUnilink(
      phoneNumber: '923309189520',
      text: "",
    );
    await launchUrl(Uri.parse(link.toString()), mode: LaunchMode.externalApplication);
  }
}
Future<bool> requestCameraPermission() async {
  var status = await Permission.camera.request();
  return status.isGranted;
}


