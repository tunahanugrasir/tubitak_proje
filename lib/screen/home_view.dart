import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../model/model.dart';
import '../theme/dark_theme.dart';
import '../utils/google_maps_utils.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final feedViewModel = Provider.of<ThinkSpeakViewModel>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          feedViewModel.fetchFeeds();
        },
        child: const Icon(
          Icons.refresh_outlined,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0, bottom: 100),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
              child: Text(
                "Güncellendi: 53 dk.",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: 17),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: DarkTheme().theme.colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 200,
                    height: 300,
                    bottom: -50,
                    child: Image.asset(
                      "assets/images/im-battery-percentage.png",
                      height: 200,
                      width: 500,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: 200,
                    right: 0,
                    bottom: 30,
                    child: Image.asset(
                      "assets/images/im-wheelchair2.png",
                      height: 200,
                      width: 500,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: DarkTheme().theme.colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Center(
                      child: Lottie.network(
                        "https://assets1.lottiefiles.com/packages/lf20_1QTeoFTzaO.json",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Consumer<ThinkSpeakViewModel>(
                        builder: (context, feedViewModel, child) {
                      return Center(
                          child: Text(
                        "82",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.copyWith(
                              color: DarkTheme().theme.colorScheme.onSecondary,
                            ),
                      )
                          //feedViewModel.isLoaded
                          // ? Text(
                          //     feedViewModel.feeds[0].field1,
                          //     style: Theme.of(context)
                          //         .textTheme
                          //         .displayLarge
                          //         ?.copyWith(
                          //           color: DarkTheme()
                          //               .theme
                          //               .colorScheme
                          //               .onSecondary,
                          //         ),
                          //   )
                          // : const CircularProgressIndicator(),
                          );
                    }),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: Row(
                children: const [
                  Expanded(child: MapWidget()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
