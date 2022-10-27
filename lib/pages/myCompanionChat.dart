
//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_chat_app/pages/tabHomePage.dart';
import 'package:group_chat_app/pages/tabHomePage2.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';


class myCompanionChat extends StatefulWidget {
  final String groupId;
  final String userName;
  final String groupName;
  final String email;
  final String password;
  final String age;


  const myCompanionChat({
    required this.groupId,
    required this.userName,
    required this.groupName,
    required this.email,
    required this.password,
    required this.age,


});
  //: super(key: key);

  @override
  State<myCompanionChat> createState() => _myCompanionChatState();
}

class _myCompanionChatState extends State<myCompanionChat> {

  var simpleTitle = ["맛집동행 구해요"];
  var country = ["베네치아(이탈리아)"];
  var day = ["2022.01.03-2022.01.20"];
  var searchTag = ["#여성만#20대만#맛집동행"];
  var Personnel = ["3/2"];
  var contents = ["안녕하세요~\n베니치아 동행 구해요"];


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
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (c, i) {
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => companionDetail(simpleTitle: simpleTitle[i], country: country[i], day: day[i], searchTag: searchTag[i], Personnel:Personnel[i], contents: contents[i]))
                      // );

                    },
                    child: Card(
                      shape: RoundedRectangleBorder( //모서리 둥글게 하기 위해 사용
                          borderRadius : BorderRadius.circular(16.0)
                      ),
                      elevation: 4.0 ,//그림자 깊이
                      child: Container(
                        height: 140 ,
                        width: 340,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(simpleTitle[i], style: TextStyle(fontSize: 25)),//간단한 한줄 소개
                            SizedBox(height: 10.0),
                            Text(country[i], style: TextStyle(fontSize: 20)),//지역명
                            Text(day[i], style: TextStyle(fontSize: 18)),//날짜
                            Text(searchTag[i], style: TextStyle(fontSize: 18)),//검색태그
                            SizedBox(height: 10.0,),
                            Row(
                              children: [
                                SizedBox(width: 300.0,),
                                Text(Personnel[i], style: TextStyle(fontSize: 15))
                              ],
                            )

                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              );



            }
        ),
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


