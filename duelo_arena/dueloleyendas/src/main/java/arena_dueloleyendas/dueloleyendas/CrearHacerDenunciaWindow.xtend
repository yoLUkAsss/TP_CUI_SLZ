package arena_dueloleyendas.dueloleyendas

import org.uqbar.arena.windows.SimpleWindow
import appModel.DenunciaFacade
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.bindings.PropertyAdapter
import denuncias.Denuncia
import org.uqbar.arena.bindings.NotNullObservable
import java.awt.Color

class CrearHacerDenunciaWindow extends SimpleWindow<DenunciaFacade>{
	
	new(WindowOwner owner, DenunciaFacade d) {
		super(owner, d)
		title = "Denunciar"
		taskDescription = "Hacer denuncia"
	}
	
	override protected addActions(Panel mainPanel) {
		new Button(mainPanel) => [
			caption = "Cancelar"
			
			setAsDefault
			onClick [ | 
				showInfo(modelObject.hacerDenuncia().getTitle());
				this.close()	
			]
			bindEnabled(new NotNullObservable("denuncia"))
			bindEnabled(new NotNullObservable("denuncia.descripcion"))
			disableOnError
		]
		
		new Button(mainPanel) => [
			caption = "Cancelar"
			setAsDefault
			onClick [ | this.close() ]
			disableOnError
		]
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val editorPanel = new Panel(mainPanel)
		editorPanel.layout = new VerticalLayout()
		
		new Label(editorPanel) => [
			text = '''Estas queriendo denunciar a: «modelObject.to.nombre»'''
			foreground = Color.white
		]
		
		val panHor = new Panel(editorPanel)
		panHor.layout = new HorizontalLayout()
		new Label(panHor).setText("Motivo")
		new Selector(panHor) => [
			allowNull = false
			bindItemsToProperty("motivosPosibles").adapter = new PropertyAdapter(Denuncia, "motivo")
			bindValueToProperty("denuncia")
			
		]
		val panHor2 = new Panel(editorPanel)
		panHor2.layout = new HorizontalLayout()
		new Label(panHor2).setText("Detalles")
		new TextBox(panHor2) => [
			bindValueToProperty("denuncia.descripcion")
			
			
		]
		
	}
	
}
