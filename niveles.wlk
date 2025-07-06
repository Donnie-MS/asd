import administradorDeHechizos.*
import administradorDeOleadas.*
import enemigos.*
import menu.*
import mago.*
import sonidos.*
object pantallaInicial {
    const position = new MutablePosition(x = 0, y = 0)

    method image() = "PantallaInicio.png" // Asegúrate de tener esta imagen
    method position() = position
    method desaparecerAlTocar(){
    keyboard.space().onPressDo({
        if (game.hasVisual(self)){
            game.removeVisual(self)
            game.addVisual(menu) 
        }
    })
}
    method aparecerAlTocar(){
        keyboard.enter().onPressDo({game.addVisual(self)})
    }
}
object gameOver{
    const position = new MutablePosition(x = 0, y = 0)
    method image() = "gameOver.png" 
    method position()=position
}
object nivelFacil{
    method image() = "EscenarioNivelFacil.png" 
    method  position ()= new MutablePosition(x = 0, y = 0)
     method iniciarNivel() {
        //game.addVisual(self)
        config.configTeclas()
        magoProtagonista.iniciar()
       administradorDeOleadas.iniciarOleada([dragon, dragon, dragon, dragon, dragon])
    }
}
object nivelSurvival{
   method image() = "escenarioSurvival.png"
    method position() = new MutablePosition(x = 0, y = 0)
    method iniciarNivel() {
          //game.addVisual(self)
          sonidoSurvival.sonar()
          config.configTeclas()
          magoProtagonista.iniciar()
          administradorDeOleadas.iniciarOleada([dragon, dragon, dragon,dragon, dragon, dragon])
    }
}
object config{
    method configTeclas(){
        keyboard.up().onPressDo({magoProtagonista.moverArriba()})
        keyboard.down().onPressDo({magoProtagonista.moverAbajo()})
        keyboard.f().onPressDo({magoProtagonista.hacerHechizo()})
        keyboard.num1().onPressDo({magoProtagonista.cambiarTipoDeMagiaA(hielo)})
        keyboard.num2().onPressDo({magoProtagonista.cambiarTipoDeMagiaA(fuego)})
        keyboard.num3().onPressDo({magoProtagonista.cambiarTipoDeMagiaA(roca)})
        keyboard.num4().onPressDo({magoProtagonista.cambiarTipoDeMagiaA(viento)})
    }
}
