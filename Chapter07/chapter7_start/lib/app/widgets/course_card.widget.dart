import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    Key? key,
    required this.id,
    required this.image,
    required this.title,
    required this.onActionPressed,
    required this.description,
  }) : super(key: key);

  final int id;
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
            ],
          ),
        ),
      ),
    );
  }
}
