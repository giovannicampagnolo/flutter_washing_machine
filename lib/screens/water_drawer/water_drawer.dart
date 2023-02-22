import 'package:flutter/material.dart';
import 'package:flutter_washing_machine/screens/water_drawer/water_slider.dart';
import 'package:provider/provider.dart';

import '../../shared/colors.dart';
import '../../shared/consts.dart';
import '../../shared/widgets/neumorphic_icon_button.dart';
import '../../view_models/main_view_model.dart';

class WaterDrawer extends StatelessWidget {
  const WaterDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainViewModel>(
      builder: (context, viewModel, _) {
        return Container(
          color: CustomColors.primaryColor,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: globalEdgeMarginValue,
                top: drawerButtonMarginTop,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  NeumorphicIconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 18,
                      color: CustomColors.icon,
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                  const SizedBox(height: 35),
                  Text(
                    'Choose water',
                    style: TextStyle(
                      fontSize: 26,
                      color: CustomColors.primaryTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    'Please save choice',
                    style: TextStyle(
                      fontSize: 14,
                      color: CustomColors.primaryTextColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Expanded(
                    child: WaterSlider(
                      minValue: 200,
                      maxValue: 1200,
                      initValue: viewModel.waterValue,
                      onValueChanged: (newValue) =>
                          viewModel.waterValue = newValue,
                    ),
                  ),
                  const SizedBox(height: 80),
                  RichText(
                    text: TextSpan(
                      text: 'Current  ',
                      style: TextStyle(
                        color: CustomColors.primaryTextColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: viewModel.waterValue.toStringAsFixed(0),
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
