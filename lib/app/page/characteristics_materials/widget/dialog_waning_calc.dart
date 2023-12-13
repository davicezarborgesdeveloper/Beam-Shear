import 'package:beamshear/app/core/styles/colors_app.dart';
import 'package:beamshear/app/core/styles/text_styles.dart';
import 'package:beamshear/app/page/requesting%20_effort/requestin_effort_page.dart';
import 'package:flutter/material.dart';

class DialogWaningCalc extends StatelessWidget {
  const DialogWaningCalc({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Text(
            'Aviso',
            style: context.textStyles.textRegular,
          ),
          const Icon(
            Icons.warning,
            color: Colors.amber,
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Utilizando o modelo de cálculo II',
            style: context.textStyles.textRegular,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            'Ângulo de estribo de 90°',
            style: context.textStyles.textRegular,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const RequestinEffortPage(),
              ),
            );
          },
          child: Text(
            'OK',
            style: context.textStyles.textRegular
                .copyWith(color: ColorsApp.i.primaryLight),
          ),
        ),
      ],
    );
  }
}
