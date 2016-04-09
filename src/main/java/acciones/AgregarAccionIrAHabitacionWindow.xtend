package acciones

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.Habitacion
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.List
import org.uqbar.appmodel.AgregarAccionAppModel

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.bindings.PropertyAdapter

// El Observable aparenta ser Habitacion, sin embargo se van a necesitar
// todas las habitaciones disponibles en un Laberinto y todos los elementos
// existentes en las habitaciones de un Laberinto
class AgregarAccionIrAHabitacionWindow extends SimpleWindow<AgregarAccionAppModel > {
	
	new(WindowOwner parent, AgregarAccionAppModel model) {
		super(parent, model)
		this.setTitle("Agregar acción de Ir a otra habitación")
		this.taskDescription = ""
	}
	
	override protected createFormPanel(Panel mainPanel) {
	
		mainPanel.layout = new VerticalLayout()
	
		new Label(mainPanel) => [	
			text = "Selecciona una habitación a la cual ir"
		]
		
		new List<Habitacion>(mainPanel) => [
			(items <=> "laberintoSeleccionado.habitaciones").adapter = new PropertyAdapter(Habitacion, "nombreHabitacion")
			height = 150
			width = 130
			value <=> "habitacionSeleccionada"
			height = 300
			allowNull(false)
		]
	
		val botoneraPanel = new Panel(mainPanel) => [
			layout = new HorizontalLayout()
		]
		
		new Button(botoneraPanel) => [
			caption = "Cancelar"
			onClick = [| this.close()]
		]
		
		new Button(botoneraPanel) => [
			caption = "Agregar"
			// onClick = [| hacerAgregadoDeAccion]
		] 		
	}
	
		override protected addActions(Panel actionsPanel) {
	
	}
}