import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';





class DrawerItem extends StatelessWidget {

  String name;
  IconData icon;
  Function onClick;

  DrawerItem({required this.name, required this.icon, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onClick();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.0),
        child: Row(
          children: [
            Icon(
              icon,
              size: 35,
              color: Colors.black,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              name,
              style: GoogleFonts.poppins(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
