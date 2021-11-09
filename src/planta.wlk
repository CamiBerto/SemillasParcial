class Planta {

	var property anioDeCreacion = 0 
	var property altura = 0 

	method esFuerte() {
		return self.horasDeSolQueTolera() > 10
	}

	method daSemillas() {
		return self.esFuerte()
	}
	method espacio()
	
	method horasDeSolQueTolera()
	
	method esIdeal(parcela)
	
	method meAsocioBien(parcela){
		return parcela.plantaSeAsociaBien(self)
	}
}

class Menta inherits Planta {

	override method horasDeSolQueTolera() = 6

	override method daSemillas() {
		return super() || altura > 0.4
	}

	override method espacio() {
		return altura * 3
	}
	
	override method esIdeal(parcela){
		return parcela.superficie() > 6
	}
	

}

class Soja inherits Planta{
	
	override method horasDeSolQueTolera(){
		return 6 + if(altura.between(0.5, 1)) {1} else if(altura > 1){3} else {0}
		
	}
	override method espacio() {
		return altura / 2
	}
	override method daSemillas() {
		return super() || (anioDeCreacion >= 2007 && altura > 1)
	}
	override method esIdeal(parcela){
		return self.horasDeSolQueTolera() == parcela.horasDeSol() 
	}
}
class Quinoa inherits Planta{
	var property horasDeSolQueTolera = 0
	
	override method espacio() = 0.5
	
	override method daSemillas(){
		return super() || anioDeCreacion <= 2005
	}
	
	override method esIdeal(parcela){
		return parcela.plantas().all{ planta => planta.altura() < 1.5}
	}	
}

class SojaTransgenica inherits Soja{
	
	override method daSemillas() {
		return false
	}
	
	override method esIdeal(parcela){
		return parcela.cantidadMaxima() == 1
	}	
}

class HierbaBuena inherits Menta{
	
	override method espacio() {
		return super() * 2
	}	
}
