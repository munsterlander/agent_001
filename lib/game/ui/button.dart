import 'package:flutter/material.dart';

class ImageTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String cardText;
  final String buttonText;

  const ImageTextButton({
    Key? key,
    required this.onPressed,
    required this.cardText,
    required this.buttonText,
  }) : super(key: key);

  static const Color _textColor = Color.fromRGBO(0, 0, 0, 1.0);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            cardText,
            style: const TextStyle(
              fontSize: 14.0,
              color: _textColor,
            ),
          ),
          TextButton(
            onPressed: onPressed,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/button.png',
                    width: 110.0,
                    height: 45.0,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  heightFactor: 3.0,
                  child: Text(
                    buttonText,
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: _textColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
