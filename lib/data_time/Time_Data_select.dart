
import 'package:flutter/material.dart';
import 'package:time_range/time_range.dart';
import 'package:intl/intl.dart';

class New_Address extends StatefulWidget {
  const New_Address({Key? key, required String token, required String mobile}) : super(key: key);

  @override
  State<New_Address> createState() => _New_AddressState();
}

class _New_AddressState extends State<New_Address> {
  DateTime? _selectDate;


  bool? Cash_on_Delivery = false;
  bool? Bank_Card = false;
  bool? Mobile_Banking = false;
  // bool check = false;
  // bool check1 = false;
  // bool check2 = false;
  // bool check3 = false;
  // bool address = false;

  TextEditingController nameController = TextEditingController();

  _Cash_on_Delivery(bool? value) {
    setState(() {
      Cash_on_Delivery = value;
    });
  }

  _Bank_Card(bool? value) {
    setState(() {
      Bank_Card = value;
    });
  }

  _Mobile_Banking(bool? value) {
    setState(() {
      Mobile_Banking = value;
    });
  }




  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate:DateTime(2023,DateTime.now().day+5),)
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectDate = pickedDate;
      });
    });
  }

  static const orange = Color(0xFFFE9A75);
  static const dark = Color(0xFF333A47);
  static const double leftPadding = 50;

  final _defaultTimeRange = TimeRangeResult(
    TimeOfDay(hour: 14, minute: 50),
    TimeOfDay(hour: 15, minute: 20),
  );

  TimeRangeResult? _timeRange;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ), onPressed: () {
          Navigator.of(context).pop();
        },
        ),
        title: Text("Manage Address"),
      ),
      body:SingleChildScrollView (
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30,left: 20,right: 20),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey)
                ),
                height: 150,
                width: 350,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 7,left: 10,right: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.location_on,
                            color: Colors.black,
                            size: 25,),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Select a deliver Address",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blueGrey,),),
                        ],
                      ),
                    ),
                    Container(
                      child: Divider(
                        height: 40,
                        color: Colors.black,
                      ),

                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(

                        children: [
                          Icon(Icons.backpack_outlined,
                            color: Colors.black,
                            size: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("17 Alhaj, Samsuddin Manshion",style: TextStyle(fontSize: 14),),
                                Text("Moghbazar, Dhaka ",style: TextStyle(fontSize: 14),)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30,top: 20),
                            child: Text("Change",style: TextStyle(color: Colors.green),),
                          )
                        ],

                      ),
                    )



                  ],

                ),

              ),


            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 20),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey)
                ),
                height: 200,
                width: 350,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 7,left: 10,right: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.watch_later),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text("Preferred Delivery Time",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blueGrey,),
                            ),
                          )
                          //  When Would You Like Your Regular Delivery ?
                        ],
                      ),
                    ),
                    Container(
                      height: 40,
                      child: Divider(
                        height: 40,
                        color: Colors.grey,
                      ),

                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Icon(Icons.hourglass_bottom_sharp),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text("When Would You Like Your Regular Delivery ?",style: TextStyle(fontSize: 14),),
                          )
                          //  When Would You Like Your Regular Delivery ?
                        ],
                      ),
                    ),

                    Row(
                      children: [
                        Card(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                Text(
                                  'Date',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: Text(
                                        _selectDate == null
                                            ? 'Choose date'
                                            : ' ${DateFormat.MMMEd().format(_selectDate!)}',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: _presentDatePicker,
                                      icon: Icon(Icons.arrow_drop_down),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Column(
                              children: [
                                Text(
                                  'Time',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Row(
                                  children: [
                                    Text(_timeRange == null
                                        ? 'Choose Time'
                                        : ' ${_timeRange!.start.format(context)} - ${_timeRange!.end.format(context)}'),
                                    IconButton(
                                      onPressed: () {
                                        showModalBottomSheet<void>(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Container(
                                              color: Colors.white,
                                              padding:
                                              EdgeInsets.symmetric(vertical: 20),
                                              height:
                                              MediaQuery.of(context).size.height /
                                                  4,
                                              child: TimeRange(
                                                fromTitle: Text(
                                                  'FROM',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: dark,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                toTitle: Text(
                                                  'TO',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: dark,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                titlePadding: leftPadding,
                                                textStyle: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: dark,
                                                ),
                                                activeTextStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                                borderColor: dark,
                                                activeBorderColor: dark,
                                                backgroundColor: Colors.transparent,
                                                activeBackgroundColor: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                firstTime:
                                                TimeOfDay(hour: 8, minute: 00),
                                                lastTime:
                                                TimeOfDay(hour: 22, minute: 00),
                                                initialRange: _timeRange,
                                                timeStep: 10,
                                                timeBlock: 30,
                                                onRangeCompleted: (range) =>
                                                    setState(() => _timeRange = range),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      icon: Icon(Icons.arrow_drop_down),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),],

                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Payment Method",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .05,
              width: MediaQuery.of(context).size.width,
              child: CheckboxListTile(
                title: Text(
                  "Cash on Delivery",
                  style:
                  TextStyle(fontSize: 14, color: Colors.grey),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                value: Cash_on_Delivery,
                onChanged: _Cash_on_Delivery,
              ),
            ),

            Container(
              height: MediaQuery.of(context).size.height * .05,
              width: MediaQuery.of(context).size.width,
              child: CheckboxListTile(
                title: Text(
                  "Bank/Card",
                  style:
                  TextStyle(fontSize: 14, color: Colors.grey),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                value: Bank_Card,
                onChanged: _Bank_Card,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .05,
              width: MediaQuery.of(context).size.width,
              child: CheckboxListTile(
                title: Text(
                  "Mobile Banking",
                  style:
                  TextStyle(fontSize: 14, color: Colors.grey),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                value: Mobile_Banking,
                onChanged: _Mobile_Banking,
              ),
            ),
            SizedBox(height: 50,),
            Center(
              child: Text(
                "৳ 60 Delivery charge included",
                style:
                TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
      SizedBox(height: 10,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width *.5,
            color: Color(0xFFF6B698),
            child: Text(
              "Proceed",
              style:
              TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xFFFE9A75),
            ),
            child: Text(
              "৳ 149",
              style:
              TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),


          ],

        ),

],
      ),
      ),
    );
  }
}
