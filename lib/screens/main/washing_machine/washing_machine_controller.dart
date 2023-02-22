

import '../../../view_models/service_locator.dart';
import '../../../view_models/settings_view_model.dart';
import 'drum/physic/drum_physic.dart';

typedef PaintCallback = Function();

class WashingMachineController {
  WashingMachineController({
    required this.ballsCount,
  }) : physic = DrumPhysic(ballsCount: ballsCount);

  final int ballsCount;
  final DrumPhysic physic;

  double get drumAngle => physic.whirlpoolCoreBody.angle;
  double? get radius => _radius;
  bool get devMode => ServiceLocator.get<SettingsViewModel>().devMode;
  PaintCallback? onNeedPaint;

  double? _radius;
  bool _initalized = false;

  initialize({double? radius}) {
    assert(_initalized != true);
    _initalized = true;

    _radius = radius;
    physic.initialize(radius);
  }

  initializeBalls() {
    physic.initializeBalls();
  }

  hasBalls() {
    return physic.balls.isNotEmpty;
  }

  step(double elapsed) {
    if (_initalized == false) {
      return;
    }

    physic.step(elapsed);
  }

  setAngularVelocity(
    double value, {
    double seconds = 0.0,
    bool stopAtEnd = false,
  }) {
    if (_initalized != true) {
      return;
    }

    physic.setAngularVelocity(value, seconds: seconds, stopAtEnd: stopAtEnd);
  }

  redraw() {
    if (onNeedPaint != null) {
      onNeedPaint!();
    }
  }
}
