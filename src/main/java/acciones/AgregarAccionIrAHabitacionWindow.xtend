package acciones

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Selector
import org.uqbar.Habitacion
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.List

// El Observable aparenta ser Habitacion, sin embargo se van a necesitar
// todas las habitaciones disponibles en un Laberinto y todos los elementos
// existentes en las habitaciones de un Laberinto
class AgregarAccionIrAHabitacionWindow extends SimpleWindow<Habitacion> {
	
	new(WindowOwner parent, Habitacion model) {
		super(parent, model)
		this.setTitle("Agregar acción de Ir a otra habitación")
	}
	
	override protected createFormPanel(Panel mainPanel) {
	
		mainPanel.layout = new VerticalLayout()
	
		new Label(mainPanel) => [	
			text = "Selecciona una habitación a la cual ir"
		]
		
		new List<Habitacion>(mainPanel) => [
			
			allowNull(false)
		]
	
		val botoneraPanel = new Panel(mainPanel) => [
			layout = new HorizontalLayout()
		]
		
		new Button(botoneraPanel) => [
			caption = "Cancelar"

		]
		
		new Button(botoneraPanel) => [
			caption = "Agregar"
			
		] 		
	}
	
		override protected addActions(Panel actionsPanel) {
	
	}
}