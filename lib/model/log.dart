class Log {
  String id;
  String written;
  DateTime date;

  Log({required this.id, required this.written, required this.date});

  static List<Log> fromJson(json) {
    List<Log> logs = [];
    for (int i = 0; i < json.length; i++) {
      logs.add(Log(
          id: json[i]['_id'],
          written: json[i]['logString'],
          date: DateTime.parse(json[i]['date'])));
    }
    return logs;
  }
}
