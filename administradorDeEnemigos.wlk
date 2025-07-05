import game.*
import enemigos.*
//import administradorDeOleadas.*

/* =======================================
   Clase Linea: representa cada fila lógica
   ======================================= */
class Linea {
    const property linea
    var property cantEnemigos = 0

    method position() = new MutablePosition(x = 94, y = linea) // Para texto o marcador visual
    method text() = cantEnemigos.toString()

    method reset() { cantEnemigos = 0 }
    method tieneEnemigos() = cantEnemigos > 0
    method noTieneEnemigos() = cantEnemigos == 0

    method aumentarCant() { cantEnemigos += 1 }
    method restarCantidad() { cantEnemigos -= 1 }
}

/* =======================================
   Objetos Linea: define cada lane lógico
   ======================================= */
const linea1 = new Linea(linea = 4)
const linea2 = new Linea(linea = 12)
const linea3 = new Linea(linea = 20)
const linea4 = new Linea(linea = 28)
const linea5 = new Linea(linea = 36)



/* =======================================
   Administrador de Enemigos
   ======================================= */
object administradorDeEnemigos {
    // Constantes
    const maxEnemigosEnPantalla = 8

    // Estado
    var nombreEnemigo = 10000
    var enemigos = #{}

    // Lista de líneas
    const property cantDeEnemigosPorLinea = [linea1, linea2, linea3, linea4, linea5]

    // Métodos de consulta
    method enemigos() = enemigos
    method nombre() = nombreEnemigo
    method pocosEnemigosEnPantalla() = cantDeEnemigosPorLinea.sum({ linea => linea.cantEnemigos() }) < maxEnemigosEnPantalla

    // Genera un nuevo nombre
    method sumarEnemigo() { nombreEnemigo += 1 }
    // Genera enemigo si hay espacio
    method generarEnemigo(tipo) {
        if (self.pocosEnemigosEnPantalla()) {
            const indiceLinea = 0.randomUpTo(4) // 0..4 inclusive
            const lineaElegida = cantDeEnemigosPorLinea.get(indiceLinea)
            const y = lineaElegida.linea()

            const posicionTemporal = new MutablePosition(x = 96, y = y)
            var nombreParaEnemigo = self.nombre()

            if (game.getObjectsIn(posicionTemporal).isEmpty()) {
                nombreParaEnemigo = new Enemigo(position = posicionTemporal, tipo = tipo, frames = tipo.frames())
                enemigos.add(nombreParaEnemigo)
                self.sumarEnemigo()
                //administradorDeOleadas.sumarEnemigo()
                self.aumentarLinea(indiceLinea)
                nombreParaEnemigo.iniciar()
            }
        }
    }

    method eliminarEnemigo(enemigo) {
        const y = enemigo.position().y()
        const lineaIndice = self.obtenerIndiceLinea(y)
        self.decrementarLinea(lineaIndice)
        //administradorDeOleadas.reducirEnemigo()
        enemigos.remove(enemigo)
    }

    method reset() {
        enemigos.forEach({ enemigo => enemigo.eliminar() })
        nombreEnemigo = 0
        enemigos = []
        self.resetLineas()
    }

    method resetLineas() {
        cantDeEnemigosPorLinea.forEach({ linea => linea.cantEnemigos(0) })
    }

    method matarEnemigos() {
        enemigos.forEach({ enemigo => enemigo.eliminar() })
    }

    method estanMuertos() {
        enemigos.forEach({ enemigo => enemigo.estaMuerto() })
    }

    method moverEnemigosIzquierda() {
        enemigos.forEach({ enemigo => enemigo.moverIzquierda() })
    }
    method moverEnemigosDerecha() {
        enemigos.forEach({ enemigo => enemigo.moverDerecha() })
    }

    method cambiarFrame() {
        enemigos.forEach({ enemigo => enemigo.cambiarFrame() })
    }

    method aumentarLinea(lineaIndice) {
        cantDeEnemigosPorLinea.get(lineaIndice).aumentarCant()
    }

    method decrementarLinea(lineaIndice) {
        cantDeEnemigosPorLinea.get(lineaIndice).restarCantidad()
    }

    method obtenerIndiceLinea(y) {
        var indice = 0
        var resultado = -1

        cantDeEnemigosPorLinea.forEach({ lineaActual =>
            if (resultado == -1 && lineaActual.linea() == y) {
                resultado = indice
            }
            indice += 1
        })
        return resultado
    }

    method hayEnemigoFila(numeroFila) = cantDeEnemigosPorLinea.get(numeroFila).tieneEnemigos()
    method noHayEnemigoFila(numeroFila) = cantDeEnemigosPorLinea.get(numeroFila).noTieneEnemigos()
}
