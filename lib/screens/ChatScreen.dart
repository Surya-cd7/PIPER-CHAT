import 'package:flutter/material.dart';
import '../model/model/user_model.dart';
import '../model/model/message_model.dart';
import '../model/model/chat.dart';
class ChatScreen extends StatefulWidget {
  final name;
  final imageurl;
  final message;
  ChatScreen({this.name,this.imageurl,this.message});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _chatBubble(message,bool isMe,bool isSameUser){
    if(isMe)
    {
      return  Column(
                  children: [
                  
                    Container(
                      alignment: Alignment.topRight,
                                          child: Container(
                                            constraints: BoxConstraints(
                                              maxWidth:MediaQuery.of(context).size.width*0.80
                                            ),
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(vertical: 2),
                        decoration:BoxDecoration(
                         color: Color(0xffb1f1e21),
                          borderRadius: BorderRadius.circular(15),
                          
                        ),
                        child:Text(message.text,style:TextStyle(color:Colors.white))
                      ),
                    ),
                    !isSameUser?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                                          children:[
                                            Text(message.time,style:TextStyle(color:Colors.grey,fontSize:12)),
                                            SizedBox(width:10,),
                                            CircleAvatar(
              maxRadius: 15,
              backgroundImage:NetworkImage('https://wallpapercave.com/wp/wp4074601.jpg?auto=compress'),
              
            ),
           
            ]
                    )
                    :
                    Container(child:null,),


                  ],
      );
    }
    else{
     return Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                                          child: Container(
                                            constraints: BoxConstraints(
                                              maxWidth:MediaQuery.of(context).size.width*0.80
                                            ),
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(vertical: 2),
                        decoration:BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          /*boxShadow: [
                            BoxShadow(
                              color:Colors.grey.withOpacity(0.5),
                              spreadRadius:2,
                              blurRadius:5,
                            )*/
                          //]
                        ),
                        child:Text(message.text,style:TextStyle(color:Colors.black))
                      ),
                    ),
                    !isSameUser?
                    Row(
                                          children:[CircleAvatar(
              maxRadius: 15,
              backgroundImage:NetworkImage(widget.imageurl),
              
            ),
            SizedBox(width:10,),
            Text(message.time,style:TextStyle(color:Colors.grey,fontSize:12))
            ]
                    )
                    :
                    Container(child:null)


                  ],
                );
    }
    
  }
  _sendMessageArea(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 50,
      color: Colors.white,
      child: Row(children: [
        IconButton(icon: Icon(Icons.photo),
        iconSize: 25,
        color: Theme.of(context).primaryColor, onPressed: (){}),
        Expanded(
                  child: TextField(
            decoration: InputDecoration.collapsed(hintText: 'send a message'),
            textCapitalization: TextCapitalization.sentences,
          ),
        ),
        IconButton(icon: Icon(Icons.send),
        iconSize: 25,
        color: Theme.of(context).primaryColor, onPressed: (){})
      ],),
    );
  }
  @override
  Widget build(BuildContext context) 
  {
    int  previousUserid;
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar:  AppBar(
          automaticallyImplyLeading: false,
          leading: Row(children:[ IconButton(icon: Icon(Icons.arrow_back_ios), color:Colors.white,onPressed:(){Navigator.pop(context);}),
          
            ]),
           
            
          centerTitle: true,
          titleSpacing: 10,
          
          title: Row(children:[
            CircleAvatar(
               
              maxRadius: 18,
              backgroundImage:NetworkImage(widget.imageurl),
          ), 
          SizedBox(width:10),
          Text(widget.name,style: TextStyle(fontSize: 20,fontWeight:FontWeight.w500),),
          ]),
          actions: [
            IconButton(icon: Icon(Icons.call,color: Colors.white,), onPressed: null),
            IconButton(icon: Icon(Icons.more_vert,color: Colors.white,), onPressed: null),

          ],
      ),
      body: Column(
        children:<Widget>[
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: EdgeInsets.all(20),
              itemCount:messages.length,
              itemBuilder: (BuildContext context,int index){
                final Message message=messages[index];
                final bool isMe =message.sender.id== currentUser.id;
                final bool isSameUser = previousUserid==message.sender.id;
                previousUserid=message.sender.id;
                return _chatBubble(message, isMe,isSameUser);
              },),
          ),
          _sendMessageArea(),
        ]
          
      ),
      
    );
  }
}