import 'package:cryptocurrency_chart_app/presentation/components/home_appbar.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          const HomeAppBar(userName: "dens", userPhotoPath: "adsfas"),
        ];
      },
      body: const Placeholder(),
    );
  }
}
