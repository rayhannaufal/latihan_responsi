import 'package:flutter/material.dart';
import 'package:latihan_responsi/load_data/api_source.dart';
import 'package:latihan_responsi/models/news_model.dart';
import 'package:url_launcher/url_launcher.dart';


class NewsDetailPage extends StatelessWidget {
  final int id;
  final String param;
  const NewsDetailPage({super.key, required this.id, required this.param});

   Future<Map<String, dynamic>> getFuture(param) {
    switch (param) {
      case 'News':
        return ApiSource.instace.getNewsDetail(id);
      case 'Blogs':
        return ApiSource.instace.getBlogsDetail(id);
      case 'Reports':
        return ApiSource.instace.getReportsDetail(id);
      default:
        return ApiSource.instace.getNewsDetail(id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${param.toUpperCase()} DETAIL"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getFuture(param), 
        builder: (BuildContext context,AsyncSnapshot<dynamic> snapshot) {
          Results news = Results.fromJson(snapshot.data);
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(
                children: [
                  Image.network(
                    news.imageUrl!,
                    fit: BoxFit.fill,
                    height: MediaQuery.sizeOf(context).height/2.5,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    news.title!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(news.summary!),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      launchUrl(Uri.parse(news.url!));
                    }, 
                    child: Text('See more...')
                  )
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}