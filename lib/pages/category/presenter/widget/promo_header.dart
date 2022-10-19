import 'package:flutter/material.dart';

class PromoHeader extends StatelessWidget {
  const PromoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        height: 200,
        child: Stack(
          children: [
            Container(
              height: 200,
              alignment: Alignment.bottomCenter,
              child: const _PromoBackground(),
            ),
            const Align(
              alignment: Alignment(.85, 0),
              child: _PromoImage(),
            ),
            const Align(
              alignment: Alignment(-.85, .85),
              child: _PromoTextInformation(),
            )
          ],
        ),
      ),
    );
  }
}

class _PromoBackground extends StatelessWidget {
  const _PromoBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Container(
          height: constraints.maxHeight * .8,
          width: constraints.maxWidth,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColorLight
            ],
          )),
        ),
      );
    });
  }
}

class _PromoImage extends StatelessWidget {
  const _PromoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .3,
      child: Image.asset("assets/images/shopping_bag.png"),
    );
  }
}

class _PromoTextInformation extends StatelessWidget {
  const _PromoTextInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .4,
      child: RichText(
        text: TextSpan(
            text: "MORE FOR LESS\n\n",
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: Colors.white),
            children: [
              _buildTextSpan(context, text: "PROMO CODE:\n"),
              _buildTextSpan(context, text: "XYK1K2D"),
            ]),
      ),
    );
  }

  TextSpan _buildTextSpan(BuildContext context, {required String text}) {
    return TextSpan(
      text: text,
      style:
          Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white),
    );
  }
}
