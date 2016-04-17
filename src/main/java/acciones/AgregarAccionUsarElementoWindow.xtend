package acciones

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.layout.HorizontalLayout
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.appmodel.AgregarAccionUsarElementoAppModel
import org.uqbar.appmodel.AgregarAccionAppModel
import org.uqbar.commons.model.UserException

class AgregarAccionUsarElementoWindow extends SimpleWindow<AgregarAccionUsarElementoAppModel > {
	
	new(WindowOwner parent, AgregarAccionUsarElementoAppModel  model) {
		super(parent, model)
		this.setTitle("Agregar acción de Usar un elemento")
		this.taskDescription = ""
	}
	
	override void createMainTemplate(Panel mainPanel) {
        this.createFormPanel(mainPanel);
        this.createActionsPanel(mainPanel);
    }
	
	override protected createFormPanel(Panel mainPanel) {
	
		mainPanel.layout = new VerticalLayout()
	
		new Label(mainPanel) => [	
			text = "Seleccione el elemento que puede ser usado"
		]
		
		new Selector<String>(mainPanel) => [
		    (items <=> "laberintoSeleccionado.todosLosItems")
			allowNull(false)
			value <=> "itemSeleccionado"
		]
	
		new Label(mainPanel) => [
			
			text = "Cree la acción a realizar"
		]
		
		new Button(mainPanel) => [
			
			caption = "Agregar acción"
			
			onClick = [ | this.agregarAccionAItem() ]
		
		]
		new Label(mainPanel) => [
			
			value <=> "accionARetornar.accion.nombre" // Por alguna razon no anda este binding... meh, despues lo preguntamos
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
	
	
	override protected addActions(Panel actionsPanel) {
	
	}
	
	
	def agregarAccionAItem(){	
		modelObject.accionARetornar.item = modelObject.itemSeleccionado
		var newAppModel = new AgregarAccionAppModel()
		newAppModel.laberintoSeleccionado = modelObject.laberintoSeleccionado
		newAppModel.habitacionSeleccionada = modelObject.habitacionSeleccionada
		newAppModel.objetoParaAgregarleAccion = modelObject.accionARetornar
		
		if(modelObject.itemSeleccionado == null) {
            throw new UserException("Debe seleccionar un item")
        }
		new AgregarAccionWindow(this, newAppModel).open()
	}
	
	def agregarAccion(){
	    
	    
        modelObject.validarInput(modelObject.accionARetornar)
        this.close
	}
	
}