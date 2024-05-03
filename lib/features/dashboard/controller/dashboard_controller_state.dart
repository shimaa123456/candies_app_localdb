part of 'dashboard_controller_cubit.dart';

@immutable
sealed class DashboardControllerState {}

final class DashboardControllerInitial extends DashboardControllerState {}

class DashboardPageChange extends DashboardControllerState {}
class DashboardControllerUpdated extends DashboardControllerState {}