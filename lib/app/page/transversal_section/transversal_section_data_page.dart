import 'package:beamshear/app/common/input_field.dart';
import 'package:beamshear/app/core/styles/colors_app.dart';
import 'package:beamshear/app/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

import '../../common/top_title.dart';
import '../weight_load_data/weight_load_data_page.dart';

class TransversalSectionDataPage extends StatelessWidget {
  const TransversalSectionDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsApp.i.primaryLight,
        foregroundColor: ColorsApp.i.primaryDark,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const WeightLoadDataPage()),
          );
        },
        child: const Icon(Icons.arrow_forward, color: Colors.white),
      ),
      // drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 8,
              ),
              const TopTitle(
                  title: 'Dados', subtitle: 'Seção Transversal', type: 'T'),
              SizedBox(
                height: 200,
                child: Image.asset('assets/images/t_bfw.png'),
              ),
              const InputField(
                label: 'bf',
                suffix: Text('cm'),
              ),
              const InputField(
                label: 'bw',
                suffix: Text('cm'),
              ),
              const InputField(
                label: 'c',
                suffix: Text('cm'),
              ),
              const InputField(
                label: 'd',
                suffix: Text('cm'),
              ),
              const SizedBox(
                height: 64,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
