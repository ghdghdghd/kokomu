
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_chat_app/pages/myCompanionChat.dart';

import 'addCompanion.dart';
import 'companionDetail.dart';


class companion2 extends StatefulWidget {
  final String groupId;
  final String userName;
  final String groupName;
  final String email;
  final String password;
  final String age;


  const companion2({
    required this.groupId,
    required this.userName,
    required this.groupName,
    required this.email,
    required this.password,
    required this.age,

}) ; //
// : super(key: key);

  @override
  State<companion2> createState() => _companion2State();
}

class _companion2State extends State<companion2> {

  var simpleTitle = ["뉴욕동행구해요~", "칸 동행 구해요", "맛집동행 구해요", "그라나다 동행 구해요"];
  var country = ["뉴욕(미국)", "칸(프랑스)", "베네치아(이탈리아)", "그라나다(스페인)"];
  var day = ["2022.12.18-2022.12.31", "2022.01.03-2022.01.20", "2022.01.03-2022.01.20", "2022.01.03-2022.01.20"];
  var searchTag = ["#모든성별#모든연령#관광지동행", "#모든성별#모든연령#관광지동행", "#여성만#20대만#맛집동행", "#남성만#30대만#맛집동행"];
  var Personnel = ["6/1", "4/2", "3/1", "8/2"];
  var contents = ["안녕하세요~\n뉴욕 동행 구해요", "안녕하세요~\n칸 동행 구해요", "안녕하세요~\n베니치아 동행 구해요", "안녕하세요~\n그라다나 동행 구해요"];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Stack(
        children: <Widget> [
          Align(
            alignment: Alignment(
                Alignment.bottomRight.x + 0.0, Alignment.bottomLeft.y - 0.2), //버튼 위치 지정
            child: FloatingActionButton.small(
              onPressed:() {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => myCompanionChat(groupId: widget.groupId, userName: widget.userName, groupName: widget.groupName, email: widget.email, password: widget.password, age: widget.age),    //버튼 눌렀을때 동작 함수
                    )
                );
              },
              tooltip: '나의 동행',            //버튼동작 설명 툴팁
              child: Icon(
                Icons.chat_bubble
                ,             //버튼 아이콘 지정
                //버튼 아이콘색 지정
              ),
              backgroundColor: Colors.black,    //버튼 배경색 지정
            ),
          ),
          Align(
            alignment: Alignment(
                Alignment.bottomRight.x + 0.0, Alignment.bottomLeft.y - 0.0), //버튼 위치 지정
            child: FloatingActionButton.small(
              onPressed:() {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => addCompanion(groupId: widget.groupId, userName: widget.userName, groupName: widget.groupName, email: widget.email, password: widget.password, age: widget.age))
                );
              },
              tooltip: '동행 추가',            //버튼동작 설명 툴팁
              child: Icon(
                Icons.add,
                //color: Colors.black,            //버튼 아이콘색 지정
              ),
              backgroundColor: Colors.black,    //버튼 배경색 지정
            ),
          ),
        ],
      ),

      // FloatingActionButton(
      //     child: Icon(Icons.add, size: 40),
      //     backgroundColor: Colors.black,
      //     onPressed: () {
      //       Navigator.push(
      //               context,
      //               MaterialPageRoute(builder: (context) => addCompanion(groupId: widget.groupId, userName: widget.userName, groupName: widget.groupName, email: widget.email, password: widget.password, age: widget.age))
      //       );
      //     },
      //
      // ),
      body: ListView.builder(
          itemCount: 4,
          itemBuilder: (c, i) {
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => companionDetail(simpleTitle: simpleTitle[i], country: country[i], day: day[i], searchTag: searchTag[i], Personnel:Personnel[i], contents: contents[i]))
                    );

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


    );
  }
}