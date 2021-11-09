
import planta.*
import parcela.*

object inta {
	const property parcelas = #{}
	
	method agregarParcela(parcela){ parcelas.add(parcela)}
	method sacarParcela(parcela){ parcelas.remove(parcela)}
	
	method promedioDePlantas(){
		return (self.cantidadDePlantas() / parcelas.size()).truncate(0)
	}
	
	method tamaniosDeParcela(parcela){
		return parcela.plantas().size()
	}
	method cantidadDePlantas(){
		return parcelas.sum{ parcela => self.tamaniosDeParcela(parcela)}
	}
	method parcelasConMasDe4Plantas(){
		return parcelas.filter{ parcela => parcela.cantidadDePlantas() >= 4}
	}
	method parcelaAutosustentable(){
		return self.parcelasConMasDe4Plantas().max{parcela => parcela.cantidadDePlantasQueSeAsocianBien()}
	}
	
	
	
}