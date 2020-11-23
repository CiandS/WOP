import 'package:flutter/material.dart';
import 'package:work_order_process/models/scrap_details.dart';
import 'package:work_order_process/screens/scrap/scrap_screen.dart';
import 'package:work_order_process/screens/work_order_history/work_order_history.dart';

class AnimatedFab extends StatefulWidget {
  final Function() onPressed;
  final String tooltip;
  final IconData icon;

  AnimatedFab({this.onPressed, this.tooltip, this.icon});

  @override
  _AnimatedFabState createState() => _AnimatedFabState();
}

class _AnimatedFabState extends State<AnimatedFab>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: Colors.blue[800],
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget add() {
    return Container(
      child: FloatingActionButton(
        onPressed: () => Navigator.push(context,
            new MaterialPageRoute(builder: (context) => WOHistoryPage())),
        tooltip: 'Add',
        child: Icon(Icons.history),
      ),
    );
  }

  Widget image() {
    return Container(
        child: FloatingActionButton(
      heroTag: null,
      onPressed: () => Navigator.push(
          context, new MaterialPageRoute(builder: (context) => ScrapScreen())),
      tooltip: 'Image',
      child: Icon(
        Icons.auto_delete,
      ),
    ));
  }

  // Widget inbox() {
  //   return Container(
  //     child: FloatingActionButton(
  //       heroTag: null,
  //       onPressed: null,
  //       tooltip: 'Inbox',
  //       child: Icon(Icons.inbox),
  //     ),
  //   );
  // }

  Widget toggle() {
    return Container(
      child: FloatingActionButton(
        heroTag: null,
        backgroundColor: _buttonColor.value,
        onPressed: animate,
        tooltip: 'Toggle',
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animateIcon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 2.0,
            0.0,
          ),
          child: add(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 1.0,
            0.0,
          ),
          child: image(),
        ),
        toggle(),
      ],
    );
  }
}
