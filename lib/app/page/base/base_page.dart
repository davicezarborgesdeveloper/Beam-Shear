import 'package:beamshear/app/core/common/drawer/custom_drawer.dart';
import 'package:beamshear/app/core/styles/colors_app.dart';
import 'package:beamshear/app/core/styles/text_styles.dart';
import 'package:beamshear/app/page/report/report_page.dart';
import 'package:beamshear/app/page/section_type/section_type_page.dart';
import 'package:beamshear/app/page/stirrup_angles/stirrup_angles_page.dart';
import 'package:beamshear/app/page/stirrup_details/stirrup_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../controller/drawer_controller.dart';
import '../characteristics_materials/characteristics_materials_page.dart';
import '../requesting _effort/requestin_effort_page.dart';
import '../servicer_shear_force/servicer_shear_force_page.dart';
import '../transversal_section/transversal_section_data_page.dart';
import '../transverse_reiforcement/transverse_reiforcement_page.dart';
import '../weight_load_data/weight_load_data_page.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  CustomDrawerController pageController = GetIt.I<CustomDrawerController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade400,
        elevation: 4,
        title: Text(
          'Beam Shear',
          style: context.textStyles.textRegular
              .copyWith(fontSize: 28, color: ColorsApp.i.primary),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: ColorsApp.i.primary),
        actions: [
          Container(
            padding: const EdgeInsets.all(8),
            child: Image.asset("assets/images/unb-logo.png"),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: PageView(
        controller: pageController.value,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          SectionTypePage(),
          TransversalSectionDataPage(),
          WeightLoadDataPage(),
          CharacteristicsMaterialsPage(),
          StirrupAnglesPage(),
          RequestinEffortPage(),
          ServicerShearForcePage(),
          TransverseReiforcementPage(),
          StirrupDetailsPage(),
          ReportPage(),
        ],
      ),
    );
  }
}
