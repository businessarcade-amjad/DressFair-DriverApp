import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart';

class DeliverySignScreen extends StatefulWidget {
  const DeliverySignScreen({super.key});

  @override
  State<DeliverySignScreen> createState() => _DeliverySignScreenState();
}

class _DeliverySignScreenState extends State<DeliverySignScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(""),
      )
    );
  }
}
