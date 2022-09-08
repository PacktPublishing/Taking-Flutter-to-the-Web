import 'package:flutter/material.dart';

class FeaturedSection extends StatelessWidget {
  const FeaturedSection({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
    required this.buttonLabel,
    required this.onActionPressed,
    this.imageLeft = true,
  }) : super(key: key);

  final bool imageLeft;
  final String image;
  final String title;
  final String description;
  final String buttonLabel;
  final Function() onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1340,
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          if (imageLeft)
            Expanded(
              child: Image.asset(
                image,
                height: 450,
              ),
            ),
          const SizedBox(width: 20.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 20.0),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 18.0,
                      ),
                ),
                const SizedBox(height: 20.0),
                Center(
                  child: ElevatedButton(
                    child: Text(buttonLabel),
                    onPressed: onActionPressed,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 20.0),
          if (!imageLeft)
            Expanded(
              child: Image.asset(
                image,
                height: 450,
              ),
            ),
        ],
      ),
    );
  }
}
