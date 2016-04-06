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
		
		//El selector debería ser de Item o String, dependiendo de como idententifiquemos a los items, no de Habitacion.
		new Selector<Habitacion>(mainPanel) => [
			//Elemento que puede ser usado, hay que preguntar como hacer el bindItems.
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
			
			// By juanma: En realidad no es de la accion seleccionada, cuando yo toque "Agregar" en la accion que voy a enganchar con el item
			// La ventana de armado de esa accion deberia cerrarse y de alguna manera mandarle a su owner cierto mensaje, como ese owner vendría
			// a ser la ventana de seleccion de armado de accion, esa ventana a su vez tendría que mandarle a su owner (Esta clase) la data para
			// saber cual vendría a ser la accion que se agrego. Supongo.
			// Asi mismo, asi deberían funcionar el resto de los botones aceptar, mandandoles a su owner cierta data. Supongo. De nuevo.
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
}