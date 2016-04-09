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

class AgregarAccionUsarElementoWindow extends SimpleWindow<AgregarAccionUsarElementoAppModel > {
	
	new(WindowOwner parent, AgregarAccionUsarElementoAppModel  model) {
		super(parent, model)
		this.setTitle("Agregar acción de Usar un elemento")
		this.taskDescription = ""
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
			
			onClick = [ | new AgregarAccionWindow(this, appModelReconfigAgregarAccion(modelObject)).open() ]
		
		]
		new Label(mainPanel) => [
			
			// caption = nombre de la accion seleccionada
			
			// By juanma: En realidad no es de la accion seleccionada, cuando yo toque "Agregar" en la accion que voy a enganchar con el item
			// La ventana de armado de esa accion deberia cerrarse y de alguna manera mandarle a su owner cierto mensaje, como ese owner vendría
			// a ser la ventana de seleccion de armado de accion, esa ventana a su vez tendría que mandarle a su owner (Esta clase) la data para
			// saber cual vendría a ser la accion que se agrego. Supongo.
			// Asi mismo, asi deberían funcionar el resto de los botones aceptar, mandandoles a su owner cierta data. Supongo. De nuevo.
		
		    // Ya se cierran solas las ventanas, al aceptar se manda todo a un appModel ahora.
		    // El problema va a venir cuando querramos meterle una accion a ésta ventana. Luego de hacer
		    // Agregar accion, la ventana que elijamos (por ejemplo ir a habitacion) tendría que setear
		    // la accion de IrAHabitacion al appModel que le pasemos, independientemente si 
		    // IrAHabitacion Window es triggereada de la pantalla principal o de AgregarAccionUsarElemento
		    // Santi B.
		    
		    // Antes habría que solucionar el tema de la lista de items.
		    // getTodosLosItems de laberinto busca sobre todas las acciones, inclusive aquellas
		    // que no tienen items!
		]
	
		val botoneraPanel = new Panel(mainPanel) => [
			layout = new HorizontalLayout()
		]
		
		new Button(botoneraPanel) => [
			caption = "Cancelar"

		]
		
		new Button(botoneraPanel) => [
			caption = "Agregar"
			// Lease el comment en el Label de arriba.
		]	
	}
	
	
	override protected addActions(Panel actionsPanel) {
	
	}
	
	
	def appModelReconfigAgregarAccion(AgregarAccionUsarElementoAppModel oldAppModel){
		var newAppModel = new AgregarAccionAppModel()
		newAppModel.laberintoSeleccionado = oldAppModel.laberintoSeleccionado
		newAppModel.habitacionSeleccionada = oldAppModel.habitacionSeleccionada
		newAppModel
	}
	

}