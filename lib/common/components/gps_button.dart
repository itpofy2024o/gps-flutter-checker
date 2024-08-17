import 'package:flutter/material.dart';

class GPSPromptBar extends StatelessWidget {
  final VoidCallback onEnable;
  final VoidCallback onCancel;

  const GPSPromptBar({
    super.key,
    required this.onEnable,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16.0,
      left: 16.0,
      right: 16.0,
      height: MediaQuery.of(context).size.height*0.15,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 151, 150, 150),
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 70, 69, 69).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text('Please enable GPS to continue'),
            SizedBox(height:MediaQuery.of(context).size.height*0.025),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: onCancel,
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: onEnable,
                  child: const Text('Enable'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}