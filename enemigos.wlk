import arcaneBastion.*
import bastion.*
import administradorDeEnemigos.*
// ===============================
// Clase Base: Enemigo
// ===============================
class Enemigo inherits CosaAnimada {
    const property tipo
    var property vida = tipo.vida()
    var property danio = tipo.danio()
    var property position
    const property score = tipo.score()
    method esEnemigo() = true
    // Frames para animación
    override method frames() = tipo.frames()
    method colisionConDefensa() {
    }
    
    method moverIzquierda() {
        if (position.x() == 0) {
            bastion.recibirDanio()
            self.eliminar()
        }
        else {
            position.goLeft(1)
        }
    }
    method moverDerecha() {
      if (position.x() == 100) {
        self.eliminar()
      }
      else {
        position.goRight(1)
      }
    } 
    method recibirAtaque(danioRecibido) {
        self.image(tipo.imagenRecibeDanio())
        vida = vida - danioRecibido
        if (not self.estaVivo()) {
            //score.aumentarScore(self.score())
            self.eliminar()
        }
    }

    method lanzarAtaque() {
        // Por defecto no hace nada, se sobrescribe en cada objeto
    }

    method estaVivo() = vida >= 0

    method eliminar() {
        game.removeVisual(self)
        administradorDeEnemigos.eliminarEnemigo(self)
    }
}

// ===============================
// Clase TipoEnemigo
// ===============================
class TipoEnemigo {
    const property frames
    const property vida
    const property danio
    const property score
    const property imagenRecibeDanio
}

// ===============================
// Definición de tipos de enemigos
// ===============================
object dragon inherits TipoEnemigo(frames = ["frame1D.png", "frame2D.png", "frame3D.png", "frame4D.png"],
    vida = 100, danio = 25, imagenRecibeDanio = "dragonHerido.png", score = 500) {}

object arbolMaldito inherits TipoEnemigo(frames = ["frame1A.png", "frame2A.png", "frame3A.png", "frame4A.png"], 
    vida = 500, danio = 25, imagenRecibeDanio = "", score =300) {}

object esqueleto inherits TipoEnemigo(frames = ["frame1E.png", "frame2E.png", "frame3E.png", "frame4E.png"], 
    vida = 100, danio = 25, imagenRecibeDanio = "", score = 100) {}

object fantasma inherits TipoEnemigo(frames = ["frame1F.png", "frame2F.png", "frame3F.png", "frame4F.png"],
    vida = 150, danio = 25, imagenRecibeDanio = "", score = 150) {}

object arpia inherits TipoEnemigo(frames = ["frame1H.png", "frame2H.png", "frame3H.png", "frame4H.png"],
    vida = 200, danio = 25, imagenRecibeDanio = "", score = 250) {}


// ===============================
// Objetos específicos de enemigos

// ===============================

/*
object dragon inherits Enemigo(tipo = dragonTipo, position = new MutablePosition(x = 96, y = 12)) {
    override method lanzarAtaque() {
        // Lógica especial si querés
    }
}
*/
