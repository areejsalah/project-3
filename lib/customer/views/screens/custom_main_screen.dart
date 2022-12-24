import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/providers/admin_provider.dart';
import 'package:flutter_application_1/admin/views/screens/main_admin_screen.dart';
import 'package:flutter_application_1/app%20router/app_router.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/customer/components/ads_box.dart';
import 'package:flutter_application_1/customer/components/category_custom_widget.dart';

import 'package:flutter_application_1/customer/components/header_box.dart';
import 'package:provider/provider.dart';

import '../../../auth/providers/auth_provider.dart';

class CustomerMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.grey[50], actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Provider.of<AuthProvider>(context, listen: false).signOut();
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.black,
                )),
            Provider.of<AuthProvider>(context).loggedUser?.isAdmin == true
                ? IconButton(
                    onPressed: () {
                      AppRouter.appRouter.goToWidget(MainAdminScreen());
                    },
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.black,
                    ))
                : const SizedBox(),
          ],
        )
      ]),
      body: Consumer<AdminProvider>(builder: (context, provider, index) {
        return Column(
          children: [
            SafeArea(child: HeaderBox()),
            AdsBox(revere: false),
            Expanded(
                child: provider.allCategories == null
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(
                                        'Categories',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      Text(
                                        'See All',
                                        style: TextStyle(
                                          color: Color(0xffC3211A),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ]),
                              ),
                              Expanded(
                                  child: GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                              mainAxisSpacing: 10,
                                              crossAxisSpacing: 10),
                                      itemCount: provider.allCategories!.length,
                                      itemBuilder: (context, index) {
                                        return CategoryCustomWidget(
                                            provider.allCategories![index]);
                                      })),
                            ]))),
          ],
        );
      }),
    );
  }
}
