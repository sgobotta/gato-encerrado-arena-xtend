package acciones

import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.appmodel.AgregarAccionAgarrarElementoAppModel

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.acciones.AgarrarItem

class AgregarAccionAgarrarElementoWindow extends SimpleWindow<AgregarAccionAgarrarElementoAppModel> {
	
	new(WindowOwner parent, AgregarAccionAgarrarElementoAppModel model) {
		super(parent, model)
		this.setTitle("Agregar acción de Agarrar un elemento")
		this.taskDescription = ""
	}
	
	override void createMainTemplate(Panel mainPanel) {
        this.createFormPanel(mainPanel);
        this.createActionsPanel(mainPanel);
    }
	
	override protected createFormPanel(Panel mainPanel) {
	
		mainPanel.layout = new VerticalLayout()
	
		new Label(mainPanel) => [	
			text = "Escriba el elemento	que aparecerá en la habitación"
		]
		
		new TextBox(mainPanel) => [
			value <=> "nombreItem"
			width = 100
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
			onClick = [| this.agregarAccion()]
		] 
	}
	
	def agregarAccion() {
	    
	    var nuevaAccion = new AgarrarItem() => [
	        nombreItem = modelObject.nombreItem
	    ]
	    
	    modelObject.validarInput(nuevaAccion)
	    this.close
	}
	
		override protected addActions(Panel actionsPanel) {
	
	}
}