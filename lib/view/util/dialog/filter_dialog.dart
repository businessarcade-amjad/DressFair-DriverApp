import 'package:dressfair_driver_app/controller/pending_task_controller.dart';
import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart';
import 'package:dotted_border/dotted_border.dart';

class DateRangeDialog extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onOk;

   DateRangeDialog({
    super.key,
    required this.onCancel,
    required this.onOk,
  });

  PendingTaskController controller=PendingTaskController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical:12.h,horizontal: 12.w),
        child: DottedBorder(
          child: Container(
            padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
            child: Obx(
              ()=>
                  Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Headers DD MM YY
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:  [
                      15.w.sw ,
                      Text("DD", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                      12.w.sw ,
                      Text("MM", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                      12.w.sw ,
                      Text("YY", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                    ],
                  ),
                   SizedBox(height: 12.h),

                  // From row
                  Row(
                    children: [
                      const Text("From"),
                       SizedBox(width: 16.w),
                      Expanded(child: _dateField(controller.dayFrom.value)),
                       SizedBox(width: 8.w),
                      Expanded(child: _dateField(controller.monthFrom.value)),
                       SizedBox(width: 8.w),
                      Expanded(child: _dateField(controller.yearFrom.value)),
                    ],
                  ),
                   SizedBox(height: 16.h),
                  // To row
                  Row(
                    children: [
                      const Text("To"),
                       SizedBox(width: 32.w),
                      Expanded(child: _dateField(controller.dayTo.value)),
                       SizedBox(width: 8.w),
                      Expanded(child: _dateField(controller.monthTo.value)),
                       SizedBox(width: 8.w),
                      Expanded(child: _dateField(controller.yearTo.value)),
                    ],
                  ),
                   SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      TextButton(
                        onPressed: onCancel,
                        child: const Text("Cancel",style:TextStyle(color: Colors.black)),
                      ),
                      TextButton(
                        onPressed: onOk,
                        child: const Text("OK",style:TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Reusable field widget
  static Widget _dateField(TextEditingController cont) {
    return TextField(
      controller: cont,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      inputFormatters:[
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration:  InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 8.h),
        border: UnderlineInputBorder(),
      ),
    );
  }
}

// Show dialog anywhere
void showDateRangeDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => DateRangeDialog(
      onCancel: () => Navigator.pop(context),
      onOk: () {
        Navigator.pop(context);
      },
    ),
  );
}
