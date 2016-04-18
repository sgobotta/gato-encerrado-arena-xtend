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

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class AgregarHabitacionWindow extends SimpleWindow<AgregarHabitacionAppModel> {
	new(WindowOwner parent, AgregarHabitacionAppModel model) {
		super(parent, model)
		this.setTitle("Crear una Habitación")
		this.taskDescription = ""
	}
	
	override void createMainTemplate(Panel mainPanel) {
        this.createFormPanel(mainPanel);
        this.createActionsPanel(mainPanel);
    }
    
	override protected createFormPanel(Panel mainPanel) {
	
		mainPanel.layout = new VerticalLayout()
	
		new Label(mainPanel) => [	
			text = "Escriba el nombre de la habitación"
		]
		
		new TextBox(mainPanel) => [
			value <=> "nombreHabitacion"
			width = 100
		]
	
		val botoneraPanel = new Panel(mainPanel) => [
			layout = new HorizontalLayout()
		]
		
		new Button(botoneraPanel) => [
			caption = "Cancelar"
			onClick = [|this.close]
		]
		
		new Button(botoneraPanel) => [
			caption = "Agregar"
			onClick = [|agregarHabitacion]
		] 
	}
	
	def agregarHabitacion() {
		modelObject.agregarHabitacion()
		this.close
	}
	
		override protected addActions(Panel actionsPanel) {
	
	}
}