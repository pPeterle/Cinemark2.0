import 'package:cinemark_2/app/modules/home/model/images.dart';
import 'package:cinemark_2/app/modules/home/model/movie.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../../shared/theme/custom_colors.dart';

class MovieWidget extends StatelessWidget {
  final Movie movie;
  const MovieWidget({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final image = movie.images
        .where((i) => i.type == ImageType.posterHorizontal)
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (image.isNotEmpty)
          FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: image[0].url,
            height: size.width * 0.347,
            fadeInDuration: const Duration(milliseconds: 200),
          ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                style: const TextStyle(
                  color: CustomColors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Wrap(
                spacing: 4,
                children: movie.genres
                    .map((genre) => Chip(
                          label: Text(
                            genre,
                            style: const TextStyle(
                                color: CustomColors.darkBlue, fontSize: 12),
                          ),
                          backgroundColor: CustomColors.blue,
                        ))
                    .toList(),
              )
            ],
          ),
        )
      ],
    );
  }
}
