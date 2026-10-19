import 'package:get/get.dart';

class SettingsController extends GetxController {
  final List<Map<String, dynamic>> settingsItems = [
    {
      'title': 'Notification Settings',
      'icon': 'person',
      'route': '/notifications'
    },
    {'title': 'Password Manager', 'icon': 'key', 'route': ''},
    {'title': 'Delete Account', 'icon': 'card', 'route': ''},
  ];
}
