package arena_dueloleyendas.componentes

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Container
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import jugador.EstadisticaDePersonaje

class EstadisticaFormato extends Panel {
	
	

	
	new(Container container,String estadistica) {
		super(container)
		
		this.layout = new ColumnLayout(2) => [
			new Label(this) => [
			text = "Jugadas"
			]
			new Label(this) => [
				bindValueToProperty(estadistica +".duelosIniciados")
			]
			new Label(this) => [
				text = "Ganadas"
			]
			new Label(this) => [
				bindValueToProperty(estadistica +".duelosGanados")
			]
			new Label(this) => [
				text = "Kills"
			]
			new Label(this) => [
				bindValueToProperty(estadistica +".duelosGanadosNoIniciados")
			]
			new Label(this) => [
				text = "Deaths"
			]
			new Label(this) => [
				bindValueToProperty(estadistica +".derrotasNoIniciadas")
			]
			new Label(this) => [
				text = "Assists"
			]
			new Label(this) => [
				bindValueToProperty(estadistica +".duelosEmpatados")
			]
			new Label(this) => [
				text = "Mejor Ubicacion"
			]
			new Label(this) => [
				bindValueToProperty(estadistica +".mejorUbicacion")
			]
			new Label(this) => [
				text = "Calificacion"
			]
			new Label(this) => [
				bindValueToProperty(estadistica +".calificacion")
			]
	
		]}
}