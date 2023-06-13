import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ThinkSpeakViewModel extends ChangeNotifier {
  List<ThinkSpeakModel> _feeds = [];
  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;

  List<ThinkSpeakModel> get feeds => _feeds;

  Future<void> fetchFeeds() async {
    var path = 'https://thingspeak.com/channels/1880622/feeds.json?results=2';
    final response = await Dio().get(path);
    final feedsJson = response.data['feeds'];

    final List<ThinkSpeakModel> feeds = [];

    for (final feedJson in feedsJson) {
      final feed = ThinkSpeakModel.fromJson(feedJson);
      feeds.add(feed);
    }

    _feeds = feeds;
    _isLoaded = true;
    notifyListeners();
  }
}

class ThinkSpeakModel {
  ThinkSpeakModel({
    required this.field1,
    required this.field2,
    required this.field3,
    required this.field4,
    required this.field5,
  });

  factory ThinkSpeakModel.fromJson(Map<String, dynamic> json) {
    return ThinkSpeakModel(
      field1: json['field1'],
      field2: json['field2'],
      field3: json['field3'],
      field4: json['field4'],
      field5: json['field5'],
    );
  }

  final String field1;
  final String field2;
  final String field3;
  final String field4;
  final String field5;
}
