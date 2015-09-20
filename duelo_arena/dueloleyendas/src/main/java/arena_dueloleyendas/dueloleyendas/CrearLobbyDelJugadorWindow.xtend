package arena_dueloleyendas.dueloleyendas

import appModel.Duelo
import appModel.EstadisticasArmadasAppModel
import arena_dueloleyendas.componentes.EstadisticaFormato
import java.awt.Color
import jugador.Posicion
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import excepciones.NoHayRivalException

class CrearLobbyDelJugadorWindow extends SimpleWindow<Duelo> {
	
	new(WindowOwner parent, Duelo model) {
		super(parent, model)
		title = "Duelo entre Leyendas"
	}
	
	override protected addActions(Panel arg0) {
		//No Quiero Usarlo
	}
	
	override protected createFormPanel(Panel arg0) {
		//No Quiero Usarlo
	}
	
	
	override createMainTemplate(Panel mainPanel) {
		//this.title = "Duelo entre Leyendas"
		
		mainPanel.layout = new VerticalLayout 
		
		new Label(mainPanel) => [
			text ='''Bienvenido: «modelObject.jugador.nombre» Desde esta pantalla podras elegir un personaje para batirte a duelo con otro jugador. Recuerda siempre 
revisar tus stats!'''
		]
		
		new Label(mainPanel) => [
			text = "Selecciona tu personaje para el duelo!"
			fontSize = 24
			background = Color.BLACK
			foreground = Color.WHITE
		]
		
		var Panel contentPanel = new Panel(mainPanel)
		contentPanel.layout = new ColumnLayout(3)
		this.createPanelDeBusqueda(contentPanel)
		this.createInfoDelPersonaje(contentPanel)
		this.createStatYBotonera(contentPanel)
	}
	
	def createPanelDeBusqueda(Panel mainPanel) {
		
		var Panel primerPanel = new Panel(mainPanel)
		primerPanel.layout = new VerticalLayout
		primerPanel.width = 150
		var Panel busqueda = new Panel(primerPanel)
		busqueda.layout = new HorizontalLayout
		
		new Label(busqueda) => [
			text = "Personaje buscado"
		]
		new TextBox(busqueda) => [
			bindValueToProperty("filtro")
			width = 100
		]
		
		var tablaDePersonajes = new Table<EstadisticasArmadasAppModel>(primerPanel , EstadisticasArmadasAppModel)
		tablaDePersonajes.bindValueToProperty("estadisticaSeleccionada")
		tablaDePersonajes.bindItemsToProperty("estadisticasAMostrar")
		tablaDePersonajes.height = 200 
		
		new Column(tablaDePersonajes) => [
			title = "Personaje:"
			bindContentsToProperty("pjAsociado.nombre")
		]	
		new Column(tablaDePersonajes) => [
			title = "Calificacion:"
			bindContentsToProperty("estAsociada.calificacion")
		]
	}
	
	def createInfoDelPersonaje(Panel mainPanel) {
		
		var Panel segundoPanel = new Panel(mainPanel)
		segundoPanel.layout = new VerticalLayout
		//segundoPanel.width = 200
		
		new Label(segundoPanel) => [
			bindValueToProperty("estadisticaSeleccionada.pjAsociado.nombre")
			fontSize = 20
			width = 150
		]
		new Label(segundoPanel) => [
			text = "Especialidades:"
			foreground = Color.GREEN
		]
		new Label(segundoPanel) => [
			bindValueToProperty("estadisticaSeleccionada.pjAsociado.especialidad")
		]
		new Label(segundoPanel) => [
			text = "Debilidades:"
			foreground = Color.GREEN
		]
		new Label(segundoPanel) => [
			bindValueToProperty("estadisticaSeleccionada.pjAsociado.debilidad")
		]
		new Label(segundoPanel) => [
			text = "Mejor Posicion:"
			foreground = Color.GREEN
		]
		new Label(segundoPanel) => [
			bindValueToProperty("estadisticaSeleccionada.pjAsociado.posIdeal")
		]	
	}
	
	def createStatYBotonera(Panel mainPanel) {
		
		var Panel tercerPanel = new Panel(mainPanel)
		tercerPanel.layout = new VerticalLayout
		tercerPanel.width = 350
		
		new Label(tercerPanel) => [
			text = "Stats"
			fontSize = 20
		]
		var Panel est = new Panel(tercerPanel)
		est.layout = new ColumnLayout(2)
		
		new Label(est) => [
			text = "Jugadas"
		]
		new Label(est) => [
			bindValueToProperty("estadisticaSeleccionada.estAsociada.duelosIniciados")
		]
		new Label(est) => [
			text = "Ganadas"
		]
		new Label(est) => [
			bindValueToProperty("estadisticaSeleccionada.estAsociada.duelosGanados")
		]
		new Label(est) => [
			text = "Kills"
		]
		new Label(est) => [
			bindValueToProperty("estadisticaSeleccionada.estAsociada.duelosGanadosNoIniciados")
		]
		new Label(est) => [
			text = "Deaths"
		]
		new Label(est) => [
			bindValueToProperty("estadisticaSeleccionada.estAsociada.derrotasNoIniciadas")
		]
		new Label(est) => [
			text = "Assists"
		]
		new Label(est) => [
			bindValueToProperty("estadisticaSeleccionada.estAsociada.duelosEmpatados")
		]
		new Label(est) => [
			text = "Mejor Ubicacion"
		]
		new Label(est) => [
			bindValueToProperty("estadisticaSeleccionada.estAsociada.mejorUbicacion")
		]
		new Label(est) => [
			text = "Calificacion"
		]
		new Label(est) => [
			bindValueToProperty("estadisticaSeleccionada.estAsociada.calificacion")
		]
		
		
		new Label(tercerPanel) => [
			text = "Jugar"
			fontSize = 20
		]
		
		var Panel buttons = new Panel(tercerPanel)
		buttons.layout = new ColumnLayout(2)
		
		var boton1 = new Button(buttons)
		boton1.caption = "TOP"
		boton1.onClick([| try {
							this.openDialog(new CrearResultadoDueloWindow (this,modelObject.iniciarDuelo(Posicion.TOP)))
						  } catch (NoHayRivalException e) {
						  	this.openDialog(new CrearAJugarConMRXWindow(this,modelObject,Posicion.TOP))
						  } 
						  ])
		boton1.width = 100
		
		var boton2 = new Button(buttons)
		boton2.caption = "MID"
		boton2.onClick([| modelObject.iniciarDuelo(Posicion.MID) ])
		boton2.width = 100
		
		var boton3 = new Button(buttons)
		boton3.caption = "JUNGLE"
		boton3.onClick([| modelObject.iniciarDuelo(Posicion.JUNGLE)])
		boton3.width = 100
		
		var boton4 = new Button(buttons)
		boton4.caption = "BOT"
		boton4.onClick([| modelObject.iniciarDuelo(Posicion.BOT) ])
		boton4.width = 100
	}
	
	def openDialog(SimpleWindow<?> sw) {
		sw.open
	}
}