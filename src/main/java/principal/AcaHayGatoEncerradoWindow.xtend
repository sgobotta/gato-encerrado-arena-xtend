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
import acciones.AgregarAccionWindow
import org.uqbar.Habitacion
import org.uqbar.appmodel.GatoEncerradoAppModel
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.Laberinto

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.appmodel.AgregarAccionAppModel
import org.uqbar.Accion

class AcaHayGatoEncerradoWindow extends SimpleWindow<GatoEncerradoAppModel> {

	new(WindowOwner parent, GatoEncerradoAppModel model) {
		super(parent, model)
	}

	override createFormPanel(Panel mainPanel) {
		this.title = "Aca hay gato encerrado"
		this.taskDescription = ""
		this.armarCabecera(mainPanel)
		this.armarColumnas(mainPanel)
	}

	def agregarAccion() {
		var agregarAccionmodel = new AgregarAccionAppModel => [
			laberintoSeleccionado = modelObject.laberintoSeleccionado
			habitacionSeleccionada = modelObject.habitacionSeleccionada
		]
		new AgregarAccionWindow(this, agregarAccionmodel).open()
	}

	override protected addActions(Panel actionsPanel) {
		// Panel de acciones esta vacio, todo entra en el formPanel	
	}

	def armarCabecera(Panel mainPanel) {

		new Label(mainPanel) => [
			text = "Hola " + modelObject.usuario.nombre + "! Administrá todos tus laberintos"
		]

		new Label(mainPanel) => [
			text = "Acá hay gato encerrado..."
			fontSize = 20
			background = Color.RED
		]
	}

	def armarColumnas(Panel mainPanel) {

		// *************************************************
		// ** Panel contenedor principal de tres paneles
		// *************************************************
		var contenedorPanel = new Panel(mainPanel) => [
			layout = new ColumnLayout(3)
		]

		armarPrimeraColumna(contenedorPanel)
		armarSegundaColumna(contenedorPanel)
		armarTerceraColumna(contenedorPanel)
	}

	def armarPrimeraColumna(Panel contenedorPanel) {

		// *************************************************
		// ** Primera columna: Laberintos
		// *************************************************
		var primeraColumna = new Panel(contenedorPanel)
		armarTituloPrimeraColumna(primeraColumna)
		armarListaPrimeraColumna(primeraColumna)
		armarBotonesPrimeraColumna(primeraColumna)

	}

	def armarTituloPrimeraColumna(Panel primeraColumna) {
		new Label(primeraColumna).text = "Laberintos"
	}

	def armarListaPrimeraColumna(Panel primeraColumna) {

		new List(primeraColumna) => [
			(items <=> "usuario.laberintos").adapter = new PropertyAdapter(Laberinto, "nombreLaberinto")
			height = 300
			width = 130
			value <=> "laberintoSeleccionado"
		]

	}

	def armarBotonesPrimeraColumna(Panel primeraColumna) {

		var botoneraLaberintoPanel = new Panel(primeraColumna) => [
			layout = new HorizontalLayout
		]

		new Button(botoneraLaberintoPanel) => [
			caption = "Agregar Laberinto"
		]

		new Button(botoneraLaberintoPanel) => [
			caption = "Quitar Laberinto"
		]
	}

	def armarSegundaColumna(Panel contenedorPanel) {

		// *************************************************
		// ** Segunda columna: Habitaciones
		// *************************************************
		var segundaColumna = new Panel(contenedorPanel)
		armarTituloSegundaColumna(segundaColumna)
		armarListaSegundaColumna(segundaColumna)
		armarBotonesSegundaColumna(segundaColumna)
	}

	def armarTituloSegundaColumna(Panel segundaColumna) {

		var habitacionesTituloPanel = new Panel(segundaColumna) => [
			layout = new ColumnLayout(2)
		]

		new Label(habitacionesTituloPanel).text = "Habitaciones de: "

		// En donde dice "Nombre del Laberinto" tiene que ir un binding con el laberinto seleccionado.		
		new Label(habitacionesTituloPanel).text = "Nombre del Laberinto"
	}

	def armarListaSegundaColumna(Panel segundaColumna) {

		new List(segundaColumna) => [
			(items <=> "laberintoSeleccionado.habitaciones").adapter = new PropertyAdapter(Habitacion,
				"nombreHabitacion")
			height = 300
			width = 130
			value <=> "habitacionSeleccionada"
		]
	}

	def armarBotonesSegundaColumna(Panel segundaColumna) {

		var botoneraHabitacionesPanel = new Panel(segundaColumna) => [
			layout = new HorizontalLayout
		]

		new Button(botoneraHabitacionesPanel) => [
			caption = "Agregar Habitación"
		]

		new Button(botoneraHabitacionesPanel) => [
			caption = "Quitar Habitación"
		]
	}

	def armarTerceraColumna(Panel contenedorPanel) {

		// *************************************************
		// ** Tercera columna: Hab. seleccionada y acciones
		// *************************************************
		var terceraColumna = new Panel(contenedorPanel)
		armarPrimerTituloTerceraColumna(terceraColumna)
		armarCheckBoxesTerceraColumna(terceraColumna)
		armarSegundoTituloTerceraColumna(terceraColumna)
		armarListaTerceraColumna(terceraColumna)
		armarBotonesTerceraColumna(terceraColumna)
	}

	def armarPrimerTituloTerceraColumna(Panel terceraColumna) {

		var habitacionTituloPanel = new Panel(terceraColumna) => [
			layout = new ColumnLayout(2)
		]

		new Label(habitacionTituloPanel).text = "Habitación seleccionada: "

		// En donde dice "Nombre de Habitacion" tiene que ir un binding con la habitacion seleccionada.
		new Label(habitacionTituloPanel).text = "Nombre de Habitación"
	}

	def armarCheckBoxesTerceraColumna(Panel terceraColumna) {

		var habitacionCheckBoxPanel = new Panel(terceraColumna) => [
			layout = new ColumnLayout(2)
		]

		new CheckBox(habitacionCheckBoxPanel) => [
			bindValueToProperty("habitacionSeleccionada.esInicial")
		]

		new Label(habitacionCheckBoxPanel).text = "¿Es inicial?"

		new CheckBox(habitacionCheckBoxPanel) => [
			bindValueToProperty("habitacionSeleccionada.esFinal")
		]

		new Label(habitacionCheckBoxPanel).text = "¿Es final?"

	}

	def armarSegundoTituloTerceraColumna(Panel terceraColumna) {
		new Label(terceraColumna).text = "Acciones"
	}

	def armarListaTerceraColumna(Panel terceraColumna) {

		new List(terceraColumna) => [
			(items <=> "habitacionSeleccionada.acciones").adapter = new PropertyAdapter(Accion, "nombre")
			height = 300
			value <=> "accionSeleccionada"
		]

	}

	def armarBotonesTerceraColumna(Panel terceraColumna) {

		var botoneraHabitacionSeleccionadaPanel = new Panel(terceraColumna) => [
			layout = new HorizontalLayout
		]

		new Button(botoneraHabitacionSeleccionadaPanel) => [
			caption = "Agregar Acción"
			onClick = [|this.agregarAccion]
		]

		new Button(botoneraHabitacionSeleccionadaPanel) => [
			caption = "Quitar Acción"
		]
	}

}
