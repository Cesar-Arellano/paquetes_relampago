enum DeliveryStatus {
    case pending
    case inTransit
    case delivered
    case cancelled

    var message: String {
        switch self {
        case .pending:
            return "Tu paquete está siendo preparado 📦"
        case .inTransit:
            return "¡Va en camino! 🚚"
        case .delivered:
            return "Entregado con éxito ✅"
        case .cancelled:
            return "Envío cancelado ❌"
        }
    }

    var isFinalized: Bool {
        return self == .delivered || self == .cancelled
    }
}

let status: DeliveryStatus = DeliveryStatus.delivered
print(status.message)
print(status.isFinalized)