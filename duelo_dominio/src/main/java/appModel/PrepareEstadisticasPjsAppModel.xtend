package appModel

import java.util.Collection
import jugador.Personaje
import jugador.EstadisticasPj
import jugador.Jugador

class PrepareEstadisticasPjsAppModel {
	
	Collection<Personaje> personajes
	Jugador jugador
	
	new (Jugador j , Collection<Personaje> p) {
		this.personajes = p; this.jugador = j
	}
	
	def estadisticasPreparadas() {
		var Collection<EstadisticasArmadasAppModel> est = newArrayList
		for (Personaje p : this.personajes) {
			var estadistica = this.jugador.est.findFirst[each | each.nombre.equals(p.nombre)]
			if (estadistica != null)
				est.add(new EstadisticasArmadasAppModel(p,estadistica))
			else{
			var estN = new EstadisticasPj(p.nombre)
				est.add(new EstadisticasArmadasAppModel(p,estN))
				jugador.est.add(estN)
				
				}
		}
		return est
	}
}