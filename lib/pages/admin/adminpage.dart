import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {

  @override
  AdminPageState createState() => AdminPageState();
}

class AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(

        // padding: EdgeInsets.only(top:24),
        child: Column(
          children: <Widget>[
            //General Container that holds the first and second columns
            Container(
              //height:MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  //First Container
                  Container(
                    child: Column(
                      children: [
                        Container(
                          height:100,
                          decoration: new BoxDecoration(
                            color: Colors.blueGrey,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.add),
                                iconSize: 30,
                                color: Colors.white,
                                onPressed: () {  },
                              ),

                              Text(
                                  'ADMIN DASHBOARD'
                              ),

                              IconButton(
                                icon: Icon(Icons.account_circle_outlined),
                                iconSize: 30,
                                color: Colors.white,
                                onPressed: () {  },

                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  // the end of the admin Dashboard container


                  //padding between the admin dashboard's container
                  //and the second second container that holds the main contents
                  //of the admin page
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 10.0,
                    ),
                  ),
                  // the padding ends here






                  //this first container is the general wrapper container of the main contents of admin page
                  Container(
                    child: Column(

                      children: [
                        //this container here is the only child in the general wrapper container
                        // in this only child container, there are 5 different containers
                        // all of which rows and are its direct children

                        Container(

                          //height: 560,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [

                              Container(
                                width:129,
                                 height:MediaQuery.of(context).size.height,
                                decoration: BoxDecoration(
                                   color: Colors.blueGrey,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(height: 20),

                                    SizedBox(
                                      height: 33.0,
                                      width: 110,
                                      child: ElevatedButton.icon(

                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                          primary: Colors.black,
                                          backgroundColor: Colors.white,
                                        ),
                                        label: Text('Posted News'),
                                        icon: Icon(
                                            Icons.assignment_turned_in_outlined,
                                            color: Colors.green,
                                            size: 18

                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),

                                    SizedBox(
                                      height: 33.0,
                                      width: 110,
                                      child: ElevatedButton.icon(

                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                          primary: Colors.black,
                                          backgroundColor: Colors.white,
                                        ),
                                        label: Text('Send SMS'),
                                        icon: Icon(
                                            Icons.mail_outline,
                                            color: Colors.green,
                                            size: 18

                                        ),
                                      ),
                                    ),

                                    SizedBox(height: 20),

                                    SizedBox(
                                      height: 33.0,
                                      width: 110,
                                      child: ElevatedButton.icon(

                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                          primary: Colors.black,
                                          backgroundColor: Colors.white,
                                        ),
                                        label: Text('General'),
                                        icon: Icon(
                                            Icons.add_box_outlined,
                                            color: Colors.green,
                                            size: 18

                                        ),
                                      ),
                                    ),

                                    SizedBox(height: 20),


                                    SizedBox(
                                      height: 33.0,
                                      width: 110,
                                      child: ElevatedButton.icon(

                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                          primary: Colors.black,
                                          backgroundColor: Colors.white,
                                        ),
                                        label: Text('Create Poll'),
                                        icon: Icon(
                                            Icons.add,
                                            color: Colors.green,
                                            size: 18

                                        ),
                                      ),
                                    ),

                                    SizedBox(height: 20),

                                    SizedBox(
                                      height: 33.0,
                                      width: 110,
                                      child: ElevatedButton.icon(

                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                          primary: Colors.black,
                                          backgroundColor: Colors.white,
                                        ),
                                        label: Text('View Users'),
                                        icon: Icon(
                                            Icons.visibility_outlined,
                                            color: Colors.green,
                                            size: 18

                                        ),
                                      ),
                                    ),

                                    SizedBox(height: 20),

                                    SizedBox(
                                      height: 33.0,
                                      width: 110,
                                      child: ElevatedButton.icon(

                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                          primary: Colors.black,
                                          backgroundColor: Colors.white,
                                        ),
                                        label: Text('General'),
                                        icon: Icon(Icons.vpn_lock_outlined,
                                            color: Colors.green,
                                            size: 18

                                        ),
                                      ),
                                    ),

                                    SizedBox(height: 110),

                                    SizedBox(
                                      
                                      height: 110.0,
                                      width: 110,
                                      child: ElevatedButton.icon(
                                          
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                          primary: Colors.black,
                                          backgroundColor: Colors.white,
                                        ),
                                        label: Text(''),
                                        icon: Icon(
                                            Icons.add_box_outlined,
                                            color: Colors.green,
                                            size: 18

                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //The first Container that holds the main contents of the admin page ends here



                              //The Second Container that holds the main contents of the admin page starts here
                              //Second general wrapper Container Row (Right hand side)
                              Container(

                                //width:MediaQuery.of(context).size.width,
                                height:MediaQuery.of(context).size.height,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    //this is the right side and only Container in this column
                                    //that holds the main contents of the admin page and it has 5 Columns inside
                                    Container(
                                      child: Column(
                                        children: [

                                          // this is the first container Column child of the 5 children
                                          Container(
                                            child: Row(

                                              children: [
                                                //first Individual row box in the first child column
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.yellow,
                                                      borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))
                                                  ),
                                                  height: 100,
                                                  width: 110,

                                                ),


                                                SizedBox(width: 10),

                                                //this is the second Individual row box in the first child column
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.blue,
                                                      borderRadius: 
                                                      BorderRadius.all(
                                                          Radius.circular(10))
                                                  ),
                                                  height: 100,
                                                  width: 110,
                                                )
                                              ],
                                            ),
                                          ),

                                          SizedBox(height:10.0),




                                          // this is the second container Column child of the 5 children
                                          Container(
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    //this is the first Individual row box in the second child column
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.black45,
                                                        borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(10))
                                                      ),
                                                      height: 100,
                                                      width: 110,
                                                    ),

                                                    SizedBox(width: 10),

                                                    //this is the second Individual row box in the second child column
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.deepPurpleAccent,
                                                          borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(10)
                                                          )
                                                      ),
                                                      height: 100,
                                                      width: 110,
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),

                                          SizedBox(height:10.0),


                                          // this is the third container Column child of the 5 children
                                          Container(
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    //this is the first Individual row box in the third child column
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.lime,
                                                          borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(10)
                                                          )
                                                      ),
                                                      height: 100,
                                                      width: 110,
                                                    ),

                                                    SizedBox(width: 10),

                                                    //this is the second Individual row box in the third child column
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.cyanAccent,
                                                          borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(10)
                                                          )
                                                      ),
                                                      height: 100,
                                                      width: 110,
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),


                                          SizedBox(height:10.0),

                                          // this is the fourth container Column child of the 5 children
                                          Container(
                                            child: Column(
                                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    //this is the first Individual row box in the fourth child column
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.amberAccent,
                                                          borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(10)
                                                          )
                                                      ),
                                                      height: 100,
                                                      width: 110,
                                                    ),

                                                    SizedBox(width: 10),
                                                    //this is the second Individual row box in the fourth child column
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.brown,
                                                          borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(10)
                                                          )
                                                      ),
                                                      height: 100,
                                                      width: 110,
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),


                                          SizedBox(height:10.0),

                                          // this is the fifth container Column child of the 5 children
                                          Container(
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    //this is the first Individual row box in the fifth child column
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.tealAccent,
                                                          borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(10)
                                                          )
                                                      ),
                                                      height: 100,
                                                      width: 110,
                                                    ),

                                                    SizedBox(width: 10),

                                                    //this is the second Individual row box in the fifth child column
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.purple,
                                                          borderRadius: 
                                                          BorderRadius.all(
                                                              Radius.circular(10)
                                                          )
                                                      ),
                                                      height: 100,
                                                      width: 110,
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),

                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
