
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class addCompanion extends StatefulWidget {
  const addCompanion({Key? key}) : super(key: key);

  @override
  State<addCompanion> createState() => _addCompanionState();
}

class _addCompanionState extends State<addCompanion> {

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
          children: [
            Text("나라를 고르시오")
          ],
          
        )


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


