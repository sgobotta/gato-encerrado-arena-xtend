package laberinto

import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.appmodel.AgregarLaberintoAppModel

class AgregarLaberintoWindow extends SimpleWindow<AgregarLaberintoAppModel> {
	
	new(WindowOwner parent, AgregarLaberintoAppModel model) {
		super(parent, model)
		this.setTitle("Crear un Laberinto")
		this.taskDescription = ""
	}
	
	override protected createFormPanel(Panel mainPanel) {
	
		mainPanel.layout = new VerticalLayout()
	
		new Label(mainPanel) => [	
			text = "Escriba el nombre del laberinto"
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