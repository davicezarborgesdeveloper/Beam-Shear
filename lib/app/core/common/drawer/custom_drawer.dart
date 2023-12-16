import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../controller/drawer_controller.dart';

class CustomDrawer extends StatefulWidget {
  // final PageController pageController;
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  CustomDrawerController pageController = GetIt.I<CustomDrawerController>();

  void changePage(int page) {
    Navigator.pop(context);
    pageController.value.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // padding: EdgeInsets.zero,
        children: [
          ListTile(
            title: const Text('Tipo de seção'),
            onTap: () {
              changePage(0);
            },
          ),
          ListTile(
            title: const Text('Dados - Seção transversal'),
            onTap: () {
              changePage(1);
            },
          ),
          ListTile(
            title: const Text('Dados - Carga(q)'),
            onTap: () {
              changePage(2);
            },
          ),
          ListTile(
            title: const Text('Dados - Caracteristicas dos matériais'),
            onTap: () {
              changePage(3);
            },
          ),
          ListTile(
            title: const Text('Esforços Solicitantes'),
            onTap: () {
              changePage(4);
            },
          ),
          ListTile(
            title: const Text('Armadura transversal'),
            onTap: () {
              changePage(5);
            },
          ),
          ListTile(
            title: const Text('Força cortante'),
            onTap: () {
              changePage(6);
            },
          ),
          ListTile(
            title: const Text('Detalhamento dos estribos'),
            onTap: () {
              changePage(7);
            },
          ),
          ListTile(
            title: const Text('Relatório'),
            onTap: () {
              changePage(8);
            },
          ),
        ],
      ),
    );
  }
}
