import 'package:flutter/material.dart';
class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  get isPasswodTextField => true;
  bool showPassword=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding:EdgeInsets.only(),child: Icon(Icons.arrow_back_ios,color:Colors.white,size: 20,),),
        title:
         Padding(
           padding: EdgeInsets.only(right:150),
           child: Text('Settings',style:TextStyle(color:Colors.white))),

        backgroundColor: Color(0xffb1f1e21),
        actions:<Widget>[
          
            
          
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.more_vert),
            color: Colors.white,)
           
        ],),
        
      
      backgroundColor: Colors.black,
      body:Container(
      
      child:GestureDetector(
        onTap: (){FocusScope.of(context).unfocus();},
        child: 
          ListView(

          
  
    children:     [
    
              Center(
    
                child:Padding( padding: const EdgeInsets.fromLTRB(0.0,10.0,0,0),
    
                
    
              child: CircleAvatar(
    
                maxRadius: 100,
    
                backgroundImage: NetworkImage('https://wallpapercave.com/wp/wp4074601.jpg?auto=compress'),
    
                  
    
                    
    
               child: Padding(
                 
                 padding: EdgeInsets.only(left:160,bottom:80), 
                 child: Container(
    
    
    
                 height:100,
    
                 width:100,
    
                 decoration:BoxDecoration(
    
                   shape: BoxShape.circle,
    
                 color:Colors.indigo,
    
                     
    
                 ),
    
                 
    
                 
    
                 child: IconButton(
                   icon:Icon(Icons.camera_alt,color:Colors.white,),
                   onPressed: (){
                      showDialog(context: context,builder: (BuildContext context){
                                        return AlertDialog(
                                          backgroundColor: Colors.black,
                                         content: Column(
                                           mainAxisSize: MainAxisSize.min,
                                           children: [
                                             ListTile(
                                               leading: Icon(Icons.delete,color: Colors.white,),
                                               title: Text("Clear Image",style: TextStyle(color:Colors.white),),
                                               onTap: () {
                                                 
                                               },
                                             ),
                                             ListTile(
                                               leading: Icon(Icons.photo,color: Colors.white,),
                                               title: Text("Pick From Gallery",style: TextStyle(color:Colors.white),),
                                               onTap: (){
                                                
                                                   Navigator.of(context).pop();
                                               },
                                             ),
                                           ],
                                         ),
                                        );
                      });
                   },
                      )
                 
                 ),
                 
                 ),
               
               )
              
              )
                  
    
                ),
              
              
          
              SizedBox(
    
                height:35,
    
              ),
    
              Padding(
    
                padding: const EdgeInsets.all(8.0),
    
                child: TextField(
                  style: TextStyle(color:Colors.white),
                  
    
                  decoration: InputDecoration(
                    fillColor:Colors.white,
                    
    
                    contentPadding: EdgeInsets.only(bottom:3,left: 6),
    
                    labelText:"Name",
                    labelStyle: TextStyle(color:Colors.grey),
                    
    
                    floatingLabelBehavior: FloatingLabelBehavior.always,
    
                    hintText:"Surya",
                    
                    
                    
                    
    
                    hintStyle:TextStyle(
    
                      fontSize:16,fontWeight:FontWeight.bold,
    
                      color:Colors.white,
    
                    )
    
                  ),
    
                ),
    
              ),
    
              Padding(
    
                padding: const EdgeInsets.all(8.0),
    
                child: Padding(
    
                  padding: const EdgeInsets.all(8.0),
    
                  child: TextField(
                    style: TextStyle(color:Colors.white),
    
                    decoration: InputDecoration(
    
                      contentPadding: EdgeInsets.only(bottom:3),
    
                      labelText:"Status",
                      labelStyle: TextStyle(color:Colors.grey),
    
                      floatingLabelBehavior: FloatingLabelBehavior.always,
    
                      hintText:"hakuna matata",
    
                      hintStyle:TextStyle(
    
                        fontSize:16,fontWeight:FontWeight.bold,
    
                        color:Colors.white,
    
                      )
    
                    ),
    
                  ),
    
                ),
    
              ),
    
              Padding(
    
                padding: const EdgeInsets.all(8.0),
    
                child: TextField(
                  style: TextStyle(color:Colors.white),
    
                  obscureText: isPasswodTextField?showPassword:false,
    
                  decoration: InputDecoration(
    
                    suffixIcon:isPasswodTextField? IconButton(
    
                      icon:Icon(Icons.remove_red_eye),color:Colors.grey,onPressed: (){
    
                        setState(() {
    
                          showPassword=!showPassword;
    
                        });
    
                      },):null,
    
                    contentPadding: EdgeInsets.only(bottom:3,left:7),
    
                    labelText:"Password",
                    labelStyle: TextStyle(color:Colors.grey),
    
                    floatingLabelBehavior: FloatingLabelBehavior.always,
    
                    hintText:"*******",
    
                    hintStyle:TextStyle(
    
                      fontSize:16,fontWeight:FontWeight.bold,
    
                      color:Colors.white,
    
                    )
    
                  ),
    
                ),
    
              ),
    
              Padding(
    
                padding: const EdgeInsets.all(8.0),
    
                child: TextField(
                  style: TextStyle(color:Colors.white),
    
                  decoration: InputDecoration(
    
                    contentPadding: EdgeInsets.only(bottom:3,left: 7),
    
                    labelText:"phone",
                    labelStyle: TextStyle(color:Colors.grey),
                    
    
                    floatingLabelBehavior: FloatingLabelBehavior.always,
    
                    hintText:"+91 9390163714",
    
                    hintStyle:TextStyle(
    
                      fontSize:16,fontWeight:FontWeight.bold,
    
                      color:Colors.white,
    
                    )
    
                  ),
    
                ),
    
              ),
    
              
    
              
             Padding(
               
               padding: EdgeInsets.only(left:100,top:10,right:100),
               child: RaisedButton(
    
                    
    
                    color: Colors.indigo,
    
                    padding:EdgeInsets.only(left: 20),
    
                    shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
    
                    onPressed:(){},
    
                    child: Text('save changes',
    
                    style: TextStyle(
    
                      fontSize:14,
    
                      letterSpacing: 2.2,
    
                      color:Colors.white,
    
                    ),),),
             ),
              
   Padding(
     padding: const EdgeInsets.only(left:120,top:30),
     child: ListTile(
        leading: Icon(Icons.power_settings_new,color: Colors.indigo,),
        title: Text('Log out',
        style: TextStyle(
          color:Colors.white
        ),),
      ),
   ),
         
    
              ],
  ),

          
        
      )
      )
        );
  }
}