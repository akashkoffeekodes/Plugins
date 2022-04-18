import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';


class syncfusionDatepicker extends StatefulWidget {
  const syncfusionDatepicker({Key key}) : super(key: key);

  @override
  _syncfusionDatepickerState createState() => _syncfusionDatepickerState();
}

class _syncfusionDatepickerState extends State<syncfusionDatepicker> {
  String date = "";
  DateTime selectedDate = DateTime.now();
  DateTime datetime = DateTime.now();
//system date
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';







  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
        // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {


    DateTime datetime = DateTime.now();
    print(datetime.toString());
    //output: 2021-10-17 20:04:17.118089

    String datetime1 = DateFormat("yyyy-MM-dd").format(datetime);
    print(datetime1);
    //output: 2021-10-17

    String datetime2 = DateFormat.Hms().format(datetime);
    print(datetime2);
    //output (Time): 20:04:17

    String datetime3 = DateFormat.MMMMEEEEd().format(datetime);
    print(datetime3);
    //output: Sunday, October 17


    // String datetime4 = DateFormat(DateFormat.YEAR_ABBR_MONTH_WEEKDAY_DAY).format(datetime);
    // print(datetime4);
    //output: Sun, Oct 17, 2021

    String year = datetime.year.toString();

    Text("$year",style: TextStyle(color: Colors.red),);
    return Scaffold(
        appBar: AppBar(
          title: const Text('DatePicker demo'),
        ),
        body: Container(
          child: Stack(

            children: <Widget>[
              Positioned(
                left: 0,
                right: 0,
                top: 25,
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Selected date: $_selectedDate'),
                    Text('Selected date count: $_dateCount'),
                    Text('Selected range: $_range'),
                    Text('Selected ranges count: $_rangeCount')
                  ],
                ),
              ),
              Positioned(
                left: 10,
                top: 130,
                right: 10,
                bottom: 200,
                child: SfDateRangePicker(
                  allowViewNavigation: true,
                  showActionButtons: true,
                  showTodayButton: true,
                  onSelectionChanged: _onSelectionChanged,
                  selectionMode: DateRangePickerSelectionMode.range,
                  initialSelectedRange: PickerDateRange(
                      DateTime.now().subtract(const Duration(days: 4)),
                      DateTime.now().add(const Duration(days: 3))),
                ),
              ),


              //second date picker

              Container(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(onPressed: (){
                  _selectDate(context);

                },  child: Text("Choose Date"),
                ),
              ),
              // SizedBox(height: 100,),

              // Container(
              //
              //   alignment: Alignment.bottomRight,
              //   height: 400,
              //   width: 230,
              //   child: Text("${DateFormat(DateFormat.YEAR_ABBR_MONTH_WEEKDAY_DAY).format(datetime)}"),
              // ),

              // DateFormat(DateFormat.YEAR_ABBR_MONTH_WEEKDAY_DAY).format(datetime);

              //third tym
              Container(
                  alignment:Alignment.topCenter,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                      children:[

                        Padding(
                          padding: const EdgeInsets.only(top: 30,left: 30),
                          child: Text(datetime1),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 10,left: 10),
                          child: Text(datetime2),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 30,left: 60),
                          child: Text(datetime3),
                        ),

                        // Text(datetime4),
                      ]
                  )
              )

            ],
          ),
        ));
  }
  _selectDate(BuildContext context) async {
    final DateTime selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
      });
  }


}