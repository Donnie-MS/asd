import niveles.*
import administradorDeEnemigos.*
object bastion {
    var property vida = 3
    method sinVida() = vida <= 0
    method sonidoDanio() = game.sound("")

    method position() = new MutablePosition(x = 5, y = 5)
    method text() = "Vidas restantes: " + vida.toString()

    method textColor() = "#FA0770"

    method recibirDanio() {
        if (not self.sinVida()) {
            vida = vida - 1
            if (self.sinVida()) {
                game.addVisual(gameOver)
                pantallaInicial.aparecerAlTocar()
            }
        }
    }
    method reset() {
        vida = 3
    }
}
object score {
    var scoreGlobal = 0
    method position() = new MutablePosition(x = 20, y = 6)
    method text() = "Score: " + scoreGlobal.toString()
    method textColor() = "#FA0770"
    method reset() {
        scoreGlobal = 0
    }
}
class Nivel {
    const property nivel
    
}
// Descontando puntos si el mago colisiona con algun enemigo y si el mago mata un enemigo que este de puntos y se refleje

//contador de enemigos y progreso de oleada
//hacer 3 oleadas y que termine el juego
//nivel actual
//golem dormido como podadoras