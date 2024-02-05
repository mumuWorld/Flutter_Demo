import 'package:flutter/material.dart';
import 'package:mm_flutter_example/Base/MMBaseState.dart';
import 'package:provider/provider.dart';

class MMProviderExample extends StatefulWidget {
  const MMProviderExample({Key? key}) : super(key: key);

  @override
  State<MMProviderExample> createState() => _MMProviderExampleState();
}

class _MMProviderExampleState extends MMBaseState<MMProviderExample> {

  @override
  Widget getBody(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return LogoModel();
      },
      child: const MMLogoExample(),
    );
  }
}


class MMLogoExample extends StatefulWidget {
  const MMLogoExample({Key? key}) : super(key: key);

  @override
  State<MMLogoExample> createState() => _MMLogoExampleState();
}

class _MMLogoExampleState extends State<MMLogoExample> {

  @override
  Widget build(BuildContext context) {
    LogoModel model = context.watch<LogoModel>();
    return Card(
        child: Column(
          children: [
            Transform.rotate(
                angle: model.angle,
                child: FlutterLogo(size: model.size)),
            ControlPannel()
          ],
        ));
  }
}


class LogoModel extends ChangeNotifier {
  double _angle = 0.0;
  double _size = 100.0;

  double get angle => _angle;

  double get size {
    return _size;
  }

  set size(double value) {
    _size = value;
    notifyListeners();
  }

  set angle(double value) {
    _angle = value;
    notifyListeners();
  }
}

class ControlPannel extends StatefulWidget {
  const ControlPannel({Key? key}) : super(key: key);

  @override
  State<ControlPannel> createState() => _ControlPannelState();
}

class _ControlPannelState extends State<ControlPannel> {
  @override
  Widget build(BuildContext context) {
    LogoModel model = context.watch<LogoModel>();

    return Card(
      margin: const EdgeInsets.all(32),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("angle : ${model.angle.toStringAsFixed(2)}"),
                Slider(
                    min: 0,
                    max: 6.28,
                    value: model.angle, onChanged: (value) {
                  model.angle = value;
                })
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Size: ${model.size.toStringAsFixed(2)}"),
                Slider(
                  min: 50,
                    max: 200,
                    value: model.size, onChanged: (value) {
                  model.size = value;
                })
              ],
            )
          ],
        ),
      ),
    );
  }
}
