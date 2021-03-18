import 'package:PiPerChat/screens/ChatScreen.dart';
import 'package:PiPerChat/screens/hidelock.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/model/chat.dart';




class Chat extends StatefulWidget {
  @override
   _ChatState createState() => _ChatState();
}



class _ChatState extends State<Chat> {
    List<Widget> chats;
List<Widget> getchats (
  int i,BuildContext context
){
   chats= [

                        Divider(height:20.0),
                        ListTile(
                          leading: CircleAvatar(
                            maxRadius: 25,
                            backgroundImage:NetworkImage(messageData[i].imageurl),
                            
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:<Widget> 
                            [
                              Text(messageData[i].name,
                              style:TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                              )),
                              Text(
                                messageData[i].time,
                                style:TextStyle(
                                color:Colors.grey,
                                fontSize: 16.0)
                              ),
                            
                            ],
                            ),
                            /*subtitle: Container(
                              padding:EdgeInsets.only(top:5.0),
                              child:Text(
                                messageData[i].message,
                                style: TextStyle(
                                  color:Colors.grey,
                                  fontSize:15.0
                                ),
                              )
                            ),*/
                            onTap: (){
                               Navigator.of(context).push(CupertinoPageRoute(builder: (_)=> ChatScreen(
                                name:messageData[i].name,
                                imageurl: messageData[i].imageurl,
                                               )));
                            },
                        ),
                      ];
                      return chats;
                      }
Future<void>  hiddenChats()async{
  /*setState(() {
    chats.insert(0, Icon(Icons.lock));
  });*/
  
  Future.delayed(Duration(milliseconds: 100)).then((value) {
    Navigator.push(context,MaterialPageRoute(builder: (BuildContext context){
      return Hidelock();
    } ));
  });
}

   @override
   Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:Text('PiPerchat',style:TextStyle(color:Colors.white,fontStyle:FontStyle.italic)),
        backgroundColor: Color(0xffb1f1e21),
        
      
        actions:<Widget>[
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.search),
            color: Colors.white,
            
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.more_vert),
            color: Colors.white,)
           
        ],),
        backgroundColor: Colors.black,
 body:   RefreshIndicator(
   
   backgroundColor: Colors.black,
   color: Colors.transparent,
            onRefresh: hiddenChats,
                      child: ListView.builder(
        itemCount:messageData.length,
        itemBuilder: (context,i)=>
        Column(
                      children:getchats(i,context),
        )
        ,
        ),
          ),
                  
               
          
    );
  }
 }
 