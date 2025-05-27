enum class DeliveryStatus {
    PENDING,
    IN_TRANSIT,
    DELIVERED,
    CANCELLED;

    val message: String
        get() = when (this) {
            PENDING -> "Tu paquete está siendo preparado 📦"
            IN_TRANSIT -> "¡Va en camino! 🚚"
            DELIVERED -> "Entregado con éxito ✅"
            CANCELLED -> "Envío cancelado ❌"
        }

    val isFinalized: Boolean
        get() = this == DELIVERED || this == CANCELLED
}

fun main() {
    val status = DeliveryStatus.DELIVERED
    println(status.message)
    println(status.isFinalized)
}