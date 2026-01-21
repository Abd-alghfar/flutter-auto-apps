import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'color_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<ColorProvider>().backgroundColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildColorButton(Colors.red, 'أحمر', context),
            _buildColorButton(Colors.green, 'أخضر', context),
            _buildColorButton(Colors.blue, 'أزرق', context),
          ],
        ),
      ),
    );
  }

  Widget _buildColorButton(Color color, String label, BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
      ),
      onPressed: () => Provider.of<ColorProvider>(context, listen: false).changeColor(color),
      child: Text(label),
    );
  }
}
