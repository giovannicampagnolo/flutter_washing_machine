import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../shared/colors.dart';
import '../../shared/widgets/neumorphic_container.dart';
import '../../view_models/timer_view_model.dart';

class TimerPanel extends StatefulWidget {
  const TimerPanel({Key? key}) : super(key: key);

  @override
  TimerPanelState createState() => TimerPanelState();
}

class TimerPanelState extends State<TimerPanel> {
  @override
  Widget build(BuildContext context) {
    return NeumorphicContainer(
      width: 115,
      height: 52,
      pressed: true,
      border: Border.all(color: CustomColors.timerPanelBorder, width: 2),
      child: Center(
        child: Consumer<TimerViewModel>(
          builder: (context, viewModel, _) {
            return Text(
              viewModel.remainigString,
              style: TextStyle(
                color: CustomColors.secondaryTextColor,
                letterSpacing: 3,
                fontSize: 22,
              ),
            );
          },
        ),
      ),
    );
  }
}
