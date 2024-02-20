import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class AppData {
  const AppData({
    required this.id,
    required this.name,
    required this.seedColor,
  });

  final String id;
  final String name;
  final Color seedColor;
}

class MyFlutterGalleryData {
  const MyFlutterGalleryData({
    this.selectedApp,
    this.apps = const [],
  });

  final AppData? selectedApp;
  final List<AppData> apps;

  MyFlutterGalleryData copyWith({
    AppData? selectedApp,
    List<AppData>? apps,
  }) {
    return MyFlutterGalleryData(
      selectedApp: selectedApp ?? this.selectedApp,
      apps: apps ?? this.apps,
    );
  }
}

class MyFlutterGalleryCubit extends Cubit<MyFlutterGalleryData> {
  MyFlutterGalleryCubit(super.initialData);

  void setAppById(String appId) {
    final currentApps = state.apps;
    final find = currentApps.where((app) => app.id == appId).firstOrNull;
    if (find == null) return;
    emit(
      state.copyWith(
        selectedApp: find,
      ),
    );
  }
}
