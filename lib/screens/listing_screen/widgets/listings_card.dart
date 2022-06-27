import 'package:crypto_search/utils/styles.dart';

import 'package:flutter/material.dart';

class ListingsCard extends StatelessWidget {
  final String title;
  final double price;
  final void Function()? onTap;
  const ListingsCard(
      {Key? key, required this.title, required this.price, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Colors.white,
        ),
        margin: const EdgeInsets.fromLTRB(21, 8, 21, 8),
        padding: const EdgeInsets.all(5),
        child: Row(children: [
          Column(
            children: [
              Text(
                title,
                style: Styles.listCardTitleTS,
              ),
              Text(
                price.toString(),
                style: Styles.listCardTitleTS,
              )
            ],
          )
        ]),
      ),
    );
  }
}
