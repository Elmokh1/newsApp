import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_route/pages/home_page/Widgets/Grid_view_item_widget.dart';
import 'package:news_app_route/pages/home_page/Widgets/drawer_widget.dart';
import 'package:news_app_route/pages/home_page/category_veiw.dart';

import '../../models/category_model.dart';

class home_view extends StatefulWidget {
  static const String routename = 'home_view';

  @override
  State<home_view> createState() => _home_viewState();
}

class _home_viewState extends State<home_view> {
  List<CategoryModel> categorieslist = [
    CategoryModel(
      id: "sports",
      title: "Sports",
      image: "assets/images/sports.png",
      backgroundColor: Color(0xffC91C22),
    ),
    CategoryModel(
      id: "general",
      title: "general",
      image: "assets/images/Politics.png",
      backgroundColor: Color(0xff003E90),
    ),
    CategoryModel(
      id: "health",
      title: "Health",
      image: "assets/images/health.png",
      backgroundColor: Color(0xffED1E79),
    ),
    CategoryModel(
      id: "technology ",
      title: "technology ",
      image: "assets/images/bussines.png",
      backgroundColor: Color(0xffCF7E48),
    ),
    CategoryModel(
      id: "enviroment",
      title: "Enviroment",
      image: "assets/images/environment.png",
      backgroundColor: Color(0xff4882CF),
    ),
    CategoryModel(
      id: "science",
      title: "Science",
      image: "assets/images/science.png",
      backgroundColor: Color(0xffF2D352),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('assets/images/pattern.png'),
            fit: BoxFit.fill,
          )),
      child: Scaffold(
        drawer: Drawer_widget(
            selectedCategory: selectedCategory,
            onPressed: onPressed,
          ),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
              selectedCategory == null ? 'News App' : selectedCategory!.title),
        ),
        body: selectedCategory == null
            ? Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pick your category \n of interest",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff4F5A69),
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                                childAspectRatio: 7 / 8),
                        itemBuilder: (context, index) => gridView_item_widget(
                          categoryModel: categorieslist[index],
                          index: index,
                          onClicked: OnClicked,
                        ),
                        itemCount: categorieslist.length,
                      ),
                    )
                  ],
                ),
              )
            : CategoryVeiw(selected: selectedCategory!),
      ),
    );
  }

  CategoryModel? selectedCategory;

  OnClicked(CategoryModel categoryModel) {
    print(categoryModel.title);
    selectedCategory = categoryModel;
    setState(() {});
  }
  onPressed() {
    setState(() {
      selectedCategory =null;
      print("hello");
    });
  }
}


