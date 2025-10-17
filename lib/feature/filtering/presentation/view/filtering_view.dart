import 'package:flutter/material.dart';

import 'widgets/filtering_view_body.dart';

class FilteringView extends StatelessWidget {
  const FilteringView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: FilteringViewBody()));
  }
}
