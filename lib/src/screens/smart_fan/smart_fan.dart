import 'package:homes/provider/base_view.dart';
import 'package:homes/src/screens/smart_fan/components/expandable_bottom_sheet.dart';
import 'package:homes/view/smart_fan_view_model.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'components/body.dart';

class SmartFan extends StatelessWidget {
  static String routeName = '/smart-fan';
  const SmartFan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SmartFanViewModel>(
        onModelReady: (model) => {},
        builder: (context, model, child) {
          return Material(
            child: SlidingUpPanel(
              controller: model.pc,
              backdropEnabled: true,
              boxShadow: const [],
              body: Scaffold(
                backgroundColor: const Color(0xFFF2F2F2),
                body: Body(
                  model: model,
                ),
              ),
              panel: ExpandableBottomSheet(model: model),
            ),
          );
        });
  }
}
