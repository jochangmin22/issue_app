import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/domain/patent_model.dart';


class PatentAPI {

  static Future<Patent> fetchPatent(final String searchText) async {
    final url = Uri.parse(Uri.encodeFull('http://v2.techvisor.co.kr:8000/integrated-search/es/?format=json&page=1&pageSize=50&searchText='+searchText));
    final response = await http.get(url, headers: {'Accept': 'application/json', 'Accept-Language':'ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7'});

    if (response.statusCode == 200) {
      final Map<String, dynamic> items = jsonDecode(utf8.decode(response.bodyBytes));
      Patent patent = Patent.fromJson(items);
      return patent;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
