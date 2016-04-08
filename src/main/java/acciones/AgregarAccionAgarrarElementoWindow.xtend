package acciones

import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.appmodel.AgregarAccionAppModel

class AgregarAccionAgarrarElementoWindow extends SimpleWindow<AgregarAccionAppModel > {
	
	new(WindowOwner parent, AgregarAccionAppModel  model) {
		super(parent, model)
		this.setTitle("Agregar acción de Agarrar un elemento")
		this.taskDescription = ""
	}
	
	override protected createFormPanel(Panel mainPanel) {
	
		mainPanel.layout = new VerticalLayout()
	
		new Label(mainPanel) => [	
			text = "Escriba el elemento	que aparecerá en la habitación"
		]
		
		new TextBox(mainPanel) => [
			// binding acá
			width = 100
		]
	
		val botoneraPanel = new Panel(mainPanel) => [
			layout = new HorizontalLayout()
		]
		
		new Button(botoneraPanel) => [
			caption = "Cancelar"
			this.close
		]
		
		new Button(botoneraPanel) => [
			caption = "Agregar"
			
		] 
	}
	
		override protected addActions(Panel actionsPanel) {
	
	}
}