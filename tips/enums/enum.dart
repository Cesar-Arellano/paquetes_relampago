enum Weekday {
    monday,
    tuesday,
    wednesday,
    thursday,
    friday,
    saturday,
    sunday,
}

enum DeliveryStatus {
  pending,
  inTransit,
  delivered,
  cancelled;
  
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

  bool get isFinalized {
    return this == DeliveryStatus.delivered ||
        this == DeliveryStatus.cancelled;
  }
}

void main() {
  final status = DeliveryStatus.delivered;
  print(status.message);
  print(status.isFinalized);
}