import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> register(
    BuildContext context, Map<String, dynamic> data, String documentName) {
  return FirebaseFirestore.instance.collection("user").add(data);
}
