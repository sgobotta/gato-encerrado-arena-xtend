package principal


import org.uqbar.Usuario
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.windows.ErrorsPanel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.layout.ColumnLayout
import java.awt.Checkbox
import java.awt.CheckboxGroup
import java.awt.Color

class AcaHayGatoEncerradoWindow extends MainWindow<Usuario> {
	new() {
		super(new Usuario("Nuevo Usuario"))
	}

	override createContents(Panel mainPanel) {
		this.title = ""

		// Panel cabecera con el panel de error
		var cabeceraPanel = new Panel(mainPanel)		
		
		new ErrorsPanel(cabeceraPanel, "")
		
		new Label(mainPanel) => [
			
			text = "Hola " + modelObject.nombre + "! Administrá todos tus laberintos"
		]
		
		new Label(mainPanel) => [
			
			text = "Acá hay gato encerrado..."
			fontSize = 18
			background = Color.RED
		]
		
		// Panel contenedor principal de tres paneles
		var contenedorPanel = new Panel(mainPanel) => [
			
			layout = new ColumnLayout(3)
		]
		
		// Panel de laberintos
		var laberintosPanel = new Panel(contenedorPanel)
		
		new Label(laberintosPanel).text = "Laberintos"

		// Panel de botones
		var botoneraLaberintoPanel = new Panel(laberintosPanel)

		// ScrollView de Laberintos

		new Button(botoneraLaberintoPanel) => [
			caption = "Agregar Laberinto"
		]

		new Button(botoneraLaberintoPanel) => [
			caption = "Quitar Laberinto"
		]
		
		// Panel de Habitaciones
		var habitacionesPanel = new Panel(contenedorPanel)
		
		new Label(habitacionesPanel).text = "Habitaciones"
		
		new Label(habitacionesPanel).text = "Nombre del Laberinto"
		
		// ScrollView de Habitaciones
		
		// Panel de botones
		var botoneraHabitacionesPanel = new Panel(habitacionesPanel)

		new Button(botoneraHabitacionesPanel) => [
			caption = "Agregar Habitación"
		]

		new Button(botoneraHabitacionesPanel) => [
			caption = "Quitar Habitación"
		]
		
		// Panel de Habitacion Seleccionada
		var habitacionSeleccionadaPanel = new Panel(contenedorPanel)
		
		new Label(habitacionSeleccionadaPanel).text = "Habitación"
		
		new Label(habitacionSeleccionadaPanel).text = "Nombre de Habitación"
		
		new Label(habitacionSeleccionadaPanel).text = "Acciones"
		
		
		// ScrollView de Acciones
		
		// Panel de botones
		var botoneraHabitacionSeleccionadaPanel = new Panel(habitacionSeleccionadaPanel)

		new Button(botoneraHabitacionSeleccionadaPanel) => [
			caption = "Agregar Acción"
		]

		new Button(botoneraHabitacionSeleccionadaPanel) => [
			caption = "Quitar Acción"
		]
	}

	def static main(String[] args) {
		new AcaHayGatoEncerradoWindow().startApplication
	}
}