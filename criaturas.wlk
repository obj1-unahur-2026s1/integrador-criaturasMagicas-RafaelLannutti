//  >  <

class Criatura{
    var poderMagico
    var Astucia
    var rolParque   
    
    method ObtenerPoder() {
        poderMagico = (poderMagico * 10 ) + rolParque.obtenerPoder()
    }


}
//Roles
object guardian {
    method obtenerPoder(){
        return 100
    }
}

class Domador {
    const mascotasQueEntreno = []
    method domarUna(unaMascota){
        mascotasQueEntreno.add(unaMascota)
    }

    method obtenerPoder(){
        mascotasQueEntreno.size({ m => m.mascotasConCuernos()})
    }

    method mascotasConCuernos(){
        mascotasQueEntreno.filter({m => m.tieneCuernos()})
    }

  
}

class Mascota{
    var edad
    var tieneCuernos
    method edad(){
        return edad
    }
    method tieneCuernos() {
      return tieneCuernos
    }
}


object hechicero {
  method obtenerPoder(){
    return 0
  }
}
// Roles




class Duende inherits Criatura{

}

class Hada inherits Criatura{
    var kilometrosQueVuela = 2
    method aumentaKm(){
        kilometrosQueVuela = (kilometrosQueVuela + 1).min(25)
    }

}
