import 'package:flutter/material.dart';
import 'package:flutter_academy/app/res/responsive.res.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.grey.shade900,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20.0),
          Flex(
            direction: getAxis(width),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (width > ScreenSizes.md) const SizedBox(width: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FooterLink("Home"),
                  FooterLink("About"),
                  FooterLink("Download Apps"),
                  FooterLink("Contact"),
                ],
              ),
              if (width > ScreenSizes.md) const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FooterLink("Blog"),
                  FooterLink("Help and Support"),
                  FooterLink("Join Us"),
                ],
              ),
              if (width > ScreenSizes.md) const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FooterLink("Terms"),
                  FooterLink("Privacy Policy"),
                ],
              ),
              if (width > ScreenSizes.md) const SizedBox(width: 20.0)
            ],
          ),
          const SizedBox(height: 20.0),
          Flex(
            direction: getAxis(width),
            children: [
              Padding(
                padding: width > ScreenSizes.md
                    ? const EdgeInsets.only(left: 30.0)
                    : const EdgeInsets.all(0),
                child: Text(
                  "Flutter Academy",
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
              width > ScreenSizes.md
                  ? const Spacer()
                  : const SizedBox(height: 10),
              Padding(
                padding: width > ScreenSizes.md
                    ? const EdgeInsets.only(right: 30.0)
                    : const EdgeInsets.only(bottom: 10),
                child: Text(
                  "© 2018 Flutter Academy",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30.0),
        ],
      ),
    );
  }
}

class FooterLink extends StatelessWidget {
  const FooterLink(this.text, {Key? key}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
