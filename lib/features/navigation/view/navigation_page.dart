import 'package:assignment/features/home/view/home_page.dart';
import 'package:assignment/features/profile/view/profle_page.dart';
import 'package:assignment/features/widgets/custom_bottom_app_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/router/router.gr.dart';
import '../../widgets/custom_floating_button.dart';

@RoutePage(
  deferredLoading: true,
)
class NavigationPage extends ConsumerStatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  HomeContainerScreenState createState() => HomeContainerScreenState();
}

class HomeContainerScreenState extends ConsumerState<NavigationPage> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Navigator(
            key: navigatorKey,
            onGenerateRoute: (routeSetting) {
              if (routeSetting.name == null) return null;
              if (kDebugMode) {
                print(routeSetting.name!);
              }
              return PageRouteBuilder(
                pageBuilder: (ctx, ani, ani1) => getCurrentPage(
                  ctx,
                  routeSetting.name!,
                ),
                transitionDuration: const Duration(
                  seconds: 0,
                ),
              );
            },
          ),
        ),
        bottomNavigationBar: _buildBottomNavigation(context),
        floatingActionButton: CustomFloatingButton(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  height: 200,
                  color: Colors.transparent,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Add Transaction",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                context.router.push(
                                  AddExpenseIncomeRoute(
                                    color: const Color(0xFF0077FF),
                                    routeName: "Add Expense",
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF7F3DFF),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Icon(
                                      Icons.arrow_upward,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Expense",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                context.router.push(
                                  AddExpenseIncomeRoute(
                                    color: const Color(0xFF7B61FF),
                                    routeName: "Add Income",
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF7F3DFF),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Icon(
                                      Icons.arrow_downward,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Income",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          height: 56,
          width: 56,
          backgroundColor: const Color(0xFF7F3DFF),
          child: const Icon(
            color: Colors.white,
            Icons.add,
            size: 38,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomNavigation(BuildContext context) {
    return CustomBottomAppBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushReplacementNamed(
          navigatorKey.currentContext!,
          getCurrentRoute(type),
        );
      },
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.home:
        return "/home";
      case BottomBarEnum.transaction:
        return "/transaction";
      case BottomBarEnum.budget:
        return "/budget";
      case BottomBarEnum.profile:
        return '/profile';
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case "/home":
        return const HomePage();
      case "/profile":
        return const ProfilePage();
      default:
        return const HomePage();
    }
  }
}
