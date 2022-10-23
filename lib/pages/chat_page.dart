import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:group_chat_app/services/database_service.dart';
import 'package:group_chat_app/widgets/message_tile.dart';
import 'package:firebase_core/firebase_core.dart';

class ChatPage extends StatefulWidget {

  final String groupId;
  final String userName;
  final String groupName;

  ChatPage({
    required this.groupId,
    required this.userName,
    required this.groupName
  });

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  var status = false;
  ScrollController? _ScrollController; //= ScrollController();
  Stream<QuerySnapshot>? _chats;
  TextEditingController messageEditingController = new TextEditingController();

  Widget _chatMessages(){
    return Container(
      height: 415,
      child: StreamBuilder(
        stream: _chats,
        builder: (context, snapshot){
          return snapshot.hasData ?  ListView.builder(
           // controller: _ScrollController,
              //(snapshot.data! as QuerySnapshot)
            itemCount: (snapshot.data! as QuerySnapshot).docs.length,
            itemBuilder: (context, index){
              return MessageTile(
                message: (snapshot.data! as QuerySnapshot).docs[index].get("message"), //검증요
                sender: (snapshot.data! as QuerySnapshot).docs[index].get("sender"),                           //data()["sender"],
                sentByMe: widget.userName == (snapshot.data! as QuerySnapshot).docs[index].get("sender")     //data()["sender"],
              );
            }
          )
          :
          Container();
        },
      ),
    );
  }

  _sendMessage() {
    if (messageEditingController.text.isNotEmpty) {
      _ScrollController!.animateTo(_ScrollController!.position.maxScrollExtent, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
      Map<String, dynamic> chatMessageMap = {
        "message": messageEditingController.text,
        "sender": widget.userName,
        'time': DateTime.now().millisecondsSinceEpoch,
      };

      DatabaseService(uid: '').sendMessage(widget.groupId, chatMessageMap);

      setState(() {
        messageEditingController.text = "";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    DatabaseService(uid: '').getChats(widget.groupId).then((val) {
      // print(val);
      _ScrollController = ScrollController();
      setState(() {
        _chats = val;
      });
    });
  }


  // @override
  // void dispose() {
  //   _ScrollController?.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.groupName, style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black87,
        elevation: 0.0,
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            _chatMessages(),
            // Container(),
            Container(
              alignment: Alignment.bottomCenter,
              width: MediaQuery.of(context).size.width,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                color: Colors.grey[700],
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        onTap: () {
                          _ScrollController?.animateTo(
                              1000.0,
                              duration: Duration(milliseconds: 100),
                              curve: Curves.ease);
                        },
                        controller: messageEditingController,
                        style: TextStyle(
                          color: Colors.white
                        ),
                        decoration: InputDecoration(
                          hintText: "Send a message ...",
                          hintStyle: TextStyle(
                            color: Colors.white38,
                            fontSize: 16,
                          ),
                          border: InputBorder.none
                        ),
                      ),
                    ),

                    SizedBox(width: 12.0),

                    GestureDetector(
                      onTap: () {
                        _sendMessage();
                      },
                      child: Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child: Center(child: Icon(Icons.send, color: Colors.white)),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
