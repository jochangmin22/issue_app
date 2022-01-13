import 'package:flutter/material.dart';
import '../domain/Idle_list_vo.dart';
import '../domain/Idle_vo.dart';
import '../ui/select_button.dart';
import '../ui/select_name.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final IdleList _idleList = IdleList();

  late Idle _selectName;

  late Idle _name1;
  late Idle _name2;

  late bool _where;

  bool overlayShouldVisible = false;
  @override
  void initState() {
    super.initState();
    _name1 = _idleList.nextIdle!;
    _name2 = _idleList.nextIdle!;
  }

  void handleSelect(Idle name, bool where) {
    _selectName = name;
    _where = where;
    setState(() {
      overlayShouldVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Column(
          children: <Widget>[
            SelectButton(true, _name1, () => handleSelect(_name1, true)),
            SelectButton(false, _name2, () => handleSelect(_name2, false)),
          ],
        ),
        overlayShouldVisible == true
            ? SelectName(_selectName, _idleList.isEnd, () {
          if (_idleList.isEnd == false) {
            setState(() {
              overlayShouldVisible = false;
              if (_where == true) {
                _name1 = _selectName;
                _name2 = _idleList.nextIdle!;
              } else {
                _name2 = _selectName;
                _name1 = _idleList.nextIdle!;
              }
            });
            return;
          }
        })
            : Container(),
      ],
    );
  }
}