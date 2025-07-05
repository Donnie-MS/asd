/*class Nivel{
    const oleadas
    const property nivelActual
    var property cantidadEnemigos // var para modificar en nivel Infinito
    var property enemigosRestantes = cantidadEnemigos
    var property enemigosGenerados = 0
    var property indiceOleada=0
    const property tiempoSpawn
    const property nombre

    method enemigos()=oleadas.get(indiceOleada)

    method oleadaActual()= oleadas.get(indiceOleada)
    method noTerminoNivel()= indiceOleada < oleadas.size()-1
    method siguienteOleada(){indiceOleada +=1
    self.reset()}
    method resetearOleadas(){
        indiceOleada=0
    }

    const sonidoInicio = "m.iOleada.mp3"
    const sonidoFin = "m.fOleada.mp3"

    method inicioOleada() = game.sound(sonidoInicio)
    method finOleada() = game.sound(sonidoFin)

    // Verifica si la oleada final está en ejecución
    method ejecutando() = cantidadEnemigos >= enemigosGenerados && enemigosRestantes > 0

    method seGeneroEnemigo() {enemigosGenerados+=1}

    method seMurioEnemigo() {enemigosRestantes-=1}

    method enemigosVivos() =  enemigosGenerados - (cantidadEnemigos - enemigosRestantes)

    // Termina la oleada final y concluye el juego
    method terminarOleada() {
        if(!botonMutearMusica.muteada()) {
            self.finOleada().volume(0.1)
            self.finOleada().play()
            }
        administradorDeEnemigos.matarEnemigos()
        administradorDeEnemigos.resetLineas()  
    }

        method iniciarOleada(){
        administradorDeEnemigos.matarEnemigos()
        administradorDeEnemigos.resetLineas()  
        if(!botonMutearMusica.muteada()) {
        self.inicioOleada().volume(0)
        self.inicioOleada().play()
        }
        enemigosRestantes = cantidadEnemigos
    }

    method cargarSlimesRestantes () {enemigosRestantes = cantidadEnemigos }
    // Verifica si la oleada final ha finalizado
    method finalizo() = enemigosRestantes <= 0 || enemigosGenerados >= cantidadEnemigos

    method seGeneraronSuficientes() = cantidadEnemigos == self.enemigosVivos() || self.enemigosVivos() == enemigosRestantes
    // Resetea la oleada final
    method reset() {
        enemigosGenerados = 0
        enemigosRestantes = cantidadEnemigos
    }
    method resetearCantEnemigosComoAlInicio(){}
}
*/