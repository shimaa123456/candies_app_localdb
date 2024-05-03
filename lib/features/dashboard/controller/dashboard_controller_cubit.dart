import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'dashboard_controller_state.dart';

class DashboardControllerCubit extends Cubit<DashboardControllerState> {
  DashboardControllerCubit() : super(DashboardControllerInitial());
  int selectedTabIndex = 0;
  final PageController pageController = PageController();
  void onChangeTabIndex(int index) {
    selectedTabIndex = index;
    pageController.jumpToPage(selectedTabIndex);
    emit(DashboardControllerInitial());
  }

}
