
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_chat_app/pages/myCompanionChat.dart';


class companionDetail extends StatefulWidget {

  final String simpleTitle;
  final String country;
  final String day;
  final String searchTag;
  final String Personnel;
  final String contents;

  const companionDetail({
    required this.simpleTitle,
    required this.country,
    required this.day,
    required this.searchTag,
    required this.Personnel,
    required this.contents,
}); //: super(key: key);


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
                        Text(widget.simpleTitle, style: TextStyle(fontSize: 25)),
                        SizedBox(height: 30.0),
                        Row(
                          children: [
                            Icon(Icons.public),
                            SizedBox(width: 10.0),
                            Text(widget.country, style: TextStyle(fontSize: 20)),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_month),
                            SizedBox(width: 10.0),
                            Text(widget.day, style: TextStyle(fontSize: 20)),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.groups),
                            SizedBox(width: 10.0),
                            Text(widget.Personnel, style: TextStyle(fontSize: 20)),
                          ],
                        ),
                        Text(widget.searchTag, style: TextStyle(fontSize: 20)),
                        SizedBox(height: 50.0),
                        Text(widget.contents, style: TextStyle(fontSize: 20)),


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
                         width: 300, //260,
                         child: TextButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.tealAccent),

                                ),

                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext ctx){
                                        return AlertDialog(
                                          content: Text("동행에 참여 하였습니다"),
                                          actions: <Widget>[
                                            ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text("확인"))
                                          ],
                                        );
                                      });
                                },
                                child: Text("동행 함께 하기",style: TextStyle(color: Colors.black)),

                         ),
                       ),
                       // SizedBox(
                       //   width: 30,
                       //   child: IconButton(
                       //       onPressed: () {
                       //         showDialog(
                       //             context: context,
                       //             barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
                       //             builder: (BuildContext context) {
                       //               return AlertDialog(
                       //                 content: popNotice(),
                       //                 insetPadding: const  EdgeInsets.fromLTRB(0,200,0, 200),
                       //                 actions: [
                       //
                       //                 ],
                       //               );
                       //             }
                       //         );
                       //       },
                       //       icon: Icon(Icons.report_outlined))
                       //
                       // )
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



