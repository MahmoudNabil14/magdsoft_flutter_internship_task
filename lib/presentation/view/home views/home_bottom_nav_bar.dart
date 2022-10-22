import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';

import '../../router/app_router.dart';

class HomeBottomNavBar extends StatelessWidget {
  const HomeBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0.0,
      shape: const CircularNotchedRectangle(),
      notchMargin: 12,
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                MaterialButton(
                  minWidth: MediaQuery.of(context).size.width / 5.5,
                  onPressed: () {
                    CacheHelper.removeData(key: 'isLoggedIn');
                    Navigator.pushNamedAndRemoveUntil(
                        context, Routes.loginScreen, (route) => false);
                  },
                  child: const Icon(
                    Icons.logout,
                    color: Colors.grey,
                  ),
                ),
                MaterialButton(
                  minWidth: MediaQuery.of(context).size.width / 5.5,
                  onPressed: () {},
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            Row(
              children: [
                MaterialButton(
                  minWidth: MediaQuery.of(context).size.width / 5.5,
                  onPressed: () {},
                  child: const Icon(
                    Icons.notifications_active,
                    color: Colors.grey,
                  ),
                ),
                MaterialButton(
                  minWidth: MediaQuery.of(context).size.width / 5.5,
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Routes.helpScreen,
                    );
                  },
                  child: const Icon(
                    Icons.settings,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
