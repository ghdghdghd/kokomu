
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class companionDetail extends StatefulWidget {
  const companionDetail({Key? key}) : super(key: key);

  @override
  State<companionDetail> createState() => _companionDetailState();
}

class _companionDetailState extends State<companionDetail> {

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
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder( //모서리 둥글게 하기 위해 사용
                      borderRadius : BorderRadius.circular(16.0)
                  ),
                  elevation: 4.0 ,//그림자 깊이
                  child: Container(
                    width: 330,
                    height: 530,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("간단한 제목"),
                        Text("지역명"),
                      ],


                    ),

                  ),


                  ),
                 SizedBox(height: 10.0),
                 Container(
                   width: 300,
                   height: 40,
                   child: Row(

                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       SizedBox(//버튼 사이즈 조절
                         width: 260,
                         child: TextButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.transparent),

                                ),

                                onPressed: () {

                                },
                                child: Text("동행 함께 하기",style: TextStyle(color: Colors.black)),

                         ),
                       ),
                       SizedBox(
                         width: 30,
                         child: IconButton(
                             onPressed: () {
                               showDialog(
                                   context: context,
                                   barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
                                   builder: (BuildContext context) {
                                     return AlertDialog(
                                       content: popNotice(),
                                       insetPadding: const  EdgeInsets.fromLTRB(0,200,0, 200),
                                       actions: [

                                       ],
                                     );
                                   }
                               );
                             },
                             icon: Icon(Icons.report_outlined))

                       )
                     ],
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



