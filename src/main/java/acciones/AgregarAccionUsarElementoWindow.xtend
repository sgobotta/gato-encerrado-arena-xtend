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
import org.uqbar.appmodel.AgregarAccionAppModel

// El Observable aparenta ser Habitacion, sin embargo se van a necesitar
// todas las habitaciones disponibles en un Laberinto
class AgregarAccionUsarElementoWindow extends SimpleWindow<AgregarAccionAppModel > {
	
	new(WindowOwner parent, AgregarAccionAppModel  model) {
		super(parent, model)
		this.setTitle("Agregar acción de Usar un elemento")
	}
	
	override protected createFormPanel(Panel mainPanel) {
	
		mainPanel.layout = new VerticalLayout()
	
		new Label(mainPanel) => [	
			text = "Seleccione el elemento que puede ser usado"
		]
		
		new Selector<Habitacion>(mainPanel) => [
			//Habitaciones donde ir
			allowNull(false)
		]
	
		new Label(mainPanel) => [
			
			text = "Cree la acción a realizar"
		]
		
		new Button(mainPanel) => [
			
			caption = "Agregar acción"
			onClick = [ | new AgregarAccionWindow(this, modelObject).open() ]
		]
		
		new Label(mainPanel) => [
			
			// caption = nombre de la accion seleccionada
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