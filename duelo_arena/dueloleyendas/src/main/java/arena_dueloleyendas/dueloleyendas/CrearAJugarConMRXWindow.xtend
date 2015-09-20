package arena_dueloleyendas.dueloleyendas

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import appModel.ResultadoDueloAppModel
import appModel.Duelo
import jugador.Posicion

class CrearAJugarConMRXWindow extends SimpleWindow<Duelo> {
	
	Posicion posit
	
	new(WindowOwner parent, Duelo model,Posicion p) {
		super(parent, model)
		posit =p
		title = "MR-X"
		taskDescription = "No tienes rival!!"
	}
	
	override protected addActions(Panel actionsPanel) {
		var Button a = new Button(actionsPanel)
		a.caption = "Retar a MR-X"
		a.onClick( [| 	this.openDialog(new CrearResultadoDueloWindow(this,modelObject.iniciarDueloBot(posit)));
						this.close()
		])
			
		var Button b = new Button(actionsPanel) 
		b.caption = "Descansar en mi gloria"
		b.onClick(| this.close())
		
	}
	
	override protected createFormPanel(Panel mainPanel) {
		new Label(mainPanel) => [
			text = '''NO HAY QUIEN SE ANIME EN TU RANKING ACTUAL.
			Puede optar por retar al bot del nivel y tratar de avanzar de nivel en el ranking o disfrutar en tu gloria y descansar
			Que quieres hacer???'''
		]
	}
	
	def openDialog(SimpleWindow<?> sw) {
		sw.open
		this.close
	}
	
}