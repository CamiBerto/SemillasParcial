class Parcela {
	var property largo
	var property ancho
	var property horasDeSol
	var property plantas = []
	
	method plantarPlanta(plantita){
		if(self.plantaPuedeSerPlantada(plantita)){
				plantas.add(plantita)
		}
		else{ self.error("No hay lugar en esta parcela")}
	}
	method cantidadDePlantas(){
		return plantas.size()
	}
	method sacarPlanta(plantita){ plantas.remove(plantita)}
	
	method superficie() = largo * ancho
	
	method cantidadMaxima(){
		return self.plantasMaximas() 
	}
	
	method plantasMaximas(){
		return if(ancho > largo){self.superficie() / 5}
		else{self.superficie() / 3 + largo}
	}
	
	method tieneComplicaciones(){
		return plantas.any{ planta => planta.horasDeSolPorDiaQueTolera() < horasDeSol}
	}
	method plantaPuedeSerPlantada(planta){
		return(plantas.size() < self.cantidadMaxima() || planta.horasDeSolPorDiaQueTolera() - 2 >= horasDeSol)
	}
	method cantidadDePlantasQueSeAsocianBien(){
		return plantas.count{ planta => planta.meAsocioBien(self) }
	}
	
	method plantaSeAsociaBien(planta)
	
	
}


class ParcelaEcologica inherits Parcela{
	
	override method plantaSeAsociaBien(planta){
		return (not self.tieneComplicaciones()) && planta.esIdeal(self)
	}
}

class ParcelaIndustrial inherits Parcela{
	
	override method plantaSeAsociaBien(planta){
		return plantas.size() <= 2 && planta.esFuerte()
	}
}