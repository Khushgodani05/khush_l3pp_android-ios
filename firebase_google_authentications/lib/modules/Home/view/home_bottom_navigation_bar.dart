import 'package:firebase_google_authentications/modules/Home/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<HomeViewModel,int>(
      selector: (context,viewModel)=>viewModel.selectedIndex,
      builder: (context,selectedIndex,child){
        return NavigationBar(
          destinations: context.read<HomeViewModel>().navigationItem.map(
            (model)=>NavigationDestination(icon: model.icon, label: model.name)
            )
            .toList(),
            selectedIndex: selectedIndex,
            onDestinationSelected: (index){
              context.read<HomeViewModel>().changeSelectedIndexEvent(index);
            },
          );

      },
      );
  }
}