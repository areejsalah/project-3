import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import '../../admin/views/screens/main_admin_screen.dart';
import '../../app router/app_router.dart';

class HeaderBox extends StatelessWidget {
  const HeaderBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 15,
                    color: Colors.grey.shade600,
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      '39 Angle Boulevard Mohamed V Et Boulevard Zerktouni Bab Al Gharb Oujda, Oujda 60000',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Text(
                'Hello areej',
                style: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),

        /*   Row(
          children: [
            IconButton(
                onPressed: () {
                  // search delegate
                  Provider.of<AuthProvider>(context, listen: false).signOut();
                },
                icon: const Icon(Icons.logout)),
            Provider.of<AuthProvider>(context).loggedUser!.isAdmin
                ? IconButton(
                    onPressed: () {
                      AppRouter.appRouter.goToWidget(MainAdminScreen());
                    },
                    icon: const Icon(
                      Icons.settings,
                      color: Color(0xffC3211A),
                    ))
                : const SizedBox(),
          ],
        ),*/
      ]),
    );
  }
}
