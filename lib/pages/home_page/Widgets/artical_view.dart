import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_route/models/ArticalsModel.dart';

class ArticlView extends StatelessWidget {
  Articles? articalsModel;

  ArticlView(this.articalsModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ClipRect(
          //   child: CachedNetworkImage(
          //     imageUrl:articalsModel.urlToImage ?? "",
          //     placeholder: (context, url) => const CircularProgressIndicator(),
          //     errorWidget: (context, url, error) => const Icon(Icons.error),
          //   ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(articalsModel?.urlToImage ?? ""),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(articalsModel?.source?.name??"",
              style: TextStyle(
                fontSize: 10,
                color: Color(0xff79828B)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(articalsModel?.title??"",
              style: TextStyle(
                fontSize: 30
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(articalsModel?.publishedAt??"",
              textAlign: TextAlign.end,
              style: TextStyle(
                  color: Color(0xff79828B),
                fontSize: 13,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
