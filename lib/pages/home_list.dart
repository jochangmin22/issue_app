import 'package:flutter/material.dart';
import 'package:myapp/domain/patent_model.dart';
import '../util/rest_api.dart';

class HomeList extends StatelessWidget {

  //final void Function(String) onSubmitted;

  const HomeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RandomWords(),
    );
  }
}

@override
bool get wantKeepAlive => true;

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<RandomWords> with AutomaticKeepAliveClientMixin<RandomWords> {

  late Future<Patent> patent;

  @override
  void initState() {
    patent = PatentAPI.fetchPatent('');
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Center(
        child: FutureBuilder <Patent>(
          future: patent,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Patent? patent = snapshot.data;
              List<PatentList>? data = patent?.patentList;
              return ListView.builder(
                itemCount: data?.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  PatentList item = data![index];
                  return Container(
                    margin: const EdgeInsets.only(top: 5),
                    height: 100,
                    padding: const EdgeInsets.all(00),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Color.fromRGBO(215, 217, 220, 1),
                        )
                      ),
                    ),
                    child: Row(
                      children: [
                        Image.network(
                          item.url,
                          width: 100,
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 2),
                                  child: Text(
                                    item.title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 2),
                                  child: Text(
                                    item.summary,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color : Color.fromRGBO(60, 63, 65, 0.5),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 2),
                                  child: Text(
                                    item.applicant + '\t' + item.applicantNo,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color : Color.fromRGBO(104, 195, 83, 1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData == false) {
              return const Text('통합 조회중');
            }
            
            return const CircularProgressIndicator();
          },
        ),
      )
    );
  }
}