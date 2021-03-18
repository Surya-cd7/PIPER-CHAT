import 'package:flutter/material.dart';
import '../model/model/calls.dart';

class Pipers extends StatefulWidget {
  @override
  _PiperState createState() => _PiperState();
}

class _PiperState extends State<Pipers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon:Icon(Icons.arrow_back_ios,color: Colors.white,size: 20,), onPressed: null),
        title:Row(children:[ Text('PiPers',style:TextStyle(color:Colors.white)),
        SizedBox(width: 120,),
        Container(
                      alignment: Alignment.topRight,
                                          child: Container(
                                            constraints: BoxConstraints(
                                              maxWidth:100,
                                              maxHeight: 33

                                            ),
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration:BoxDecoration(
                          color:  Colors.black,
                         border: Border.all(color:Colors.white),
                          borderRadius: BorderRadius.circular(20),
                          /*boxShadow: [
                            BoxShadow(
                              color:Colors.grey.withOpacity(0.5),
                              spreadRadius:2,
                              blurRadius:5,
                            )*/
                          //]
                        ),
                        child:Row(children:[Icon(Icons.search,size: 15,color: Colors.grey,),
                        SizedBox(width:5),
                          Text('Search',style:TextStyle(color:Colors.grey,fontSize: 12)),
                        ])
                      ),
                    ),
        ]
            ),
        backgroundColor:   Color(0xffb1f1e21)
        ,
        actions:<Widget>[
         

                      
                        
          
        ],
        
        ),
        backgroundColor:  Colors.black,
      
    );
  }
}