import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart';

class PendingTaskController extends GetxController{
  RxString selectedFilter = "All Record".obs;
  final RxList<String> filters = <String>[
    "All Record",
    "Today",
    "Yesterday",
    "Last 2 days",
    "Last 3 days",
    "Last week",
    "Last month"
  ].obs;

  Future<void> pendingTask()async{




  }
}