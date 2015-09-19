package arena_dueloleyendas.componentes

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Container
import jugador.EstadisticasPj
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label

class EstadisticaFormato extends Panel {
	
	Label label1
	Label label2
	Label label3
	Label label4
	Label label5
	Label label6
	Label label7
	Label labela
	Label labelb
	Label labelc
	Label labeld
	Label labele
	Label labelf
	Label labelg
	
	
	new(Container container) {
		super(container)
		
		layout = new ColumnLayout(2)
		label1 = (new Label(this)).text = "Jugadas"
		labela = new Label(this)
		
		label2 = (new Label(this)).text = "Ganadas"
		labelb = new Label(this)
		
		label3 = (new Label(this)).text = "Kills"
		labelc = new Label(this)
		
		label4 = (new Label(this)).text = "Deaths"
		labeld = new Label(this)
		
		label5 = (new Label(this)).text = "Assists"
		labele = new Label(this)
		
		label6 = (new Label(this)).text = "Mejor Ubicacion"
		labelf = new Label(this)
		
		label7 = (new Label(this)).text = "Puntaje"
		labelg = new Label(this)
	}
	
	def setLabela (String prop) {
		labela.bindValueToProperty(prop)
	}
	def setLabelb (String prop) {
		labelb.bindValueToProperty(prop)
	}
	def setLabelc (String prop) {
		labelc.bindValueToProperty(prop)
	}
	def setLabeld (String prop) {
		labeld.bindValueToProperty(prop)
	}
	def setLabele (String prop) {
		labele.bindValueToProperty(prop)
	}
	def setLabelf (String prop) {
		labelf.bindValueToProperty(prop)
	}
	def setLabelg (String prop) {
		labelg.bindValueToProperty(prop)
	}
}