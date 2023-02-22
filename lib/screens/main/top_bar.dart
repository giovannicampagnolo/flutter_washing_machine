import 'package:flutter/material.dart';
import 'package:flutter_washing_machine/screens/main/timer_panel.dart';

import '../../shared/colors.dart';
import '../../shared/consts.dart';
import '../../shared/widgets/neumorphic_icon_button.dart';
import '../settings/settings_bottom_sheet.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(
          globalEdgeMarginValue, drawerButtonMarginTop, 18, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          NeumorphicIconButton(
            icon: Icon(
              Icons.settings,
              color: CustomColors.icon,
            ),
            onTap: () {
              showModalBottomSheet<void>(
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (BuildContext context) {
                    return const SettingsBottomSheet();
                  });
            },
          ),
          // ignore: prefer_const_constructors
          TimerPanel()
        ],
      ),
    );
  }
}
