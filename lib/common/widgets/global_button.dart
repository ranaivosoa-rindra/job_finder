import 'package:flutter/material.dart';

class GlobalButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color textColor;
  final String? imageAsset;
  final bool withIcon;
  const GlobalButton({
    Key? key,
    required this.onTap,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.imageAsset, 
    required this.withIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        child: Container(
          width: MediaQuery.of(context).size.width - 40,
          height: 55,
          color: backgroundColor,
          child: InkWell(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(withIcon)...[
                  // icon
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Image.asset(
                      imageAsset!,
                      height: 16,
                    ),
                  ),
                ],
      
                // text
                Text(
                  text.toUpperCase(),
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
