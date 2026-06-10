//  >  <

class Criatura{
    var poderMagico
    var Astucia
    var rolParque   
    
    method ObtenerPoder() {
        poderMagico = (poderMagico * 10 ) + rolParque.obtenerPoder() * self.casoEspecifico()
    }

    method casoEspecifico ()

    method esFormidable()

    //method esExtraordinario()
    method ritual(){
        rolParque = rolParque.cambiarRol()
    }

    method perder15DePoder(){
        poderMagico =poderMagico *0.85
    }

}
//Roles
object guardian {
    method obtenerPoder(){
        return 100
    }

    method esExtraordinario(){
        return self.obtenerPoder() > 50
    }

    method cambiarRol() {
     return new Domador(mascotasQueEntreno = [new Mascota(edad = 1, tieneCuernos = false)])
    }
    
    method ritual(){

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
        return mascotasQueEntreno.any({m => m.tieneCuernos()})
    }

    method esExtraordinario(){
        return mascotasQueEntreno.any({m => m.obtenerPoder() >= 15 }) and mascotasQueEntreno.all({m => m.esVeterana()})
    }
  
    method cambiarRol(){
        if (self.mascotasConCuernos()){
            return hechicero
        }else{
            self.error("no se pudio")
        }
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
    method esVeterana() {
        return edad >= 10
    }
}


object hechicero {
  method obtenerPoder(){
    return 0
  }
  method esExtraordinario(){
    return true
  }

  method cambiarRol(){
    return guardian
  }

}
// Roles




class Duende inherits Criatura{
    override method casoEspecifico() {
      return 1.1
    }
    override method esFormidable (){
        return false
    }
}

class Hada inherits Criatura{
    var kilometrosQueVuela = 2
    var astucia
    method aumentaKm(){
        kilometrosQueVuela = (kilometrosQueVuela + 1).min(25)
    }
    override method casoEspecifico() {
      return 1
    }

    method astucia(){
        return astucia
    }
    override method esFormidable() {
      return astucia > 50
    }
    method esExtraordinario(){
        return kilometrosQueVuela >= 10
    }
}


class Colonia {
    const criaturas = []

    method poderOfensivo(){
        return criaturas.sum({c => c.poderOfensivo() })
    }
    method atacarA(unArea){
        if(self.poderOfensivo() > unArea.poderDefensivo()){
            unArea.esUsurpada(self)
        }else{
            criaturas.forEach({c => c.perder15DePoder()})
        }
    }
}
class Area{
    var colonia = new Colonia(criaturas=[])
    method poderDefensivo()

    method cantidadDeCriaturasFormidables() {
      colonia.count({c => c.esFormidable()})
    }

    method esUsurpada(unaColonia) {
      colonia = unaColonia
    }
}

class Castillo inherits Area{

    override method poderDefensivo(){
        return 200 * colonia.cantidadDeCriaturasFormidables()
    }
}

class Claro inherits Area{
    override method poderDefensivo(){
        return 100 + colonia.poderOfensivo()
    }
}