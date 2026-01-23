import 'package:flutter/material.dart';

void main() {
  runApp(const PassengerInfoApp());
}

class PassengerInfoApp extends StatelessWidget {
  const PassengerInfoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Passenger Info',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const PassengerInfoPage(),
    );
  }
}

class PassengerInfoPage extends StatefulWidget {
  const PassengerInfoPage({super.key});

  @override
  State<PassengerInfoPage> createState() => _PassengerInfoPageState();
}

class _PassengerInfoPageState extends State<PassengerInfoPage> {
  int passengerCount = 1;
  final String imageUrl = 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bd/Egypt_-_License_Plate_-_Private.png/250px-Egypt_-_License_Plate_-_Private.png';

  final List<String> driverTypes = ['عضو هيئة تدريس', 'زائر', 'جهة أخرى'];
  String? selectedDriverType;

  @override
  void initState() {
    super.initState();
    selectedDriverType = driverTypes[0];
  }

  void _increment() {
    setState(() {
      passengerCount++;
    });
  }

  void _decrement() {
    if (passengerCount > 0) {
      setState(() {
        passengerCount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'عدد الركاب',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: _decrement,
                    icon: const Icon(Icons.remove_circle_outline),
                    tooltip: 'تقليل عدد الركاب',
                  ),
                  Text(
                    passengerCount.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  IconButton(
                    onPressed: _increment,
                    icon: const Icon(Icons.add_circle_outline),
                    tooltip: 'زيادة عدد الركاب',
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 200, maxHeight: 100),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.contain,
                  semanticLabel: 'شعار جهة السائق',
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const SizedBox(
                      width: 100,
                      height: 50,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox(
                      width: 100,
                      height: 50,
                      child: Center(child: Icon(Icons.broken_image)),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'جهة السائق',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 16,
                children: driverTypes.map((type) {
                  return ChoiceChip(
                    label: Text(type, style: const TextStyle(fontSize: 16)),
                    selected: selectedDriverType == type,
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedDriverType = type;
                        }
                      });
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
