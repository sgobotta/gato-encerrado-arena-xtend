package principal


import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.ColumnLayout
import java.awt.Color
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.List
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.windows.ErrorsPanel
import acciones.AgregarAccionWindow
import org.uqbar.Habitacion
import org.uqbar.appmodel.GatoEncerradoAppModel

class AcaHayGatoEncerradoWindow extends SimpleWindow<GatoEncerradoAppModel> {


	new(WindowOwner parent, GatoEncerradoAppModel model) {
		super(parent, model)
	}
	
	override createFormPanel(Panel mainPanel) {
		this.title = ""

		// Panel cabecera con el panel de error
		
		var cabeceraPanel = new Panel(mainPanel)		
		
		new ErrorsPanel(cabeceraPanel, "")
		
		new Label(mainPanel) => [
			
			text = "Hola " + modelObject + "! Administrá todos tus laberintos"
		]
		
		new Label(mainPanel) => [
			
			text = "Acá hay gato encerrado..."
			fontSize = 20
			background = Color.RED
		]
		
		// Panel contenedor principal de tres paneles
		var contenedorPanel = new Panel(mainPanel) => [
			
			layout = new ColumnLayout(3)
				
		]
		
		// Panel de laberintos
		var laberintosPanel = new Panel(contenedorPanel)
		
		new Label(laberintosPanel).text = "Laberintos"
		
		// Lista de laberintos
		new List(laberintosPanel) => [
			height = 300
		]

		// Panel de botones para laberintos
		var botoneraLaberintoPanel = new Panel(laberintosPanel) => [
			
			layout = new HorizontalLayout
		]

		new Button(botoneraLaberintoPanel) => [
			caption = "Agregar Laberinto"
		]

		new Button(botoneraLaberintoPanel) => [
			caption = "Quitar Laberinto"
		]
		
		// Panel de habitaciones
		var habitacionesPanel = new Panel(contenedorPanel)
		
		// Panel de título de laberinto seleccionado
		
		var habitacionesTituloPanel = new Panel(habitacionesPanel) => [
			
			layout = new ColumnLayout(2)
		]
		
		new Label(habitacionesTituloPanel).text = "Habitaciones de: "
		
		new Label(habitacionesTituloPanel).text = "Nombre del Laberinto"
		
		// Lista de Habitaciones
		new List(habitacionesPanel) => [
			height = 300
		]
		
		// Panel de botones para habitaciones
		var botoneraHabitacionesPanel = new Panel(habitacionesPanel) => [
			
			layout = new HorizontalLayout
		]

		new Button(botoneraHabitacionesPanel) => [
			caption = "Agregar Habitación"
		]

		new Button(botoneraHabitacionesPanel) => [
			caption = "Quitar Habitación"
			
		]
		
		// Panel de Habitacion Seleccionada
		var habitacionSeleccionadaPanel = new Panel(contenedorPanel)
		
		// Panel de titulo de habitación seleccionada
		
		var habitacionTituloPanel = new Panel(habitacionSeleccionadaPanel) => [
			
			layout = new ColumnLayout(2)
		]
		
		new Label(habitacionTituloPanel).text = "Habitación seleccionada: "
		
		new Label(habitacionTituloPanel).text = "Nombre de Habitación"
		
		
		// Panel de CheckBox para una habitación seleccionada
		
		var habitacionCheckBoxPanel = new Panel(habitacionSeleccionadaPanel) => [
			
			layout = new ColumnLayout(2)
		]
		
		new CheckBox(habitacionCheckBoxPanel) => [
			
		]
		
		new Label(habitacionCheckBoxPanel).text = "¿Es inicial?"
		
		new CheckBox(habitacionCheckBoxPanel) => [
			
		]
		
		new Label(habitacionCheckBoxPanel).text = "¿Es final?"
		
		
		new Label(habitacionSeleccionadaPanel).text = "Acciones"
		
		// Lista de acciones
		new List(habitacionSeleccionadaPanel) => [
			
			height = 300
		]
		
		// Panel de botones para acciones
		var botoneraHabitacionSeleccionadaPanel = new Panel(habitacionSeleccionadaPanel) => [
			
			layout = new HorizontalLayout
			
		]

		new Button(botoneraHabitacionSeleccionadaPanel) => [
			caption = "Agregar Acción"
			onClick = [ | this.agregarAccion ]
		]

		new Button(botoneraHabitacionSeleccionadaPanel) => [
			caption = "Quitar Acción"
		]
		
	}
	
	def agregarAccion() {
		new AgregarAccionWindow(this, new Habitacion("MEXICANA")).open()
	}
	
	override protected addActions(Panel actionsPanel) {
		
	}


	
}