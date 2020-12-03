import 'package:flutter/material.dart';

class ButtonWide extends StatelessWidget {
  ButtonWide({this.text, this.action, this.isToExpand = false, this.rounded = true, this.color = Colors.purple, this.icon});

  final String text;
  final Function action;
  final bool isToExpand;
  final bool rounded;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => action(),
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: isToExpand ? MediaQuery.of(context).size.width : 260,
        decoration: BoxDecoration(
          borderRadius: rounded == true ? BorderRadius.circular(12) : null,
          color: color,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != null ? Icon(icon, size: 20, color: Colors.white) : Text(''),
              icon != null ? SizedBox(width: 15) : Text(''),
              Text(
                text,
                style: Theme.of(context).textTheme.headline1.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
