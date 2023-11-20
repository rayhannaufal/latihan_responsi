import 'package:flutter/material.dart';
import 'package:latihan_responsi/load_data/api_source.dart';
import 'package:latihan_responsi/models/news_model.dart';
import 'package:latihan_responsi/pages/news_detail_page.dart';

class NewsList extends StatelessWidget {
  final String param;
  const NewsList({super.key, required this.param});

  Future<Map<String, dynamic>> getFuture(param) {
    switch (param) {
      case 'News':
        return ApiSource.instace.getNews();
      case 'Blogs':
        return ApiSource.instace.getBlogs();
      case 'Reports':
        return ApiSource.instace.getReports();
      default:
        return ApiSource.instace.getNews();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$param List'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getFuture(param), 
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            NewsModel newsList = NewsModel.fromJson(snapshot.data);
            return ListView.builder(
              itemCount: newsList.results!.length,
              itemBuilder: (context, index) {
                var data = newsList.results![index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context, MaterialPageRoute(
                        builder: (context) => NewsDetailPage(id: data.id!, param: param,),
                      )
                    );
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.network(
                            data.imageUrl!,
                            fit: BoxFit.fill,
                            height: MediaQuery.sizeOf(context).height/7,
                            width: MediaQuery.sizeOf(context).width/2.5,
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width/2,
                            child: Text(data.title!)
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }, 
            );
          } else { 
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}