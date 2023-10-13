import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  const customButton(
      {super.key, this.onTap, this.isLoading = false, required this.title});
  final void Function()? onTap;
  final bool isLoading;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
            child: isLoading
                ? const SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  )
                : Text(
                    title,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold),
                  )),
      ),
    );
  }
}
