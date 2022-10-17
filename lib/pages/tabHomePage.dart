import 'package:flutter/material.dart';
import 'package:group_chat_app/mapPage/mapService_page.dart';

import 'chat_page.dart';
import 'companion.dart';




class tabHomePage extends StatefulWidget {
  final String groupId;
  final String userName;
  final String groupName;


  //const
   tabHomePage({
    required this.groupId,
    required this.userName,
    required this.groupName});
      // : super(key: key);

  @override
  State<tabHomePage> createState() => _tabHomePageState();
}



class _tabHomePageState extends State<tabHomePage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.transparent,
            title: Text(
                '코코뮤',
                style: TextStyle(color: Colors.black)
            ),
            centerTitle: true,
            // 중앙정렬
            elevation: 0.0,
            leading: IconButton(
              icon: Icon(Icons.notifications_outlined, size: 35,), // 환경설정 아이콘
              onPressed: () {

             //   Navigator.push(
               //  context,
                //  MaterialPageRoute(builder: (context) => popNotice()),
                //);


                // showDialog(
                //     context: context,
                //     barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
                //     builder: (BuildContext context) {
                //       return AlertDialog(
                //         content: popNotice(),
                //         insetPadding: const  EdgeInsets.fromLTRB(0,200,0, 200),
                //         actions: [
                //           // TextButton(
                //           //   child: const Text('확인'),
                //           //   onPressed: () {
                //           //     Navigator.of(context).pop();
                //           //   },
                //           // ),
                //         ],
                //       );
                //     }
                // );
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.settings_outlined, size: 35), // 설정 버튼
                onPressed: () {
                 // Navigator.push(
                   // context,
                 //   MaterialPageRoute(builder: (context) =>   ),
                 // );
                },
              ),
              // IconButton(
              //   icon: Icon(Icons.search), // 검색 아이콘 생성
              //   onPressed: () {
              //     // 아이콘 버튼 실행
              //     print('Search button is clicked');
              //   },
              // ),
            ],
          ),

          body: TabBarView(
            children: [
              Center(
                child: ChatPage(groupId: widget.groupId, userName: widget.userName, groupName: widget.groupName),
              ),
              Center(
                child: MapService(),
              ),
              Center(
                child: companion(),
              ),

            ],
          ),
          extendBodyBehindAppBar: false, //appbar영역 침범

          bottomNavigationBar: Container(
            color: Colors.white, //색상
            child: Container(
              height: 70,
              padding: EdgeInsets.only(bottom: 10, top: 5),
              child: const TabBar(
                //tab 하단 indicator size -> .label = label의 길이
                //tab 하단 indicator size -> .tab = tab의 길이
                indicatorSize: TabBarIndicatorSize.label,
                //tab 하단 indicator color
                indicatorColor: Colors.red,
                //tab 하단 indicator weight
                indicatorWeight: 2,
                //label color
                labelColor: Colors.red,
                //unselected label color
                unselectedLabelColor: Colors.black38,
                labelStyle: TextStyle(
                  fontSize: 13,
                ),
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.chat_outlined,
                    ),
                    text: 'chat',
                  ),
                  Tab(
                    icon: Icon(
                        Icons.map_outlined),
                    text: 'map',
                  ),
                  Tab(
                    icon:  Icon(
                        Icons.groups_outlined),
                    text: 'companion',
                  ),
                ],


              ),
            ),
          ),
        ),
      ),
    );
  }


}


//커스텀 다이얼로그
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

