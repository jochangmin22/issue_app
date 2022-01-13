import 'Idle_vo.dart';

class IdleList {
  final List<Idle> _idleList = [];
  int _index = -1;

  IdleList() {
    _idleList.add(Idle("전지연"));
    _idleList.add(Idle("김희선"));
    _idleList.add(Idle("이영자"));
    _idleList.add(Idle("김남주"));
    _idleList.add(Idle("강부자"));
    _idleList.add(Idle("강예원"));
    _idleList.add(Idle("고준희"));
    _idleList.add(Idle("공효진"));
    _idleList.add(Idle("구하라"));
    _idleList.add(Idle("김가은"));
    _idleList.add(Idle("남규리"));
    _idleList.add(Idle("문소리"));
    _idleList.add(Idle("남상미"));
    _idleList.add(Idle("박하선"));
    _idleList.add(Idle("이소라"));
    _idleList.add(Idle("쯔위"));

    _idleList.shuffle();
  }

  List<Idle> get idle => _idleList;
  int get length => _idleList.length;

  Idle? get nextIdle {
    _index++;
    if (_index >= length) return null;
    return _idleList[_index];
  }

  bool get isEnd {
    if ((_index + 1) == length) {
      return true;
    } else {
      return false;
    }
  }
}