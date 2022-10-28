
//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_chat_app/pages/myCompanionChatDetail.dart';
import 'package:group_chat_app/pages/tabHomePage.dart';
import 'package:group_chat_app/pages/tabHomePage2.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';


class myCompanionChat2 extends StatefulWidget {
  final String groupId;
  final String userName;
  final String groupName;
  final String email;
  final String password;
  final String age;


  const myCompanionChat2({
    required this.groupId,
    required this.userName,
    required this.groupName,
    required this.email,
    required this.password,
    required this.age,


});
  //: super(key: key);

  @override
  State<myCompanionChat2> createState() => _myCompanionChat2State();
}

class _myCompanionChat2State extends State<myCompanionChat2> {

  var simpleTitle = ["칸 동행 구해요"];
  var country = ["칸(프랑스)"];
  var day = ["2023.01.03-2023.01.20"];
  var searchTag = ["#모든성별#모든연령#관광지동행"];
  var Personnel = ["4/3"];
  var contents = ["안녕하세요~\n칸 동행 구해요"];


  @override
  Widget build(BuildContext context) {
    return Container(

      child: Scaffold(
        appBar: AppBar(
            title: Text("나의 동행",style: TextStyle(color: Colors.black)),
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => tabHomePage2(groupId: "", userName: "", groupName: "", email: "", password: "", age: ""))
                  );
                },
                icon: Icon(Icons.arrow_back_ios)),

        ),
        // body: ListView.builder(
        //     itemCount: 1,
        //     itemBuilder: (c, i) {
        //       return Column(
        //         children: [
        //           InkWell(
        //             onTap: () {
        //               Navigator.push(
        //                   context,
        //                   MaterialPageRoute(builder: (context) => myCompanionChatDetail(groupId: "5PalVpTh2esmJpHrXVYY", userName: widget.userName, groupName: "칸 동행 구해요"))
        //               );
        //
        //             },
        //             child: Card(
        //               shape: RoundedRectangleBorder( //모서리 둥글게 하기 위해 사용
        //                   borderRadius : BorderRadius.circular(16.0)
        //               ),
        //               elevation: 4.0 ,//그림자 깊이
        //               child: Container(
        //                 height: 140 ,
        //                 width: 340,
        //                 child: Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     Text(simpleTitle[i], style: TextStyle(fontSize: 25)),//간단한 한줄 소개
        //                     SizedBox(height: 10.0),
        //                     Text(country[i], style: TextStyle(fontSize: 20)),//지역명
        //                     Text(day[i], style: TextStyle(fontSize: 18)),//날짜
        //                     Text(searchTag[i], style: TextStyle(fontSize: 18)),//검색태그
        //                     SizedBox(height: 10.0,),
        //                     Row(
        //                       children: [
        //                         SizedBox(width: 300.0,),
        //                         Text(Personnel[i], style: TextStyle(fontSize: 15))
        //                       ],
        //                     )
        //
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ),
        //
        //         ],
        //       );
        //
        //
        //
        //     }
        // ),
      )
    );
  }


}

//
// class popNotice extends StatefulWidget {
//   const popNotice({Key? key}) : super(key: key);
//
//   @override
//   State<popNotice> createState() => _popNoticeState();
// }
//
// class _popNoticeState extends State<popNotice> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             onPressed: (){
//               Navigator.pop(context);
//             },
//             icon: Icon(Icons.arrow_back_ios_new),
//             color: Colors.black,
//           ),
//           iconTheme: IconThemeData(
//             color: Colors.black,
//           ),
//           title: Text(
//             '알림',
//             style: TextStyle(color: Colors.black),
//           ),
//           centerTitle: true,
//           elevation: 0.0,
//           backgroundColor: Colors.transparent,
//         ),
//
//       ),
//
//     );
//   }
// }


