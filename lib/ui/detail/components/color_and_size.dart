import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:flutter/material.dart';

class ColorAndSize extends StatelessWidget {
  const ColorAndSize({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Color"),
              Row(
                children: [
                  ColorPicker(
                    color:Color(0xFF90B4C6),
                    isSelected: true
                  ),
                  ColorPicker(
                    color:Color(0xFFFCEABF),
                    isSelected: false
                  ),
                  ColorPicker(
                    color:Color(0xFF989493),
                    isSelected: false
                  ),
                ],
              )
            ],
          )
        ),
        Expanded(
          // Other way to showing and modifying the text 
          //sebenernya sih sama sama untuk styling text
          //Text() = superclass, nah kalo TextSpan() adalah subclass dari RichText()

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "SIze",
                style: TextStyle(color: textColor),
              ),
              RichText( //RichText untuk text yang punya tema terang dan gelap
                text: TextSpan(
                  style: const TextStyle(color: textColor),
                  children: [
                    TextSpan(
                      text: "${product.size} oz",
                      style: Theme.of(context)
                      .textTheme 
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold)
                    )
                  ]
                )
              ),
            ],
          )
        ),
      ],
    );
  }
}

class ColorPicker extends StatelessWidget {
  const ColorPicker({super.key, required this.color, required this.isSelected});

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      // untuk color picker
      margin: const EdgeInsets.only(
        top: defaultPadding, 
        right: defaultPadding
      ), // jarak buat dari color picker ke teks color
      padding: const EdgeInsets.all(2.5),
      width: 20,
      height: 20,
      // modifikasi untuk border dari color pickernya
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : Colors.transparent
        )
      ),

      child: DecoratedBox( // kenapa pake DecoratedBox? karna biar maksimal, karna di BoxDecoration itu gabisa manggil widget
      //modifikasi untuk color pickernya
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        )
      ),
    );
  }
}

// intent (android) == navigation (flutter)
// mereka sama sama punya 2 ini
// expicit (langsung), implicit (bawa data)