import 'dart:ffi';
import 'dart:math' as math;
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';

class input extends StatefulWidget {
  const input({Key? key}) : super(key: key);

  @override
  State<input> createState() => _inputState();
}

class _inputState extends State<input> {
  @override
  late List<String> ls=[];
  late List<String> lt=[];
  late String str1 = '', str2 = '';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Icon(Icons.notes),
        title: Text("Notepad"),
        actions: [Icon(Icons.info_outline)],
        backgroundColor: Color(0x0FF0A0E00),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            backgroundColor: Color(0x0FF0A0E21),
            isScrollControlled: true,
            builder: (BuildContext context) {
              return Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 35.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.notes),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            'New Note ',
                            style: TextStyle(
                                color: Colors.lightBlue, fontSize: 20.0),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      TextFormField(
                        onChanged: (value) {
                          str1 = value;
                        },
                        maxLength: 12,
                        decoration: InputDecoration(
                            labelText: 'Subject',
                            border: OutlineInputBorder(
                              gapPadding: 8.0,
                              borderSide: BorderSide(
                                  color: Color(0xFF111328), width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0)),
                            )),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      TextFormField(
                        onChanged: (value) {
                          str2 = value;
                        },
                        decoration: InputDecoration(
                            labelText: 'Write her .. ',
                            border: OutlineInputBorder(
                              gapPadding: 8.0,
                              borderSide: BorderSide(
                                  color: Color(0xFF111328), width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0)),
                            )),
                        maxLines: 10,
                      ),
                      SizedBox(
                        height: 18.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {
                                  setState(() {
                                    if (str1.isNotEmpty && str2.isNotEmpty) {
                                      ls.add(str1);
                                      lt.add(str2);
                                      str1='';str2='';
                                      Navigator.pop(context);
                                    }
                                    else
                                        print("enter all data");});

                              },
                              child: Text(
                                'Save',
                                style: TextStyle(fontSize: 20.0),
                              )),
                          SizedBox(
                            width: 25.0,
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Close',
                                style: TextStyle(fontSize: 20.0),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                    ],
                  )));
            },
          );
        },
        child: Icon(Icons.add, color:  Colors.white ),
        backgroundColor: Color(0x0FF0A0E00),
      ),
        body: ListView(
          physics: AlwaysScrollableScrollPhysics(),

          children: List.generate(ls.length, (index) =>  Padding(
            padding:  EdgeInsets.all(10.0),
            child: Container(
              color:  Color(0x0FF0A0E21),
              child: ListTile(
                title: Text(ls[index], style: TextStyle(fontSize: 18.0)),
                subtitle:
                Text(lt[index], style: TextStyle(fontSize: 15.0)),
                leading: Icon(Icons.note),
                trailing: Icon(
                  Icons.edit,
                ),
                onTap: () {
                  str1=ls[index];
                  str2=lt[index];
                  showModalBottomSheet<void>(
                    backgroundColor: Color(0x0FF0A0E21),
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return Padding(
                          padding: MediaQuery.of(context).viewInsets,
                          child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 35.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.edit),
                                      SizedBox(
                                        width: 20.0,
                                      ),
                                      Text(
                                        'Edit Note ',
                                        style: TextStyle(
                                            color: Colors.lightBlue, fontSize: 20.0),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 25.0,
                                  ),
                                  TextFormField(

                                    onChanged: (value) {
                                      str1 = value;
                                    },
                                    maxLength: 12,
                                    decoration: InputDecoration(
                                        labelText: 'Subject',
                                        hintText:ls[index] ,
                                        border: OutlineInputBorder(
                                          gapPadding: 8.0,
                                          borderSide: BorderSide(
                                              color: Color(0xFF111328), width: 2.0),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(32.0)),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  TextFormField(
                                    onChanged: (value) {
                                      str2 = value;
                                    },
                                    decoration: InputDecoration(
                                        labelText: 'Datilse',
                                        hintText:lt[index] ,
                                        border: OutlineInputBorder(
                                          gapPadding: 8.0,
                                          borderSide: BorderSide(
                                              color: Color(0xFF111328), width: 2.0),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(32.0)),
                                        )),
                                    maxLines: 10,
                                  ),
                                  SizedBox(
                                    height: 18.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            setState(() {
                                              if (str1.isNotEmpty && str2.isNotEmpty) {
                                                ls[index]=str1;
                                                lt[index]=str2;
                                                str1='';str2='';
                                                Navigator.pop(context);
                                              }
                                              else
                                                print("enter all data");});

                                          },
                                          child: Text(
                                            'Save',
                                            style: TextStyle(fontSize: 20.0),
                                          )),
                                      SizedBox(
                                        width: 25.0,
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            setState(() {
                                              lt.removeAt(index);
                                              ls.removeAt(index);
                                              Navigator.pop(context);
                                            });

                                          },
                                          child: Text(
                                            'Delete',
                                            style: TextStyle(fontSize: 20.0),
                                          )),
                                      SizedBox(
                                        width: 25.0,
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'Close',
                                            style: TextStyle(fontSize: 20.0),
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                ],
                              )));
                    },
                  );

                },
              ),
            ),
          )),
        )

    );
  }
}
