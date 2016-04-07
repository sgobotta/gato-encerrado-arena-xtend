package habitacion

import org.uqbar.arena.windows.WindowOwner
import org.uqbar.appmodel.AgregarHabitacionAppModel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button

class AgregarHabitacionWindow extends SimpleWindow<AgregarHabitacionAppModel> {
	new(WindowOwner parent, AgregarHabitacionAppModel model) {
		super(parent, model)
		this.setTitle("Crear una Habitación")
		this.taskDescription = ""
	}
	
	override protected createFormPanel(Panel mainPanel) {
	
		mainPanel.layout = new VerticalLayout()
	
		new Label(mainPanel) => [	
			text = "Escriba el nombre de la habitación"
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