package appModel

import java.util.Collection
import jugador.Personaje
import jugador.EstadisticasPj

class PrepareEstadisticasPjsAppModel {
	
	Collection<Personaje> personajes
	Collection<EstadisticasPj> estadisticas
	
	new (Collection<EstadisticasPj> e , Collection<Personaje> p) {
		this.personajes = p; this.estadisticas = e
	}
	
	def estadisticasPreparadas() {
		var Collection<EstadisticasArmadasAppModel> est = newArrayList
		for (Personaje p : this.personajes) {
			var estadistica = this.estadisticas.findFirst[each | each.nombre.equals(p.nombre)]
			if (estadistica != null)
				est.add(new EstadisticasArmadasAppModel(p,estadistica))
			else
				est.add(new EstadisticasArmadasAppModel(p,new EstadisticasPj(p.nombre)))
		}
		return est
	}
}