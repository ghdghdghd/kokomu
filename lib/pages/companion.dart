
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'addCompanion.dart';
import 'companionDetail.dart';


class companion extends StatefulWidget {
  final String groupId;
  final String userName;
  final String groupName;
  final String email;
  final String password;
  final String age;
  final String status;

  const companion({
    required this.groupId,
    required this.userName,
    required this.groupName,
    required this.email,
    required this.password,
    required this.age,
    required this.status
}) ; //
// : super(key: key);

  @override
  State<companion> createState() => _companionState();
}

class _companionState extends State<companion> {

  var simpleTitle = ["칸 동행 구해요", "맛집동행 구해요", "그라나다 동행 구해요"];
  var country = ["칸(프랑스)", "베네치아(이탈리아)", "그라나다(스페인)"];
  var day = ["2022.01.03-2022.01.20", "2022.01.03-2022.01.20", "2022.01.03-2022.01.20"];
  var searchTag = ["#모든성별#모든나이#관광지투어", "#여성만#20대#맛집투어", "#남성만#30대#맛집투어"];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, size: 40),
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => addCompanion(groupId: widget.groupId, userName: widget.userName, groupName: widget.groupName, email: widget.email, password: widget.password, age: widget.age, status: '',))
            );

          },
      ),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (c, i) {
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => companionDetail())
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



// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text("여행동행 같이 하실분 구해요", style: TextStyle(fontSize: 25)),//간단한 한줄 소개
// SizedBox(height: 10.0),
// Text("칸(프랑스)", style: TextStyle(fontSize: 20)),//지역명
// Text("2022.01.01 - 2022.01.20", style: TextStyle(fontSize: 18)),//날짜
// Text("#모든 성별#모든 나이#관광지 투어", style: TextStyle(fontSize: 18)),//검색태그
// ],
// ),