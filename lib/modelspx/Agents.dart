
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../responsive.dart';
class Agent {
   Agent({required this.email, required this.id});

   final String id;
   final String email;
}
class AgentData {

   final String number;
   final String name;
   final bool active;
   final String id;
   final int rating;
   final String image;
   final String hostel;
   final String state;

   final String hostelID;
   final bool disable;
   final Timestamp disablestamp;
   final bool online;
   final int deliveries;


   AgentData({
      required this.number,
      required this.active,
      required this.image,
      required this.hostel,
      required this.hostelID,
      required this.disable,
      required this.online,
      required this.name,
      required this.id,
      required this.disablestamp,
      required this.state,

      required this.rating,
      required this.deliveries

   });

   AgentData.fromJson(Map<String, Object?> json)
       : this(
      number: json['number']! as String,
      hostel: json['hostel']! as String,
      image: json['image']! as String,
      deliveries: json['deliveries']! as int,
      rating: json['rating']! as int,
      active: json['active']! as bool,
      hostelID: json['hostelID']! as String,
      name: json['name']! as String,
      id: json['id']! as String,
      disable: json['disable']! as bool,
      online: json['online']! as bool,
      state: json['state']! as String,
      disablestamp: json['disablestamp']! as Timestamp,



   );

   Map<String, Object?> toJson() {
      return {
         'id': id!=null?id:"",
         'name': name!=null?name:"",
         'rating': rating!=null?rating:0,
         'deliveries': deliveries!=null?deliveries:0,
         'number': id!=null?number:"",
         'active': active!=null?active:false,
         'hostelID': hostel!=null?hostel:"",
         'disable': disable!=null?disable:false,
         'online': online!=null?online:false,
         'state': state!=null?state:"",
         'image': image!=null?image:"",
         'disablestamp': disablestamp!=null?disablestamp:Timestamp(0, 0),
         'hostelID': hostelID!=null?hostelID:"",


      };
   }

}









List<AgentData> items(QuerySnapshot snapshot ){
   return snapshot.docs.map((doc){
      return AgentData(
         name: doc.get('name') ,
         image: doc.get('image'),
         online: doc.get('online')??false,
         hostel: doc.get('hostel'),
         hostelID: doc.get('hostelID'),
         id: doc.get('id'),
         state: doc.get('state'),

         number: doc.get("number"),
         active: doc.get('active')??false,
         disable: doc.get('disable')??false,
         deliveries: doc.get('deliveries')??0,
         rating: doc.get('rating')??0,
         disablestamp: doc.get('disablestamp')??Timestamp(0, 0),


      );
   }).toList();
}




Stream<List<AgentData>> get getAgents{

   return FirebaseFirestore.instance.collection("Agents").snapshots().map(items);
}



Stream<List<AgentData>> get getActiveAgents{

   return FirebaseFirestore.instance.collection("Agents").where("active",isEqualTo: true) .snapshots().map(items);
}


