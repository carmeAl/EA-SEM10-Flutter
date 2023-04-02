import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application/infrastructure/models/subject.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  Subject? subject;
  List<Subject> subjectList=<Subject>[];
  
  @override
  void initState() {
    super.initState();
    getSubjects();
    
    
  }

  Future getSubjects() async{
    //http://IP_PC:3000/subject/all
    String path='http://192.168.152.104:3000/subject/all';
    var response=await Dio().get(path);
    var registros=response.data as List;
    for(var sub in registros){
      subjectList.add(Subject.fromJson(sub));
    }
    setState(() {
      subjectList=subjectList;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subjects'),
      ),
      body: Column(children: [
        Expanded(child: ListView.builder(
          itemCount: subjectList.length,
          itemBuilder: (BuildContext context,int index){
            return Container(
              padding: EdgeInsets.all(15),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.blue,
                    width: 1
                  )
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(subjectList[index].name,style:const TextStyle(fontSize: 16),),
                  Text(subjectList[index].difficulty,style: TextStyle(fontSize: 14,color: Colors.green),)
                ],
              ),
            );
          })
    )]),
    );
  }
}