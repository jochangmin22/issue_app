import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/pages/home_page.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  String _title = '테크잇슈 - 홈';

  final List<Widget> _widgetOptions = [
    const HomePage(),
    const Text("테크 /업다운"),
    const Text("즐겨찾기"),
    const Text("더보기"),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _title = "";
      switch(_selectedIndex) {
        case 0:
          _title = "테크잇슈";
          break;
        case 1:
          _title = "테크 업/다운";
          break;
        case 2:
          _title = "즐겨찾기";
          break;
        case 3:
          _title = "더보기";
          break;
      }
      //showToast('안녕하세요.');
    });
  }

  void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        centerTitle: false,
        leading: const Icon(Icons.work_outlined),
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.add_alert),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: _selectedIndex == 0? const Icon(Icons.home, color: Colors.white,): const Icon(Icons.home_outlined, color: Colors.white),
              label: 'HOME'
          ),
          BottomNavigationBarItem(
              icon: _selectedIndex == 1? const Icon(Icons.archive, color: Colors.white,):  const Icon(Icons.archive_outlined, color: Colors.white,),
              label: '테크 업/다운'
          ),
          BottomNavigationBarItem(
              icon: _selectedIndex == 2? const Icon(Icons.star, color: Colors.white,): const Icon(Icons.star_border, color: Colors.white),
              label: '즐겨찾기'
          ),
          BottomNavigationBarItem(
              icon: _selectedIndex == 3? const Icon(Icons.view_module, color: Colors.white,): const Icon(Icons.view_module_outlined, color: Colors.white,),
              label: '더보기'
          ),
        ],
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        selectedFontSize: 12,
        iconSize: 20,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF253682),
      ),
    );
  }
}