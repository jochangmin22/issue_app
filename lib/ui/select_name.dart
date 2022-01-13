import 'package:flutter/material.dart';
import 'dart:math';
import '../domain/Idle_vo.dart';
import '../pages/landing_page.dart';

class SelectName extends StatefulWidget {
  final Idle _name;
  final VoidCallback _onTap;
  final bool _last;

  const SelectName(this._name, this._last, this._onTap);

  @override
  _SelectNameState createState() => _SelectNameState();
}

class _SelectNameState extends State<SelectName>
    with SingleTickerProviderStateMixin {
  late Animation<double> _ani;
  late AnimationController _aniC;

  @override
  void initState() {
    super.initState();

    _aniC = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _ani = CurvedAnimation(parent: _aniC, curve: Curves.elasticOut);
    _ani.addListener(() => setState(() => {}));
    _aniC.forward();
  }

  @override
  void dispose() {
    _aniC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget._last == false) {
      return Material(
        color: Colors.black54,
        child: InkWell(
          onTap: () => widget._onTap(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Transform.rotate(
                    angle: _aniC.value * 2 * pi,
                    child: Icon(
                      Icons.done,
                      size: _aniC.value * 80.0,
                    ),
                  )),
              const Padding(
                padding: EdgeInsets.only(bottom: 20.0),
              ),
              Text(
                widget._name.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Material(
        color: Colors.red,
        child: Transform.scale(
          scale: _aniC.value * 1.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "우승",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50.0,
                ),
              ),
              Text(
                widget._name.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50.0,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_right),
                color: Colors.white,
                iconSize: 50.0,
                onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (BuildContext context) => const LandingPage()),
                        (Route route) => route == null),
              ),
            ],
          ),
        ),
      );
    }
  }
}