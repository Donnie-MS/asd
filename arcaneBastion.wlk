import administradorDeHechizos.*
import mago.*
import enemigos.*
import bastion.*
import menu.*
import administradorDeEnemigos.*
import administradorDeOleadas.*
import niveles.*
import sonidos.*

object arcaneBastion {
  const property cosasConAnimacion = []

  method iniciar() {
    game.title("Arcane Bastion")
    game.cellSize(12)
	  game.height(48)
	  game.width(96)
    sonidoFondo.sonar()
    game.addVisual(pantallaInicial)
    pantallaInicial.desaparecerAlTocar()
    menu.activarModoFacil()
    menu.activarModoSurvival()
    //game.onTick(100, "movimiento", {administradorDeHechizos.moverHechizos()})//Se mueven hacia la derecha
    game.onTick(200, "movimiento", {administradorDeEnemigos.moverEnemigosIzquierda()})
    game.onTick(100, "moverYColisionar", {
      administradorDeHechizos.moverHechizos()
      administradorDeHechizos.impactarHechizos()
    })
    game.onTick(150, "animarTodo", {cosasConAnimacion.forEach({cosa => cosa.animar()})})
    game.onTick(3000, "oleadas", {
      if (administradorDeOleadas.estaActiva()) {
          administradorDeOleadas.generarProximoEnemigo()
      }
    })

    //administradorDeOleadas.iniciarOleada([dragon,dragon, dragon, dragon, dragon, dragon])
    //menu.iniciar()
  }
  method clear() {}
}

class CosaAnimada {//SI VAN HACER UNO QUE SEA SOLO DE 4 IMAGENES NI MÁS NI MENOS 
  var property index = 0
  var property image = null
  const frames 
  method frames ()= frames
  method animar() {
    self.index((index + 1)%4)
    self.image(self.frames().get(index))
  }
  method iniciar() {
    image = self.frames().get(index)
    game.addVisual(self)
    arcaneBastion.cosasConAnimacion().add(self)
  }
  method removeVisual(){
    game.removeVisual(self)
  }
  //method colisionaCon(cosa)
}

