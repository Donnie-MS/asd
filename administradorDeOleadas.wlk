
import administradorDeEnemigos.*
import enemigos.*
object administradorDeOleadas {
    var property oleadaActual = []       // Array con la secuencia de enemigos (por ejemplo [dragon, arpia])
    var property indiceEnemigo = 0       // Para ir llevando el control de qué enemigo va

    var property estaActiva = false
    
    method iniciarOleada(listaEnemigos) {
        oleadaActual = listaEnemigos
        indiceEnemigo = 0
        estaActiva = true
    }


    // Generar el siguiente enemigo de la lista
    method generarProximoEnemigo() {
        if (indiceEnemigo < oleadaActual.size()) {
            const tipo = oleadaActual.get(indiceEnemigo)
            administradorDeEnemigos.generarEnemigo(tipo)
            indiceEnemigo += 1
        }
        else {
            // La oleada se completó, poner siguiente nivel?
        }
    }

    // Resetear oleada actual
    method reset() {
        oleadaActual = []
        indiceEnemigo = 0
    }
}
