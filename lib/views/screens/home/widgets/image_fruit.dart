import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_inventory/cubits/current_fruit/current_fruit_cubit.dart';
import 'package:fruits_inventory/cubits/current_fruit/current_fruit_state.dart';

class ImageFruit extends StatelessWidget {
  const ImageFruit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentFruitCubit, CurrentFruitState>(
      builder: (context, currentFruitState) {
        if (currentFruitState.imageUrl != null) {
          return Image.network(
            currentFruitState.imageUrl!,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.image,
              size: 75,
              color: Colors.grey,
            ),
            Text(
              "No image yet",
              style: TextStyle(fontSize: 18),
            ),
          ],
        );
      },
    );
  }
}
