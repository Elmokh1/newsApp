import 'package:flutter/material.dart';
import 'package:news_app_route/models/source_model.dart';
import 'package:news_app_route/pages/home_page/Widgets/artical_view.dart';
import 'package:news_app_route/pages/home_page/Widgets/articl_list.dart';
import 'package:news_app_route/pages/home_page/Widgets/tap_item.dart';

class TabBarListView extends StatefulWidget {
  // SourceModel sourceModel;
   List<Source> source;

  TabBarListView(this.source);

  @override
  State<TabBarListView> createState() => _TabBarListViewState();
}

class _TabBarListViewState extends State<TabBarListView> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          DefaultTabController(
            initialIndex: selectedindex,
            length: widget.source.length ?? 0,
            child: TabBar(
              padding: EdgeInsets.zero,
              indicator: const BoxDecoration(),
              isScrollable: true,
              labelPadding: const EdgeInsets.symmetric(vertical: 12),
              onTap: (index) {
                setState(() {
                  selectedindex = index;
                });
              },
              indicatorColor: Colors.red,
              tabs: widget.source.map((element) {
                    return Tab_item(
                      element,
                      selectedindex ==
                          widget.source.indexOf(element),
                    );
                  }).toList() ??
                  [],
            ),
          ),
          ArticlList(widget.source[selectedindex].id ?? "")
          // Expanded(
          //   child: ListView.builder(itemBuilder: (context, index){
          //     return Container();
          //   },),
          // )
        ],
      ),
    );
  }
}
