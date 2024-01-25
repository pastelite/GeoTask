import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 60.0,
          horizontal: 80.0,
        ),
        color: Color(0xFFFFFFFF),
        child: Content(),
      ),
    );
  }
}

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Counter('6488009'),
        Counter('Kanatip Bhongsprapas'),
        Counter('GeoTask'),
        Counter('6488009 6488011 6488026 6488182')
      ],
    );
  }
}

class Counter extends StatefulWidget {
  final String _name;
  Counter(this._name);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Move here so that the whole row is clickable
      onTap: () {
        setState(() {
          ++count;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.lightGreen[400]!),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // [widget] is the property of the State class that stores
            // the instance of the [StatefulWidget] ([Counter] in our case)
            _CounterLabel(widget._name),
            _CounterButton(
              count,
              onPressed: () {
                setState(() {
                  ++count;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _CounterLabel extends StatelessWidget {
  static const textStyle = TextStyle(
    color: Color(0xFF000000),
    fontSize: 26.0,
  );

  final String _label;
  const _CounterLabel(this._label);

  @override
  Widget build(BuildContext context) {
    return Text(
      _label,
      style: _CounterLabel.textStyle,
    );
  }
}

class _CounterButton extends StatelessWidget {
  final int count;
  final onPressed;
  _CounterButton(this.count, {@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onPressed, // move the gesture detector to the parent
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        decoration: BoxDecoration(
          color: Colors.lightGreen[400],
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Center(
          child: Text(
            '$count',
            style: const TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
