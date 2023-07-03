import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_route/models/category_model.dart';
import 'package:news_app_route/shared_componnant/theme/colors.dart';

import 'drawer_item.dart';

class Drawer_widget extends StatelessWidget {
  final CategoryModel? selectedCategory;
  final Function onPressed;

  Drawer_widget({required this.selectedCategory, required this.onPressed}) {
    assert(onPressed != null);
  }


  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: mediaQuery.width * 0.8,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: mediaQuery.height * 0.2,
              decoration: const BoxDecoration(
                color: primaryColor,
              ),
              child: Center(
                child: Text(
                  'News App!',
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            DrawerItem(
              icon: Icons.list,
              name: "Categories",
              onClick: (){
                if(onPressed !=null){
                  onPressed!();
                }

              },
            ),
            const SizedBox(
              height: 30,
            ),
            DrawerItem(
              name: "Settings",
              icon: Icons.settings,
              onClick: () {


              },
            ),
          ],
        ),
      ),
    );
  }
}
