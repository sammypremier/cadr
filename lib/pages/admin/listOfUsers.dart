import 'package:cadr/shared/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListOfUsers extends StatefulWidget {

  @override
  _ListOfUsersState createState() => _ListOfUsersState();
}

class _ListOfUsersState extends State<ListOfUsers> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading? Loading(): Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.2,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("List  of ",
                  style: TextStyle( color: Colors.black)
              ),

              Text("Users ",
                  style: TextStyle( color: Colors.red)
              )

            ],
          )
      ),


      body: SingleChildScrollView(
        child: DataTable(
          columns: <DataColumn>[
            DataColumn(label: Text('Email'),),
            DataColumn(label: Text('Suspend'),),
            DataColumn(label: Text('Delete'),),

          ],
          rows: <DataRow>[
            DataRow(
                cells: <DataCell>[
                  DataCell(Text('bioku@gmail.com')),
                  DataCell(
                      Container(
                          child: suspendButton()
                      )
                  ),
                  DataCell(
                      Container(
                          child: deleteButton()
                      )
                  ),
                ]
            ),

            DataRow(
                cells: <DataCell>[
                  DataCell(Text('john@gmail.com')),
                  DataCell(
                      Container(
                          child: suspendButton()
                      )
                  ),
                  DataCell(
                      Container(
                          child: deleteButton()
                      )
                  ),
                ]
            ),

            DataRow(
                cells: <DataCell>[
                  DataCell(Text('anton@gmail.com')),
                  DataCell(
                      Container(
                          child: suspendButton()
                      )
                  ),
                  DataCell(
                      Container(
                          child: deleteButton()
                      )
                  ),
                ]
            ),

            DataRow(
                cells: <DataCell>[
                  DataCell(Text('setzer@gmail.com')),
                  DataCell(
                      Container(
                          child: suspendButton()
                      )
                  ),
                  DataCell(
                      Container(
                          child: deleteButton()
                      )
                  ),
                ]
            ),

            DataRow(
                cells: <DataCell>[
                  DataCell(Text('tom@gmail.com')),
                  DataCell(
                      Container(
                          child: suspendButton()
                      )
                  ),
                  DataCell(
                      Container(
                          child: deleteButton()
                      )
                  ),
                ]
            ),

            DataRow(
                cells: <DataCell>[
                  DataCell(Text('owen@gmail.com')),
                  DataCell(
                      Container(
                          child: suspendButton()
                      )
                  ),
                  DataCell(
                      Container(
                          child: deleteButton()
                      )
                  ),
                ]
            ),

            DataRow(
                cells: <DataCell>[
                  DataCell(Text('cadr@gmail.com')),
                  DataCell(
                      Container(
                          child: suspendButton()
                      )
                  ),
                  DataCell(
                    Container(
                        child: deleteButton()
                    )
                  ),
                ]
            ),

            DataRow(
                cells: <DataCell>[
                  DataCell(Text('samuel@gmail.com')),
                  DataCell(
                      Container(
                          child: suspendButton()
                      )
                  ),
                  DataCell(
                      Container(
                          child: deleteButton()
                      )
                  ),
                ]
            ),

            DataRow(
                cells: <DataCell>[
                  DataCell(Text('thomas@gmail.com')),
                  DataCell(
                      Container(
                          child: suspendButton()
                      )
                  ),
                  DataCell(
                      Container(
                          child: deleteButton()
                      )
                  ),
                ]
            ),

            DataRow(
                cells: <DataCell>[
                  DataCell(Text('muller@gmail.com')),
                  DataCell(
                      Container(
                          child: suspendButton()
                      )
                  ),
                  DataCell(
                      Container(
                          child: deleteButton()
                      )
                  ),
                ]
            ),

            DataRow(
                cells: <DataCell>[
                  DataCell(Text('tobby@gmail.com')),
                  DataCell(
                      Container(
                          child: suspendButton()
                      )
                  ),
                  DataCell(
                      Container(
                          child: deleteButton()
                      )
                  ),
                ]
            ),

            DataRow(
                cells: <DataCell>[
                  DataCell(Text('paula@gmail.com')),
                  DataCell(
                      Container(
                          child: suspendButton()
                      )
                  ),
                  DataCell(
                      Container(
                          child: deleteButton()
                      )
                  ),
                ]
            ),

            DataRow(
                cells: <DataCell>[
                  DataCell(Text('chris@gmail.com')),
                  DataCell(
                      Container(
                          child: suspendButton()
                      )
                  ),
                  DataCell(
                      Container(
                          child: deleteButton()
                      )
                  ),
                ]
            ),

            DataRow(
                cells: <DataCell>[
                  DataCell(Text('robert@gmail.com')),
                  DataCell(
                      Container(
                          child: suspendButton()
                      )
                  ),
                  DataCell(
                      Container(
                          child: deleteButton()
                      )
                  ),
                ]
            ),

            DataRow(
                cells: <DataCell>[
                  DataCell(Text('robyn@gmail.com')),
                  DataCell(
                      Container(
                          child: suspendButton()
                      )
                  ),
                  DataCell(
                      Container(
                          child: deleteButton()
                      )
                  ),
                ]
            )
          ],
        ),
      ),
    );
  }
  Widget suspendButton() {
    return Container(
      child: FlatButton.icon(
          minWidth: 10.0,
          label: Text(""),
          textColor: Colors.white,
          color: Colors.yellow,
          onPressed: () {  },

          icon: Icon(Icons.warning_amber_outlined)
      ),
    );
  }



  Widget deleteButton() {
    return Container(
      child: FlatButton.icon(
          minWidth: 10.0,

          label: Text(""),
          textColor: Colors.white,
          color: Colors.red,
          onPressed: () {  },

          icon: Icon(Icons.cancel)
      ),
    );
  }
}
