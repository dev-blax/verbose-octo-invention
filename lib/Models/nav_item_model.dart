import 'package:explore_larosa_mobile/Models/rive_model.dart';

class NavItemModel {
  final String title;
  final RiveModel rive;

  NavItemModel({required this.title, required this.rive});
}

List<NavItemModel> bottomNavItems = [
  NavItemModel(
    title: 'Chat',
    rive: RiveModel(
      src: 'assets/riv_assets/animated_icon_set.riv',
      artboard: 'CHAT',
      stateMachine: 'CHAT_Interactivity',
    ),
  ),
  NavItemModel(
    title: 'Search',
    rive: RiveModel(
      src: 'assets/riv_assets/animated_icon_set.riv',
      artboard: 'SEARCH',
      stateMachine: 'SEARCH_Interactivity',
    ),
  ),
  NavItemModel(
    title: 'Timer',
    rive: RiveModel(
      src: 'assets/riv_assets/animated_icon_set.riv',
      artboard: 'TIMER',
      stateMachine: 'TIMER_Interactivity',
    ),
  ),
  NavItemModel(
    title: 'Notification',
    rive: RiveModel(
      src: 'assets/riv_assets/animated_icon_set.riv',
      artboard: 'BELL',
      stateMachine: 'BELL_Interactivity',
    ),
  ),
  NavItemModel(
    title: 'Profile',
    rive: RiveModel(
      src: 'assets/riv_assets/animated_icon_set.riv',
      artboard: 'USER',
      stateMachine: 'USER_Interactivity',
    ),
  ),
];
