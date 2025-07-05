import sonidos.*
import niveles.*
//Para que quede bien los fondos deben ser de 1200px x 600px
object menu{
    method position() = game.origin()
    method image() = "menu.png" 
    method activarModoFacil(){
        keyboard.e().onPressDo({
            if (game.hasVisual(self)){
                game.removeVisual(self)
                game.addVisual(nivelFacil)
                sonidoFondo.apagar()
                nivelFacil.iniciarNivel()
            }
        })
    }
    method activarModoSurvival(){
        keyboard.s().onPressDo({
            if (game.hasVisual(self)){
                game.removeVisual(self)
                game.addVisual(nivelSurvival)
                sonidoFondo.apagar()
                nivelSurvival.iniciarNivel()
            }
        })
    }
}