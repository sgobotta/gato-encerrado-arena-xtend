package acciones

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.Habitacion
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.layout.HorizontalLayout

// El Observable aparenta ser Habitacion, donde se guardará un "item"
class AgregarAccionWindow extends SimpleWindow<Habitacion> {
	
	new(WindowOwner parent, Habitacion model) {
		super(parent, model)
		this.setTitle("Agregar acción")
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
			this.close
		]
		
		new Button(botoneraPanel) => [
			caption = "Agregar acción de Agarrar un elemento"
			
		] 
	
		new Button(botoneraPanel) => [
		caption = "Agregar acción de Usar un elemento"
		
		] 	
	}
	
		override protected addActions(Panel actionsPanel) {
		
		/**
		
		var descripcion = new Label(actionsPanel)
		descripcion.text = ""
		
		var selector = new Selector<Habitacion>(actionsPanel) => [
			allowNull(false)
			]
		
		var botonAceptar = new Button(actionsPanel) => [
			caption = "Aceptar"
		]
				
		var botonCancelar = new Button(actionsPanel) => [
			caption = "Cancelar"
		]
	}
	
	*/
	
	}
}