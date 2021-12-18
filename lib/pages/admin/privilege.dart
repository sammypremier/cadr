import 'package:cadr/shared/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Privilege extends StatefulWidget {

  @override
  PrivilegeState createState() => PrivilegeState();
}

class PrivilegeState extends State<Privilege> {
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
              Text("Reactivate ",
                  style: TextStyle(color: Colors.black)
              ),

              Text("Users ",
                  style: TextStyle(color: Colors.red)
              )

            ],
          )
      ),


      body: SingleChildScrollView(
        child: DataTable(
          columns: <DataColumn>[
            DataColumn(label: Text('Name'),),
            DataColumn(label: Text('Emain'),),
            DataColumn(label: Text('ReActivate'),),

          ],
          rows: <DataRow>[
            DataRow(
                cells: <DataCell>[
                  DataCell(Text('bioku')),
                  DataCell(Text('bioku@gmail.com')),
                  DataCell(
                      Container(
                          child: reactivateButton()
                      )
                  ),
                ]
            ),

            DataRow(
                cells: <DataCell>[
                  DataCell(Text('bioku')),
                  DataCell(Text('bioku@gmail.com')),
                  DataCell(
                      Container(
                          child: reactivateButton()
                      )
                  ),
                ]
            ),

            DataRow(
                cells: <DataCell>[
                  DataCell(Text('bioku')),
                  DataCell(Text('bioku@gmail.com')),
                  DataCell(
                      Container(
                          child: reactivateButton()
                      )
                  ),
                ]
            ),

            DataRow(
                cells: <DataCell>[
                  DataCell(Text('bioku')),
                  DataCell(Text('bioku@gmail.com')),
                  DataCell(
                      Container(
                          child: reactivateButton()
                      )
                  ),
                ]
            ),
          ],
        ),
      ),
    );
  }

  Widget reactivateButton() {
    return Container(
      child: FlatButton.icon(
          minWidth: 10.0,
          label: Text(""),
          textColor: Colors.white,
          color: Colors.green,
          onPressed: () {},

          icon: Icon(Icons.wifi_protected_setup_outlined)
      ),
    );
  }

}
