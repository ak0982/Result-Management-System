import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:result_management_system/Dashboard/other/ReadExcel.dart';
import 'package:result_management_system/Dashboard/admin/Add_One_Student.dart';
class ADDStudentHomeScreen extends StatefulWidget{
@override
_ADDStudentHomeScreen createState()=> _ADDStudentHomeScreen();
}

class _ADDStudentHomeScreen extends State<ADDStudentHomeScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.lightBlueAccent,
        title: Text("Add Student" ,style: TextStyle(fontSize: 20,),),

      ),

      bottomNavigationBar: BottomNavigationBar(
        type:BottomNavigationBarType.fixed,
        items:[
          BottomNavigationBarItem(icon: Icon(Icons.home),title:Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.arrow_back_ios),title:Text("back")),
        ],
      ),
      body: Stack(


        children: <Widget>[
          Container(
            // margin: EdgeInsets.only(top:170),
            color: Colors.white,
            child: GridView.count(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              //childAspectRatio: MediaQuery.of(context).size.width/(MediaQuery.of(context).size.height/2.5),
              primary: false,

              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Add_One_Student()),
                      );
                    });
                  },


                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius:  BorderRadius.circular(15),
                    ),
                    elevation: 8,
                    color: Colors.white,
                    shadowColor: Colors.pinkAccent,
                    margin: EdgeInsets.only(left:15,right:15,bottom: 25,top:25),

                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height:15,
                        ),
                        Image.asset("images/graduated.png",height: 70 ,width:40,color: Colors.pinkAccent,),
                        Text('Add One Students', style: TextStyle(fontSize: 25,),),

                      ],

                    ),

                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReadExcel()),
                      );
                    });
                  },


                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius:  BorderRadius.circular(15),
                    ),
                    elevation: 8,
                    color: Colors.white,
                    shadowColor: Colors.pinkAccent,
                    margin: EdgeInsets.only(left:15,right:15,bottom: 25,top:25),

                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height:15,
                        ),
                        Image.asset("images/graduated.png",height: 70 ,width:40,color: Colors.pinkAccent,),
                        Text('Add Students from Excel', style: TextStyle(fontSize: 25,),),

                      ],

                    ),

                  ),
                ),




                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius:  BorderRadius.circular(15),
                  ),
                  elevation: 8,
                  shadowColor: Colors.pinkAccent,
                  margin: EdgeInsets.only(left:15,right:15,bottom:25,top:25),
                  child: Column(
                    children: <Widget>[
                      Image.asset("images/contact.png",height: 70 ,width:40,color: Colors.pinkAccent,),
                      Text('Contact',style: TextStyle(fontSize:25),),
                    ],
                  ),
                ),


              ],

            ),
          ),
        ],
      ),




    );
  }
}