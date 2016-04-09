package acciones

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.appmodel.AgregarAccionAppModel
import org.uqbar.appmodel.AgregarAccionUsarElementoAppModel
import org.uqbar.appmodel.AgregarAccionAgarrarElementoAppModel
import java.util.ArrayList

// El Observable aparenta ser Habitacion, donde se guardará un "item"
class AgregarAccionWindow extends SimpleWindow<AgregarAccionAppModel> {
	
	new(WindowOwner parent, AgregarAccionAppModel model) {
		super(parent, model)
		this.setTitle("Agregar acción")
		this.taskDescription = ""
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
			onClick = [ | this.crearAccionDeIrAOtraHabitacion ]
		]
		
		new Button(botoneraPanel) => [
			caption = "Agregar acción de Agarrar un elemento"
			onClick = [ | this.crearAccionDeAgarrarElemento ]
		] 
	
		new Button(botoneraPanel) => [
			caption = "Agregar acción de Usar un elemento"
			onClick = [ | this.crearAccionDeUsarElemento ]
		] 	
	}
	
	def crearAccionDeUsarElemento() {
	    
	    /**
	    var newAppModel = new AgregarAccionUsarElementoAppModel() => [
	        
	        laberintoSeleccionado = modelObject.laberintoSeleccionado
	        habitacionSeleccionada = modelObject.habitacionSeleccionada
	
	        todosLosItems = laberintoSeleccionado.todosLosItems
	        
	        // Se rompe cuando queremos buscar la lista de todos los items del laberinto.
	        // Se rompe tambien si le pido solamene la lista de una sola habitacion.
	        // Esto sucede porque buscabamos item en getTodosLosItems iterando sobre una lista
	        // con Todas las acciones, algunas de las cuales no tenian el atributo item 
	    ]
        */
        
        this.close   
        //new AgregarAccionUsarElementoWindow(this, newAppModel).open() Si usamos reconfig esto se puede borrar
		new AgregarAccionUsarElementoWindow(this, appModelReconfigUsarElemento(modelObject)).open()
	}
	
	
	def appModelReconfigUsarElemento(AgregarAccionAppModel oldAppModel){
		var newAppModel = new AgregarAccionUsarElementoAppModel()
		newAppModel.laberintoSeleccionado = oldAppModel.laberintoSeleccionado
		newAppModel.habitacionSeleccionada = oldAppModel.habitacionSeleccionada
		// Agregado para que el appmodel lleve todos los items!
		newAppModel.todosLosItems = oldAppModel.laberintoSeleccionado.todosLosItems
		newAppModel
	}
	
	
	
	def crearAccionDeAgarrarElemento() {
	    
	    var newAppModel = new AgregarAccionAgarrarElementoAppModel()
	    newAppModel.laberintoSeleccionado = modelObject.laberintoSeleccionado
	    newAppModel.habitacionSeleccionada = modelObject.habitacionSeleccionada
	    
	    this.close
		new AgregarAccionAgarrarElementoWindow(this, newAppModel).open()
	}
	
	def crearAccionDeIrAOtraHabitacion() {
	    this.close
		new AgregarAccionIrAHabitacionWindow(this, modelObject).open()
	}
	
	override protected addActions(Panel actionsPanel) {
	// Vacio, no se utiliza el actionsPanel.
	}
	
}