 object sonidoFondo{
    const sonido = game.sound("SonidoInicio.mp3")
    method sonar() {
         sonido.play()
        //sonido.shouldLoop(true)
         //game.schedule(160000, { sonido.play()} )
    }
    method apagar(){
        sonido.stop()
    }
 }
 object sonidoSurvival{
     const sonido = game.sound("sonidoSurvival.mp3")
       method sonar() {
         sonido.play()
         sonido.shouldLoop(true)
    }
    method apagar(){
        sonido.stop()
    }
 }