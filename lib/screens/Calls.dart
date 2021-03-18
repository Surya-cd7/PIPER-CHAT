import 'package:flutter/material.dart';
import '../model/model/calls.dart';

class Calls extends StatefulWidget {
  @override
   _CallsState createState() => _CallsState();
}

class _CallsState extends State<Calls> {
   @override
   Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon:Icon(Icons.arrow_back_ios,color: Colors.white,size: 20,), onPressed: null),
        title:Text('Calls',style:TextStyle(color:Colors.white)),
        backgroundColor: Color(0xffb1f1e21)
        ,
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
          body: ListView.builder(
        itemCount: callData.length,
        itemBuilder: (context,i)=>
        Column(
          children:<Widget> [
            Divider(
              
              height: 20.0,
            ),
            ListTile(
              leading:CircleAvatar(
                maxRadius:25,
                backgroundImage: NetworkImage(callData[i].imageurl),
              ),
              title:Text(
                callData[i].name,
                style: TextStyle(fontWeight: FontWeight.w400,fontSize:18,color:Colors.white),
              ),
              subtitle: Container(
                child: Padding(
                  padding: const EdgeInsets.only(top:5.0),
                  child: Text(
                    callData[i].time,
                    style:TextStyle(color: Colors.grey,fontSize: 14.0,)
                  ),
                ),
              ),
              trailing: Icon(Icons.call),
              selected: true,
            )
          ],
        )
      ,
      ),
    );
  }
 }