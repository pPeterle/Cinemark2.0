import 'package:cinemark_2/app/modules/home/view/home_store.dart';
import 'package:cinemark_2/app/modules/home/view/widgets/movie_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BrevePage extends StatelessWidget {
  BrevePage({Key? key}) : super(key: key);

  final HomeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ListView.builder(
          itemCount: store.comingSoonList.length,
          itemBuilder: (context, i) {
            final movie = store.comingSoonList[i];
            return MovieWidget(movie: movie);
          });
    });
  }
}
