import 'package:flutter/material.dart';

class SaveUserButton extends StatelessWidget {
  const SaveUserButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        backgroundColor: Colors.blueGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      child: Text(
        'SAVE',
        style: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
      ),
    );
  }
}
