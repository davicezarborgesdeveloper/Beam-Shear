import 'package:beamshear/app/core/styles/colors_app.dart';
import 'package:beamshear/app/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class ButtonTile extends StatelessWidget {
  final String image;
  final String title;
  final GestureTapCallback? onTap;
  const ButtonTile(
      {required this.image, required this.title, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Material(
        elevation: 5,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        child: Center(
          child: Ink(
            decoration: const BoxDecoration(
              // border: Border.all(width: 5, color: Colors.black),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              color: Colors.white,
            ),
            width: 200,
            height: 200,
            child: InkWell(
              splashColor: ColorsApp.i.primary,
              onTap: onTap,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 150,
                        child: Image.asset(
                          image,
                        )),
                    const SizedBox(height: 4),
                    Text(
                      title,
                      style: context.textStyles.textBold
                          .copyWith(color: ColorsApp.i.primaryLight),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
