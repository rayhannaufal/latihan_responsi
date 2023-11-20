import 'package:flutter/material.dart';
import 'package:latihan_responsi/pages/news_list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SPACE FLIGHT NEWS'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            CardMenu(
              context, 
              'assets/news.png', 
              'NEWS',
              'Get an overview of the latest Spaceflight news, from various sources! Easily link your users to the right websites',
              const NewsList(param: 'News')
            ),
            CardMenu(
              context, 
              'assets/blogs.png', 
              'BLOGS',
              'Blogs often provide a more detailed overview of launches and missions. A must-have for the serious spaceflight enthusiast',
              const NewsList(param: 'Blogs')
            ),
            CardMenu(
              context, 
              'assets/reports.png', 
              'REPORTS',
              'Space stations and other missions often publish their data. With SNAPI, you can include it in your app as well!',
              const NewsList(param: 'Reports')
            ),
          ],
        ),
      ),
    );
  }

  Widget CardMenu(context, image, title, desc, link) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context, MaterialPageRoute(
            builder: (context) => link, 
          )
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.network(
                image,
                height: MediaQuery.sizeOf(context).height/4,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                desc,
                style: const TextStyle(
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}