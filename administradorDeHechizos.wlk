import enemigos.*
import mago.*
/*
Hace que colisionen con el pixel actual o el siguiente.
ya que parece que como el dragon va restando y el hechizo sumando en el eje x
estos se omiten
*/

// ===============================
// Administrador de Hechizos: Controla la creación y gestión de Hechizos
// ===============================
object administradorDeHechizos {
    // Propiedades
    var nombreHechizo = 20000 // Identificador único para cada Hechizo creado
    var property hechizos = #{} // Almacena los Hechizos creados

    method nombre() = nombreHechizo // Obtiene el último nombre usado

    // Incrementa el contador de nombreHechizo para nombrar Hechizos de manera única
    method sumarHechizo() { nombreHechizo += 1 }

    // Genera un nuevo Hechizo en la posición y tipo especificado
    method generarHechizo(posicion, tipoDeMagia) {
        const hechizo = new Hechizo(position = posicion, tipo = tipoDeMagia, frames = tipoDeMagia.frames(), danio = tipoDeMagia.danio())
        
        hechizos.add(hechizo)
        self.sumarHechizo()

        hechizo.iniciar()

    }

    // Mueve cada hechizo en la lista
    method moverHechizos() {
        hechizos.forEach({ hechizo => 
            hechizo.moverDerecha()
        })
    }

    // Activa la colisión para cada hechizo en la lista
    method impactarHechizos() {
        hechizos.forEach({ hechizo => hechizo.colisionar() })
    }

    // Elimina un hechizo de la lista
    method destruirHechizo(hechizo) {
        hechizos.remove(hechizo)
    }
    /*
    hacer que esto sea el ontick de cosa animada
    method cambiarFrame(){
        hechizos.forEach({hechizo=> hechizo.cambiarFrame()})
    }
    */
    // Restablece el administrador, eliminando todos los hechizos y reiniciando el contador de nombres
    method reset() {
        hechizos.forEach({ hechizo => hechizo.eliminar() })
        nombreHechizo = 0
        hechizos = []
    }
}
