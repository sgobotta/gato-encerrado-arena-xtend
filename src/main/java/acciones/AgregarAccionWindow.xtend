package acciones

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.appmodel.AgregarAccionAppModel

// El Observable aparenta ser Habitacion, donde se guardará un "item"
class AgregarAccionWindow extends SimpleWindow<AgregarAccionAppModel> {
	
	new(WindowOwner parent, AgregarAccionAppModel model) {
		super(parent, model)
		this.setTitle("Agregar acción")
		this.taskDescription = ""
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		mainPanel.layout = new VerticalLayout()
	
		new Label(mainPanel) => [	
			text = "Selecciona una acción a agregar"
		]
	
		val botoneraPanel = new Panel(mainPanel) => [
			layout = new HorizontalLayout()
		]
		
		new Button(botoneraPanel) => [
			caption = "Agregar acción de Ir a otra habitación"
			onClick = [ | this.crearAccionDeIrAOtraHabitacion ]
		]
		
		new Button(botoneraPanel) => [
			caption = "Agregar acción de Agarrar un elemento"
			onClick = [ | this.crearAccionDeAgarrarElemento ]
		] 
	
		new Button(botoneraPanel) => [
			caption = "Agregar acción de Usar un elemento"
			onClick = [ | this.crearAccionDeUsarElemento ]
		] 	
	}
	
	def crearAccionDeUsarElemento() {
		new AgregarAccionUsarElementoWindow(this, modelObject).open()
	}
	
	def crearAccionDeAgarrarElemento() {
		new AgregarAccionAgarrarElementoWindow(this, modelObject).open()
	}
	
	def crearAccionDeIrAOtraHabitacion() {
		new AgregarAccionIrAHabitacionWindow(this, modelObject).open()
	}
	
		override protected addActions(Panel actionsPanel) {
	
	}
	
}