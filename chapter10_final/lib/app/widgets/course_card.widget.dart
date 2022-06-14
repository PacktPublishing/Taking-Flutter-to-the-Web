import 'package:flutter/material.dart';
import 'package:flutter_academy/app/view_models/auth.vm.dart';
import 'package:flutter_academy/app/view_models/course.vm.dart';
import 'package:flutter_academy/app/view_models/watchlist.vm.dart';
import 'package:flutter_academy/infrastructure/model/course.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    Key? key,
    required this.id,
    required this.image,
    required this.title,
    required this.onActionPressed,
    required this.description,
  }) : super(key: key);

  final String id;
  final String image;
  final String title;
  final Function() onActionPressed;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.0,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onActionPressed,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                image,
                height: 150,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
              ),
              Center(
                child: Consumer(builder: (context, ref, child) {
                  ref.watch(watchlistVM);
                  final isInWatchlist =
                      ref.watch(watchlistVM.notifier).isInWatchlist(id);
                  return IconButton(
                    onPressed: () {
                      if (ref.watch(authVM.notifier).user == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'You must be logged in to add to watchlist'),
                          ),
                        );
                      }
                      if (isInWatchlist) {
                        ref.read(watchlistVM.notifier).removeFromWatchlist(id);
                      } else {
                        ref.read(watchlistVM.notifier).addToWatchlist(
                            id, ref.watch(authVM.notifier).user!.id);
                      }
                    },
                    icon: Icon(isInWatchlist ? Icons.clear : Icons.add),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
