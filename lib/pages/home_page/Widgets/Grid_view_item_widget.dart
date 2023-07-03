import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_route/models/category_model.dart';

class gridView_item_widget extends StatelessWidget {
  CategoryModel categoryModel;
  int index;
  Function onClicked;

  gridView_item_widget(
      {required this.categoryModel,
      required this.index,
      required this.onClicked
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onClicked(categoryModel);
    },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(25),
            topRight: const Radius.circular(25),
            bottomRight: index % 2 == 0
                ? const Radius.circular(0)
                : const Radius.circular(25),
            bottomLeft: index % 2 == 0
                ? const Radius.circular(25)
                : const Radius.circular(0),
          ),
          color: categoryModel.backgroundColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(categoryModel.image),
            const SizedBox(
              height: 6,
            ),
            Text(
              categoryModel.title,
              style: GoogleFonts.exo(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
