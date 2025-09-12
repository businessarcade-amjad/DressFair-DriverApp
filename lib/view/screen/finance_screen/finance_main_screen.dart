import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart';

class FinanceMainScreen extends StatefulWidget {
  const FinanceMainScreen({super.key});

  @override
  State<FinanceMainScreen> createState() => _FinanceMainScreenState();
}

class _FinanceMainScreenState extends State<FinanceMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: reuseAbleAppBar(title: "Finance Screen"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Center(child: Text("Finance Data Not Found"))],
      ),
    );
  }
}
