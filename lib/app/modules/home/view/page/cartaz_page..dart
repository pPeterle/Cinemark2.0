import 'package:cinemark_2/app/shared/theme/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../home_store.dart';
import '../widgets/movie_widget.dart';

class CartazPage extends StatefulWidget {
  const CartazPage({Key? key}) : super(key: key);

  @override
  State<CartazPage> createState() => _CartazPageState();
}

class _CartazPageState extends State<CartazPage> {
  final HomeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (store.errorNowShowing != null) {
        return Center(
          child: Text(
            store.errorNowShowing!,
            style: const TextStyle(color: CustomColors.red, fontSize: 18),
          ),
        );
      }
      return ListView.builder(
          itemCount: store.nowShowingList.length,
          itemBuilder: (context, i) {
            final movie = store.nowShowingList[i];
            return MovieWidget(movie: movie);
          });
    });
  }
}
