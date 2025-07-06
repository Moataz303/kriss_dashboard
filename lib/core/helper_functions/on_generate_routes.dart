import 'package:flutter/material.dart';
import '../../features/add_product/presentation/views/add_product_view.dart';
import '../../features/dashboard/views/dashboard_view.dart';
import '../widgets/navigate_to_page_widget.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DashboardView.routeName:
      return NavigateToPageWidget(const DashboardView());
    case AddProductView.routeName:
      return NavigateToPageWidget(const AddProductView());
    default:
      return NavigateToPageWidget(const Scaffold());
  }
}
