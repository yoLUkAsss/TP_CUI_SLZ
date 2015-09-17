package arena_dueloleyendas.dueloleyendas

import appModel.ResultadoDueloAppModel
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import java.awt.Color
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.windows.Dialog
import appModel.DenunciaFacade
import org.uqbar.arena.windows.SimpleWindow
import jugador.Jugador

class CrearResultadoDueloWindow extends TransactionalDialog<ResultadoDueloAppModel> {
	
	new(WindowOwner parent, ResultadoDueloAppModel model) {
		super(parent, model)
		title= '''«model.retador.pj.nombre» vs «model.rival.pj.nombre»'''
	}
	
	override protected addActions(Panel mainPanel) {
		new Button(mainPanel) => [
			caption = "Aceptar derrota con honor"
			
			setAsDefault
			onClick [ | this.close()
					
			]

			disableOnError
		]
		
		new Button(mainPanel) => [
			caption = "Denunciar actitud antideportiva"
			setAsDefault
			onClick [ | this.openDialog(new CrearHacerDenunciaWindow(this,new DenunciaFacade(modelObject.retador.jugador,modelObject.rival.jugador)))
				
			]
		]
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val form = new Panel(mainPanel).layout = new VerticalLayout()
		
		new Label(form) => [
			text = modelObject.description
			foreground = Color.GREEN
			background = Color.YELLOW
		]
		val cLt = new Panel(form).layout = new ColumnLayout(2);
		val verLeiaut1 = new Panel(cLt).layout = new VerticalLayout()
		val verLeiaut2 = new Panel(cLt).layout = new VerticalLayout()
		crearEstadisticasDeJugadorEstatico(verLeiaut1,modelObject.retador.jugador)
		crearEstadisticasDeJugadorEstatico(verLeiaut2,modelObject.rival.jugador)
		
	}
	
	def crearEstadisticasDeJugadorEstatico(Panel panel,Jugador j) {
		new Label(panel) => [
			text = j.nombre
			foreground = Color.WHITE
			background = Color.BLUE
		]
	}
	
	def openDialog(SimpleWindow<?> sw) {
		sw.open
		this.close
	}
	
}