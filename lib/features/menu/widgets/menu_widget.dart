import 'package:flutter/material.dart';
import 'package:restaurant_mobile/constants/gaps.dart';

class MenuData extends StatelessWidget {
  final String name, description, imageUrl;
  final int id;
  final double price;

  const MenuData({
    super.key,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.id,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: id,
          child: Container(
            width: 250,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  blurRadius: 15,
                  offset: const Offset(10, 10),
                  color: Colors.black.withOpacity(0.3),
                )
              ],
            ),
            child: Image.network(
              imageUrl,
              headers: const {
                'User-Agent':
                    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36',
              },
            ),
          ),
        ),
        Gaps.v10,
        Text(
          name,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Gaps.v8,
        Column(
          children: [
            Text(
              description,
              textAlign: TextAlign.center,
            ),
            Gaps.v10,
            Text(
              ' USD \$$price',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        )
      ],
    );
  }
}
