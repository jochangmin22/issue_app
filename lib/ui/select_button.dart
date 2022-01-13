import 'package:flutter/material.dart';
import '../domain/Idle_vo.dart';

class SelectButton extends StatelessWidget {
  final bool where;
  final Idle name;
  final VoidCallback onTap;

  const SelectButton(this.where, this.name, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: where == true ? Colors.greenAccent : Colors.orange,
        child: InkWell(
          onTap: () => onTap(),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 5.0),
              ),
              padding: const EdgeInsets.all(20.0),
              child: Text(
                name.name,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ),
      ),
    );
  }
}