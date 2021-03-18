import 'package:PiPerChat/model/model/chat.dart';
import 'package:PiPerChat/model/model/story_model.dart';
import 'package:PiPerChat/model/model/usermodel.dart';
import 'package:PiPerChat/size_config.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import '../data.dart';
import 'ChatScreen.dart';
class Shots extends StatefulWidget {
  @override
   _ShotsState createState() => _ShotsState();
}

class _ShotsState extends State<Shots> {
   @override
   Widget build(BuildContext context){
     
  
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left:10,),
                  child: Row(
            children: [
              Icon(Icons.search,),
              
            ],
          ),
        ),
        title:Padding(padding: EdgeInsets.only(left:90),
        child: Text('Shots',style:TextStyle(color:Colors.indigo))),
        backgroundColor: Colors.black,
        
          
           
        ),
        backgroundColor: Colors.black,
          body: Container(
        child: Column(children:[ 
          SizedBox(height: 20,),
          Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 150,
                  
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: messageData.length,
                  itemBuilder:(context,index){
                    return PiperShots(
                      imageUrl:messageData[index].imageurl,
                      categoryName:messageData[index].name,                );
                  },),
                ), 
        ]),
         
      ),
    );
  }
 }
 class PiperShots extends StatelessWidget {
  final String imageUrl,categoryName;
  PiperShots({this.imageUrl,this.categoryName});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Column(
      children: [
       
        GestureDetector(
          onTap: (){
            //Navigator.push(context, MaterialPageRoute(builder: 
           // (context)=>CategoryNews(category:categoryName.toLowerCase())));
          },
              child: Container(
            margin: EdgeInsets.only(right:0),
            child:Stack(
              
  
          children:     <Widget> [
            
          
                    ClipRRect(
          
                      borderRadius: BorderRadius.circular(6),
          
                      child: CachedNetworkImage(imageUrl:imageUrl,width: 110,
                      height: getProportionateScreenHeight(140),fit: BoxFit.cover,)),
          
                    Row(
                      children: [
                        Container(
          
                          alignment: Alignment.bottomLeft,
                          padding: EdgeInsets.only(bottom:5),
          
                          width: 120,height: 150,
          
                          decoration: BoxDecoration(
          
                            borderRadius:BorderRadius.circular(6),
          
                             color: Colors.black26,
          
                          ),
          
                         
          
                          child:Row(
                            children: [
                               GestureDetector(
                                 onTap: (){
                                   Navigator.of(context).push(CupertinoPageRoute(builder: (_)=> StoryScreen(stories: stories
                                 ),));
                                 },
                                                                child: CircleAvatar(
                maxRadius: 15,
                backgroundImage:NetworkImage(imageUrl),
                
              ),
                               ),
              SizedBox(width:5),
                              Text(categoryName,style:TextStyle(color: Colors.white
          
                              ,
          
                              fontSize: 14,
          
                              fontWeight: FontWeight.w500)),
                            ],
                          )
          
                   
  ),
                      ],
                    ),
],
            )
          ),
        ),
      ],
    );
  }
}


