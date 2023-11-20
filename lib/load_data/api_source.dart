import 'package:latihan_responsi/load_data/load_data.dart';

class ApiSource {
  static ApiSource instace = ApiSource();

  Future<Map<String, dynamic>> getNews() {
    return LoadData.get("articles/?format=json");
  }

  Future<Map<String, dynamic>> getNewsDetail(int id) {
    return LoadData.get("articles/$id/?format=json");
  }

  Future<Map<String, dynamic>> getBlogs() {
    return LoadData.get("blogs/?format=json");
  }

  Future<Map<String, dynamic>> getBlogsDetail(int id) {
    return LoadData.get("blogs/$id/?format=json");
  }

  Future<Map<String, dynamic>> getReports() {
    return LoadData.get("reports/?format=json");
  }

  Future<Map<String, dynamic>> getReportsDetail(int id) {
    return LoadData.get("reports/$id/?format=json");
  }
}