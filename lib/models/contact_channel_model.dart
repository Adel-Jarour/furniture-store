import 'package:flutter/material.dart';

class ContactChannelModel {
  final String id;
  final String title;
  final String? subtitle;
  final IconData icon;
  final String? actionValue;
  bool isExpanded;

  ContactChannelModel({
    required this.id,
    required this.title,
    this.subtitle,
    required this.icon,
    this.actionValue,
    this.isExpanded = false,
  });
}
