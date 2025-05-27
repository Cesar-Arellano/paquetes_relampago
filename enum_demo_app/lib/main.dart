import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

enum DeliveryStatus {
  pending,
  inTransit,
  delivered,
  cancelled;

  String get label {
    return switch (this) {
      DeliveryStatus.pending 
      => 'Pendiente',
      DeliveryStatus.inTransit 
      => 'En camino',
      DeliveryStatus.delivered 
      => 'Entregado',
      DeliveryStatus.cancelled 
      => 'Cancelado',
    };
  }

  String get message {
    return switch (this) {
      DeliveryStatus.pending 
      => 'Tu paquete está siendo preparado 📦',
      DeliveryStatus.inTransit 
      => '¡Va en camino! 🚚',
      DeliveryStatus.delivered 
      => 'Entregado con éxito ✅',
      DeliveryStatus.cancelled 
      => 'Envío cancelado ❌',
    };
  }

  IconData get icon {
    return switch (this) {
      DeliveryStatus.pending 
      => Icons.access_time,
      DeliveryStatus.inTransit 
      => Icons.local_shipping,
      DeliveryStatus.delivered 
      => Icons.check_circle,
      DeliveryStatus.cancelled 
      => Icons.cancel,
    };
  }

  Color get color {
    return switch (this) {
      DeliveryStatus.pending 
      => Colors.orange,
      DeliveryStatus.inTransit 
      => Colors.blue,
      DeliveryStatus.delivered 
      => Colors.green,
      DeliveryStatus.cancelled 
      => Colors.red,
    };
  }

  bool get isFinalized {
    return this == DeliveryStatus.delivered 
      || this == DeliveryStatus.cancelled;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: GoodTrackingPage(statusList: [
        DeliveryStatus.inTransit,
        DeliveryStatus.delivered,
        DeliveryStatus.cancelled,
        DeliveryStatus.pending,
      ]),
    );
  }
}

class GoodTrackingPage extends StatelessWidget {
  final List<DeliveryStatus> statusList;

  const GoodTrackingPage({
    super.key,
    required this.statusList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estado del paquete')
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: statusList.length,
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8
          ),
          child: CardStatus(
            status: statusList[index],
          ),
        ),
      ),
    );
  }
}

class CardStatus extends StatelessWidget {
  final DeliveryStatus status;

  const CardStatus({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: status.color.withValues(alpha: 0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(status.icon, color: status.color, size: 32),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    status.label,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: status.color,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    status.message,
                    style: const TextStyle(fontSize: 16),
                  ),
                  if (status.isFinalized) ...[
                    const SizedBox(height: 6),
                    Text(
                      'Este envío ya se finalizó.',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class BadTrackingPage extends StatelessWidget {
  final List<DeliveryStatus> statusList;

  const BadTrackingPage({super.key, required this.statusList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Estado del paquete (mal hecho)')),
      body: ListView.builder(
        itemCount: statusList.length,
        itemBuilder: (_, index) {
          final status = statusList[index];
          String label = '';
          String message = '';
          IconData icon = Icons.help;
          Color color = Colors.grey;
          bool finalized = false;

          if (status == DeliveryStatus.pending) {
            label = 'Pendiente';
            message = 'Tu paquete está siendo preparado 📦';
            icon = Icons.access_time;
            color = Colors.orange;
          } else if (status == DeliveryStatus.inTransit) {
            label = 'En camino';
            message = '¡Va en camino! 🚚';
            icon = Icons.local_shipping;
            color = Colors.blue;
          } else if (status == DeliveryStatus.delivered) {
            label = 'Entregado';
            message = 'Entregado con éxito ✅';
            icon = Icons.check_circle;
            color = Colors.green;
            finalized = true;
          } else if (status == DeliveryStatus.cancelled) {
            label = 'Cancelado';
            message = 'Envío cancelado ❌';
            icon = Icons.cancel;
            color = Colors.red;
            finalized = true;
          }

          return Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: color),
              ),
              child: ListTile(
                leading: Icon(icon, color: color),
                title: Text(label),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(message),
                    if (finalized)
                      Text(
                        'Este envío ya fue finalizado.',
                        style: TextStyle(color: Colors.black54),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
