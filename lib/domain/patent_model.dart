class Patent {
  final int count;
  final String next;
  final String previous;
  final List<PatentList> patentList;

  Patent({this.count=0, this.next='', this.previous='', required this.patentList});

  factory Patent.fromJson(Map<String, dynamic> parsedJson){
    var list = parsedJson['results'] as List;
    List<PatentList> patents = list.map((i) => PatentList.fromJson(i)).toList();
    return Patent(
        count: parsedJson['count'] ?? 0,
        next: parsedJson['next'] ?? '',
        previous: parsedJson['previous'] ?? '',
        patentList: patents,
    );
  }
}

class PatentList {
  final String applicant;
  final String title;
  final String summary;
  final String url;
  final String applicantNo;

  PatentList({required this.applicant, required this.title, required this.summary, required this.url, required this.applicantNo});

  factory PatentList.fromJson(Map<String, dynamic> parsedJson){
    return PatentList(
        applicant:parsedJson['출원인'] ?? '',
        title:parsedJson['발명의명칭'] ?? '',
        summary:parsedJson['요약'] ?? '',
        applicantNo:parsedJson['출원번호'] ?? '',
        url: 'http://kpat.kipris.or.kr/kpat/remoteFile.do?method=bigFrontDraw&applno=' + parsedJson['출원번호'].replaceAll('-', ''),
    );
  }
}
