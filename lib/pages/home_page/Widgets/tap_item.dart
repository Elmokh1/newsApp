import 'package:flutter/material.dart';
import 'package:news_app_route/models/source_model.dart';

class Tab_item extends StatelessWidget {
  Source source;
  bool isSelected;

  Tab_item(this.source,this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isSelected?Colors.green:Colors.white,
          borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected?Colors.green:Colors.white,
        )

      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(
          source.name ?? "",
          style: TextStyle(color: isSelected?Colors.white:Colors.green,),
        ),
      ),
    );
  }
}
