import 'package:flutter/material.dart';
import 'package:myapp/pages/home_list.dart';
import '../util/rest_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  @override
  void dispose() {
    super.dispose();
  }

  void _onSubmitted(String text) {
    print("text:$text");
    PatentAPI.fetchPatent('');
  }


  @override
  Widget build(BuildContext context) {
    //final void Function(String) _onSubmitted;
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // Don't show the leading button
          titleSpacing: 0,
          title: Container(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: Center(
              child: TextField(
                  onSubmitted: _onSubmitted,
                  decoration: const InputDecoration(
                    hintText: '기업명/기술 키워드 검색',
                    hintStyle: TextStyle(color: Color(0xFF253682)),
                    prefixIcon: Icon(Icons.search, color: Color(0xFF253682)),
                    border: InputBorder.none,
                  )
              ),
            ),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Color(0xFF253682),
                ),
              ),
            ),
          ),
          backgroundColor: const Color(0xFFFFFFFF),
          bottom: const PreferredSize(
              child: TabBar(
                  isScrollable: true,
                  padding: EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
                  unselectedLabelColor: Colors.black,
                  labelColor: Color(0xFF253682),
                  indicatorColor: Color(0xFF253682),
                  tabs: [
                    Tab(
                      child: Text('통합'),
                    ),
                    Tab(
                      child: Text('기업'),
                    ),
                    Tab(
                      child: Text('기술'),
                    ),
                    Tab(
                      child: Text('뉴스'),
                    ),
                    Tab(
                      child: Text('공시'),
                    ),
                    Tab(
                      child: Text('임상'),
                    ),
                    Tab(
                      child: Text('칼럼'),
                    )
                  ]
              ),
              preferredSize: Size.fromHeight(50.0)
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: HomeList(),
            ),
            Center(
              child: Text('기업탭'),
            ),
            Center(
              child: Text('기술탭'),
            ),
            Center(
              child: Text('뉴스탭'),
            ),
            Center(
              child: Text('공시탭'),
            ),
            Center(
              child: Text('임상탭'),
            ),
            Center(
              child: Text('칼럼탭'),
            ),
          ],
        ),
      ),
    );
  }
}
