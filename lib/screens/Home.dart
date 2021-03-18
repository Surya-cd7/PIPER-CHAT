import 'package:flutter/material.dart';
import 'package:PiPerChat/model/model/calls.dart';
import 'Calls.dart';
import 'Camera.dart';
import 'Chat.dart';
import 'Pipers.dart';
import 'package:flutter/src/services/asset_bundle.dart';
import 'package:PiPerChat/model/model/pipers.dart';
import 'package:PiPerChat/screens/Pipers.dart';
import 'Settings.dart';
import 'package:flutter/cupertino.dart';

import 'Shots.dart';
import 'package:PiPerChat/components/social_card.dart';


class Home extends StatefulWidget {
  @override
   _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>with SingleTickerProviderStateMixin {
  
  TabController _tabController;
  @override
  void initState(){
    super.initState();
    _tabController=TabController(initialIndex: 1,length: 3,vsync: this);
  }
  int _currentIndex=0;
  final tabs=[
    Center(child:Chat()),
    Center(child:Pipers()),
    Center(child:Shots()),
    Center(child:Calls()),
    Center(child:Settings()),

  ];
   @override
   Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      
       /* bottom: TabBar(
          controller: _tabController,
          tabs:<Widget>[
            Tab(
             child: Text('PIPERS',
             style: Theme.of(context).textTheme.button,),
            ),
           
            Tab(
             child: Text('CHATS',
             style: Theme.of(context).textTheme.button,),
            ),
            
            Tab(
             child: Text('CALLS',
             style: Theme.of(context).textTheme.button,),
            ),
           
          ],
        
      ),
     body: TabBarView(
       controller: _tabController,
       children: <Widget>[
         Pipers(),
         Chat(),
         Calls(),
         
         
         
         
                ],*/
              
              body: tabs[_currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: _currentIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.chat,size: 22),
                    title: Text('CHATS',style: TextStyle(fontSize: 10),),
                    backgroundColor: Colors.black
                  ),
                   BottomNavigationBarItem(
                      icon: Icon(Icons.local_parking,size: 22,),
                    title: Text('PIPERS',style: TextStyle(fontSize: 10),),
                    backgroundColor: Colors.black
                  ),
                  BottomNavigationBarItem(
                    icon:Icon(Icons.camera,size: 22),
                    title: Text('SHOTS',style: TextStyle(fontSize: 10),),
                    backgroundColor: Colors.black
                  ),
                   BottomNavigationBarItem(
                      icon: Icon(Icons.call,size: 22),
                    title: Text('CALLS',style: TextStyle(fontSize: 10),),
                    backgroundColor: Colors.black
                  ),
                   BottomNavigationBarItem(
                      icon: Icon(Icons.settings,size: 22),
                    title: Text('SETTINGS',style: TextStyle(fontSize: 10),),
                    backgroundColor: Colors.black
                  ),
                ],
                onTap: (index){
                  setState(() {
                    _currentIndex=index;
                  });
                },
              ),
         
              /* floatingActionButton: FloatingActionButton(
                 backgroundColor:Colors.indigo,
                 child: Icon(
                   Icons.settings,
                   color: Colors.white,
                 ),
                  onPressed: (){
                                 Navigator.of(context).push(CupertinoPageRoute(builder: (_)=> Settings(
                                 )));
                  }
                 
               ),*/
             );
           }
          }
         
        