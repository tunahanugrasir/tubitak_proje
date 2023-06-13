import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubitak_proje/model/model.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final feedViewModel = Provider.of<ThinkSpeakViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Veri Okuma'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              feedViewModel.fetchFeeds();
            },
            child: const Text('Verileri Getir'),
          ),
          Expanded(
            child: Consumer<ThinkSpeakViewModel>(
              builder: (context, viewModel, _) {
                final feeds = viewModel.feeds;

                return ListView.builder(
                  itemCount: feeds.length,
                  itemBuilder: (BuildContext context, int index) {
                    final feed = feeds[index];

                    return ListTile(
                      title: Text('BPM: ${feed.field1}'),
                      subtitle: Text(
                          'Boylam: ${feed.field2}\nEnlem: ${feed.field3}\nHız: ${feed.field4}\nA: ${feed.field5}'),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
