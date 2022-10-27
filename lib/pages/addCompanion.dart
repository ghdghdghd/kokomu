
//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_chat_app/pages/tabHomePage.dart';
import 'package:group_chat_app/pages/tabHomePage2.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';


class addCompanion extends StatefulWidget {
  final String groupId;
  final String userName;
  final String groupName;
  final String email;
  final String password;
  final String age;


  const addCompanion({
    required this.groupId,
    required this.userName,
    required this.groupName,
    required this.email,
    required this.password,
    required this.age,


});
  //: super(key: key);

  @override
  State<addCompanion> createState() => _addCompanionState();
}

class _addCompanionState extends State<addCompanion> {

  DateRangePickerController _datePickerController = DateRangePickerController();
  double shapePointerValue = 4;
  var title = "";
  var tag = "";
  var contents = "";

  bool _flag20 = true;
  bool _flag30 = true;
  bool _flag = true;
  bool _flagF = true;
  bool _flagT = true;
  bool _flagA = true;
  bool _flagFe = true;
  bool _flagM= true;
  bool _flagAll = true;

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
        body: SingleChildScrollView(
          child: Column(
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
                  [null, 'ss', 'j', 'u', 'ug', 'us', 'c', 't', 'r', 'm', 'b', 's', 'ta', 'h', 'm', 'gr', 'neth', 'ger', 'swi', 'spa', 'aust', 'br', 'ita', 'che', 'fra', 'bel', 'hun', 'australia', 'tur' ].map<DropdownMenuItem<String?>>((String? i) {
                    return DropdownMenuItem<String?>(
                      value: i,
                      child: Text({'ss': '한국', 'j': '일본', 'u': '미국', 'ug': '괌', 'us': '사이판', 'c': '캐나다', 't': '대만', 'r': '라오스', 'm': '말레이시아', 'b': '베트남', 's': '싱가포르', 'ta': '태국', 'h': '홍콩', 'm': '몽골', 'gr': '그리스', 'neth': '네덜란드', 'ger': '독일', 'swi': '스위스', 'spa': '스페인', 'aust': '오스트리아', 'br': '영국', 'ita': '이탈리아', 'che': '체코', 'fra': '프랑스', 'bel': '벨기에', 'hun': '헝가리', 'australia': '호주', 'tur': '터키'}[i] ?? '국가를 선택 하세요'),
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
                  [null, 'wd', 'gc', 'y', 'lb', 'loa', 'ma', 'bs', 'sa', 'ss', 'se', 'sc', 'al', 'et', 'hs'].map<DropdownMenuItem<String?>>((String? i) {
                    return DropdownMenuItem<String?>(
                      value: i,
                      child: Text({'wd': '워싱턴DC', 'gc': '그랜드캐니언', 'y': '뉴욕', 'lb': '라스베이거스', 'loa': '로스앤젤레스', 'ma': '마이애미', 'bs': '보스턴', 'sa': '샌디에고', 'ss': '샌프란시스코', 'se': '시애틀', 'sc': '시카고', 'al': '올란도', 'et': '애틀란타', 'hs': '휴스턴'}[i] ?? '도시를 선택 하세요'),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20.0),
                Text("날짜를 선택 하세요", style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff9b9b9b))),
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
                Text("참가 인원을 선택하세요", style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff9b9b9b))),
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
                SizedBox(height: 30.0),
                Text("성별을 고르세요", style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff9b9b9b))),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    SizedBox(width: 55.0,),
                    Container(
                      child: ElevatedButton(
                        onPressed: () => setState(() => _flagM = !_flagM),
                        child: Text("남성만"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _flagM ? Colors.blueAccent : Colors.indigo,
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0,),
                    Container(
                      child: ElevatedButton(
                        onPressed: () => setState(() => _flagFe = !_flagFe),
                        child: Text("여성만"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _flagFe ? Colors.blueAccent : Colors.indigo,
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0,),
                    Container(
                      child: ElevatedButton(
                        onPressed: () => setState(() => _flagAll = !_flagAll),
                        child: Text("모든성별"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _flagAll ? Colors.blueAccent : Colors.indigo,
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 30.0),
                Text("연령대를 고르세요", style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff9b9b9b))),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    SizedBox(width: 50.0,),
                    Container(
                      child: ElevatedButton(
                        onPressed: () => setState(() => _flag20 = !_flag20),
                        child: Text("20대만"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _flag20 ? Colors.blueAccent : Colors.indigo,
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0,),
                    Container(
                      child: ElevatedButton(
                        onPressed: () => setState(() => _flag30 = !_flag30),
                        child: Text("30대만"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _flag30 ? Colors.blueAccent : Colors.indigo,
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0,),
                    Container(
                      child: ElevatedButton(
                        onPressed: () => setState(() => _flag = !_flag),
                        child: Text("모든연령"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _flag ? Colors.blueAccent : Colors.indigo,
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 30.0),
                Text("동행 카테고리를 고르세요", style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff9b9b9b))),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    SizedBox(width: 90.0,),
                    Container(
                      child: ElevatedButton(
                        onPressed: () => setState(() => _flagF = !_flagF),
                        child: Text("맛집동행"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _flagF ? Colors.blueAccent : Colors.indigo,
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0,),
                    Container(
                      child: ElevatedButton(
                        onPressed: () => setState(() => _flagT = !_flagT),
                        child: Text("관광지동행"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _flagT ? Colors.blueAccent : Colors.indigo,
                        ),
                      ),
                    ),
                    // SizedBox(width: 20.0,),
                    // Container(
                    //   child: ElevatedButton(
                    //     onPressed: () => setState(() => _flagA = !_flagA),
                    //     child: Text("액티비티"),
                    //     style: ElevatedButton.styleFrom(
                    //       backgroundColor: _flagA ? Colors.blueAccent : Colors.indigo,
                    //     ),
                    //   ),
                    // ),

                  ],
                ),
                SizedBox(height: 60.0),
                Text("제목 입력", style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff9b9b9b))),
                SizedBox(height: 10.0),
                TextFormField(
                  maxLength: 40,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: '제목을 입력하세요',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                    ),
                  ),
                 // validator: (val) => val!.length < 6 ? 'Password not strong enough' : null,

                  onChanged: (val) {
                    setState(() {
                      title = val;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                Text("내용 입력", style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff9b9b9b))),
                SizedBox(height: 10.0),
                TextFormField(
                  maxLines: 5,
                  minLines: 1,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: '내용을 입력하세요',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                    ),
                  ),
                  // validator: (val) => val!.length < 6 ? 'Password not strong enough' : null,

                  onChanged: (val) {
                    setState(() {
                      contents = val;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                Center(
                  child: Container(
                    width: 350,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => tabHomePage2(groupId: widget.groupId, userName: widget.userName, groupName: widget.groupName, email: widget.email, password: widget.password, age: widget.age)));

                      },
                      child: Text("등  록",style: TextStyle(fontSize: 18,color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0)


              ]
      ),
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


