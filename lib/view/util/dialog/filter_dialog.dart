import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart';
import 'package:dotted_border/dotted_border.dart';

class DateRangeDialog extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onOk;

  const DateRangeDialog({
    super.key,
    required this.onCancel,
    required this.onOk,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: Padding(
        padding:  EdgeInsets.all(12.r),
        child: DottedBorder(
          //color: Colors.black,
        //  strokeWidth: 1,
         // borderType: BorderType.RRect,
         // radius: const Radius.circular(10),
          //dashPattern: const [6, 3], // 6px line, 3px space
          child: Container(
            padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Headers DD MM YY
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:  [
                    10.w.sw ,
                    Text("DD", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                    10.w.sw ,
                    Text("MM", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                    10.w.sw ,
                    Text("YY", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                  ],
                ),
                 SizedBox(height: 12.h),

                // From row
                Row(
                  children: [
                    const Text("From"),
                     SizedBox(width: 16.w),
                    Expanded(child: _dateField("3")), // Day
                     SizedBox(width: 8.w),
                    Expanded(child: _dateField("9")), // Month
                     SizedBox(width: 8.w),
                    Expanded(child: _dateField("2025")), // Year
                  ],
                ),
                 SizedBox(height: 16.h),

                // To row
                Row(
                  children: [
                    const Text("To"),
                     SizedBox(width: 32.w),
                    Expanded(child: _dateField("4")), // Day
                     SizedBox(width: 8.w),
                    Expanded(child: _dateField("9")), // Month
                     SizedBox(width: 8.w),
                    Expanded(child: _dateField("2025")), // Year
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
    );
  }

  // Reusable field widget
  static Widget _dateField(String initial) {
    return TextField(
      controller: TextEditingController(text: initial),
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      inputFormatters: [
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
        // Add your filter logic here
      },
    ),
  );
}
