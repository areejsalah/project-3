import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconData leftIcon;
  final IconData rightIcon;
  //final Function? leftCallback;
  CustomAppBar(
    this.leftIcon,
    this.rightIcon,
    //this.leftCallback
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // padding: EdgeInsets.only(
        //  top: MediaQuery.of(context).padding.top, left: 25, right: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                //leftCallback != null ? () => leftCallback!() : null;
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: Icon(
                  leftIcon,
                  color: Color(0xffC3211A),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                //navigator to add to cart page
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: Icon(
                  rightIcon,
                  color: Color(0xffC3211A),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(120);
}
