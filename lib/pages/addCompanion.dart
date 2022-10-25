
//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';


class addCompanion extends StatefulWidget {
  const addCompanion({Key? key}) : super(key: key);

  @override
  State<addCompanion> createState() => _addCompanionState();
}

class _addCompanionState extends State<addCompanion> {

  DateRangePickerController _datePickerController = DateRangePickerController();
  double shapePointerValue = 4;


  @override
  Widget build(BuildContext context) {
    return Container(

      child: Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios))
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<String?>(
                decoration: InputDecoration(
                  labelText: '여행 국가',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: TextStyle(fontSize: 15, color: Color(0xff9b9b9b), fontWeight: FontWeight.bold),
                ),
                // underline: Container(height: 1.4, color: Color(0xffc0c0c0)),
                onChanged: (String? newValue) {
                  print(newValue);
                },
                items:
                [null, 's', 'j'].map<DropdownMenuItem<String?>>((String? i) {
                  return DropdownMenuItem<String?>(
                    value: i,
                    child: Text({'s': '한국', 'j': '일본'}[i] ?? '국가를 선택 하세요'),
                  );
                }).toList(),
              ),
              SizedBox(height: 20.0),
              DropdownButtonFormField<String?>(
                decoration: InputDecoration(
                  labelText: '여행 도시',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: TextStyle(fontSize: 15, color: Color(0xff9b9b9b), fontWeight: FontWeight.bold),
                ),
                // underline: Container(height: 1.4, color: Color(0xffc0c0c0)),
                onChanged: (String? newValue) {
                  print(newValue);
                },
                items:
                [null, 's', 'j'].map<DropdownMenuItem<String?>>((String? i) {
                  return DropdownMenuItem<String?>(
                    value: i,
                    child: Text({'s': '한국', 'j': '일본'}[i] ?? '도시를 선택 하세요'),
                  );
                }).toList(),
              ),
              SizedBox(height: 20.0),
              Text("날짜를 선택 하세요", style: TextStyle(fontWeight: FontWeight.bold)),
              SfDateRangePicker(
                view: DateRangePickerView.month,
                monthViewSettings: DateRangePickerMonthViewSettings(firstDayOfWeek: 6),
                selectionMode: DateRangePickerSelectionMode.multiRange,
                showActionButtons: true,
                controller: _datePickerController,
                onSubmit: (Object? val) {
                  print(val);
                },
                onCancel: () {
                  _datePickerController.selectedRanges = null;
                },
              ),
              SizedBox(height: 20.0),
              Text("참가 인원을 선택하세요", style: TextStyle(fontWeight: FontWeight.bold)),
      SfLinearGauge(
        maximum: 8,
        minimum: 0,
        barPointers: [LinearBarPointer(value: shapePointerValue)],
        markerPointers: [
          LinearShapePointer(
              value: shapePointerValue,
              onChanged: (value) {
                setState(() {
                  shapePointerValue = value;
                });
              },
              color: Colors.blue[800]
          ),


            ],

          ),


]
      ),
      )
    );
  }


}


class popNotice extends StatefulWidget {
  const popNotice({Key? key}) : super(key: key);

  @override
  State<popNotice> createState() => _popNoticeState();
}

class _popNoticeState extends State<popNotice> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new),
            color: Colors.black,
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          title: Text(
            '알림',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),

      ),

    );
  }
}