class StoryScreen extends StatefulWidget {
  final List<Story> stories;
  const StoryScreen({@required this.stories});
  @override
   _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen>
with SingleTickerProviderStateMixin {
  PageController _pageController;
  AnimationController _animController;
  VideoPlayerController _videoController;
  int _currentindex = 0;
   @override
   void initState(){
     super.initState();
     _pageController = PageController();
     _animController= AnimationController(vsync: this);
    final Story firstStory = widget.stories.first;
    _loadStory(story:firstStory,animateToPage:false);
     _animController.addStatusListener((status) {
       if (status == AnimationStatus.completed){
         _animController.stop();
         _animController.reset();
         setState(() {
           if(_currentindex + 1 < widget.stories.length){
             _currentindex +=1;
             _loadStory(story: widget.stories[_currentindex]);
           }else{
             //out of bounds - loop story
             //you can also navigator.of(context).pop here
             _currentindex=0;
             _loadStory(story:widget.stories[_currentindex]);
           }
         });
       }
      });
   }

@override
void dispose(){
  _pageController.dispose();
  _animController.dispose();
  _videoController?.dispose();
  super.dispose();
}

@override
   Widget build(BuildContext context){
     final Story story = widget.stories[_currentindex];
    return Scaffold(
      backgroundColor: Colors.black,
          body: Column(
            children: [
              Container(
                height: 780,
         child: GestureDetector(
               onTapDown: (details) => _onTapDown(details,story),
                      child: Stack(
                        children: [
                          PageView.builder(
               controller: _pageController,
               physics: NeverScrollableScrollPhysics(),
               itemCount: widget.stories.length,
               itemBuilder:(context,i){
                 final Story story=widget.stories[i];
                 switch (story.media){
                   case MediaType.image:
                    return CachedNetworkImage(
                            imageUrl: story.url,
                            fit: BoxFit.cover,
                    );
                   case MediaType.video:
                    if(_videoController != null &&
                    _videoController.value.initialized){
                          return FittedBox(
                            fit:BoxFit.fill,
                            child: SizedBox(
                              width:_videoController.value.size.width,
                              height:_videoController.value.size.height,
                              child:VideoPlayer(_videoController),
                            ),
                          );
                    }
                 }
                 return const SizedBox.shrink();
               },
               
               ),
               Positioned(
                 top: 40.0,
                 left:10.0,
                 right: 10.0,
                 child: Column(
                   children: [
                     Row(
                       children: widget.stories.asMap()
                                  .map((i, e) {
                                    return MapEntry(
                                      i,
                                      AnimatedBar(
                                        animController:_animController,
                                        position:i,
                                        currentIndex:_currentindex,
                                      ),
                                      );
                                    
                                  })
                                  .values
                                  .toList()
                                  ,),
                                  Padding(padding: const EdgeInsets.symmetric(
                                    horizontal: 1.5,
                                    vertical:10,
                                  ),
                                  child: UserInfo(user: story.user,),)
                   ],
                 )
                              
                              )
                        ],
                      ),
         ),
      ),
      Container(
        height: 60,
        color: Colors.black,
                      alignment: Alignment.bottomCenter,
                                          child: Container(
                                            constraints: BoxConstraints(
                                              maxWidth:280,
                                              maxHeight: getProportionateScreenHeight(50),

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
                       child:Row(children:[
                        SizedBox(width:5),
                          Text('Send reply',style:TextStyle(color:Colors.grey,fontSize: 14)),
                        ])
                      ),
                    ),

            ],
          ),
    );
  }
  void _onTapDown(TapDownDetails details,Story story){
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;
    if (dx<screenWidth/3){
      setState(() {
        if(_currentindex -1>=0){
          _currentindex-=1;
          _loadStory(story:widget.stories[_currentindex]);
        }
      });
    }else if(dx >2*screenWidth/3){
      setState(() {
        if (_currentindex +1 < widget.stories.length){
          _currentindex+=1;
           _loadStory(story:widget.stories[_currentindex]);
        }else{
          _currentindex=0;
           _loadStory(story:widget.stories[_currentindex]);
        }
      });
    }else{
      if(story.media == MediaType.video){
        if(_videoController.value.isPlaying)

        {
          _videoController.pause();
          _animController.stop();
        }else
      {
         _videoController.play();
         _animController.forward();
      }
      
    }
  }
  }
void _loadStory({Story story,bool animateToPage = true}){
  _animController.stop();
  _animController.reset();
  switch (story.media){
    case MediaType.image:
      _animController.duration=story.duration;
      _animController.forward();
      break;
    case MediaType.video:
    _videoController = null;
    _videoController?.dispose();
    _videoController = VideoPlayerController.network(story.url)
    ..initialize().then((_){
      setState(() {
        
      });
      if (_videoController.value.initialized){
        _animController.duration = _videoController.value.duration;
        _videoController.play();
        _animController.forward();
      }

    } );
    break;
}

  if (animateToPage){
    _pageController.animateToPage(
      _currentindex,
      duration: const Duration(milliseconds:1),
      curve: Curves.easeInOut,
    );
  }
 }
}


class AnimatedBar extends StatelessWidget {
  final AnimationController animController;
  final int position;
  final int currentIndex;

  const AnimatedBar({
    Key key,
    @required this.animController,
    @required this.position,
    @required this.currentIndex,
  }):super(key:key);
  @override
  Widget build(BuildContext context){
    return Flexible(child: Padding(
      padding: const EdgeInsets.symmetric(horizontal:1.5),
      child: LayoutBuilder(builder: (context,constraints){
        return Stack(
          children:[
            _buildContainer(
              double.infinity,
              position<currentIndex
                ?Colors.white
                :Colors.white.withOpacity(0.5),
            ),
            position == currentIndex
              ?AnimatedBuilder(animation: animController, 
              builder: (context,child){
                return _buildContainer(
                  constraints.maxWidth*animController.value,
                  Colors.white,
                );
              })
              :const SizedBox.shrink(),
          ]
        );
      }),
    ));
  }

  Container _buildContainer(double width,Color color){
  return Container(
    height: 3.0,
    width: width,
    decoration: BoxDecoration(
      color:color,
      border:Border.all(
        color:Colors.black26,
        width:0.8,
      ),
      borderRadius: BorderRadius.circular(3.0)
    ),
  );
}



}
class UserInfo extends StatelessWidget{
  final User user;
 

  const UserInfo({
    Key key,
    @required this.user,


  }):super(key:key);

  
  @override
  Widget build (BuildContext context){
    return Row(children: [
      CircleAvatar(radius:20.0,
      backgroundImage: CachedNetworkImageProvider(user.profileImageUrl),),
      const SizedBox(width:10.0),
      Expanded(child: Text(
        user.name,
        style: const TextStyle(
          color:Colors.white,
          fontSize:15.0,
          fontWeight: FontWeight.w600,
         
          
        ),
      )),
     // IconButton(icon: const Icon(Icons.close,size: 30,color: Colors.white,),
       //onPressed: (){},
       //),
    ],);
  }

}







 

