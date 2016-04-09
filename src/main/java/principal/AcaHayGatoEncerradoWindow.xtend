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
import laberinto.AgregarLaberintoWindow
import org.uqbar.appmodel.AgregarLaberintoAppModel
import org.uqbar.appmodel.AgregarHabitacionAppModel
import habitacion.AgregarHabitacionWindow

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

	override protected addActions(Panel actionsPanel) {
		// El panel de acciones esta vacio, todo entra en el formPanel	
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


	// *************************************************
	// ** Métodos asociados al Layout
	// *************************************************
	
	/**
	 * Panel contenedor principal de tres paneles
	 */	 
	def armarColumnas(Panel mainPanel) {

		var contenedorPanel = new Panel(mainPanel) => [
			layout = new ColumnLayout(3)
		]

		armarPrimeraColumna(contenedorPanel)
		armarSegundaColumna(contenedorPanel)
		armarTerceraColumna(contenedorPanel)
	}


	/**
	 * Primera columna: Laberintos
	 */
	def armarPrimeraColumna(Panel contenedorPanel) {

		var primeraColumna = new Panel(contenedorPanel)
		armarTituloPrimeraColumna(primeraColumna)
		armarListaPrimeraColumna(primeraColumna)
		armarBotonesPrimeraColumna(primeraColumna)

	}
	
	/**
	 * Titulo primera columna: laberintos
	 */
	def armarTituloPrimeraColumna(Panel primeraColumna) {
		new Label(primeraColumna).text = "Laberintos"
	}

	/**
	 * Lista de laberintos
	 */
	def armarListaPrimeraColumna(Panel primeraColumna) {

		new List(primeraColumna) => [
			(items <=> "usuario.laberintos").adapter = new PropertyAdapter(Laberinto, "nombreLaberinto")
			height = 300
			width = 130
			value <=> "laberintoSeleccionado"
		]

	}

	/**
	 * Botonera para laberintos
	 */
	def armarBotonesPrimeraColumna(Panel primeraColumna) {

		var botoneraLaberintoPanel = new Panel(primeraColumna) => [
			layout = new HorizontalLayout
		]

		new Button(botoneraLaberintoPanel) => [
			caption = "Agregar Laberinto"
			onClick = [|agregarLaberinto()]
		]

		new Button(botoneraLaberintoPanel) => [
			caption = "Quitar Laberinto"
		]
	}

	/**
	 * Segunda columna: Habitaciones
	 */
	def armarSegundaColumna(Panel contenedorPanel) {

		var segundaColumna = new Panel(contenedorPanel)
		armarTituloSegundaColumna(segundaColumna)
		armarListaSegundaColumna(segundaColumna)
		armarBotonesSegundaColumna(segundaColumna)
	}

	/**
	 * Titulo segunda columna: habitaciones
	 */
	def armarTituloSegundaColumna(Panel segundaColumna) {

		var habitacionesTituloPanel = new Panel(segundaColumna) => [
			layout = new ColumnLayout(2)
		]

		new Label(habitacionesTituloPanel).text = "Habitaciones de: " 	
				
		new Label(habitacionesTituloPanel) => [
		value <=> "laberintoSeleccionado.nombreLaberinto"
		]
	}

	/**
	 * Lista para habitaciones
	 */
	def armarListaSegundaColumna(Panel segundaColumna) {
		//Si yo elijo un laberinto y despues una habitacion, y luego cambio el laberinto, el error panel va a decir
		// Cannot convert from null to primitive
		// Creo que es porque al volver a seleccionarse un nuevo laberinto, la habitacion que antes estaba seleccionada
		// no forma mas parte de las habitaciones de ese laberinto, pero no estoy seguro.
		
		// Entiendo, pero no logro encontrarle la vuelta, estoy seguro que se puede. Tiene que ser parecido
		// a ese binding que nos mostraron con la conversion al instante de millas a kilómetros, modificando
		// los convertir en el dominio, o algo parecido... habría que probar si una label se actualiza sola
		// haciendo algo por el estilo, luego verlo en una list.
		// Santi B. 
		new List(segundaColumna) => [
			(items <=> "laberintoSeleccionado.habitaciones").adapter = new PropertyAdapter(Habitacion,
				"nombreHabitacion")
			height = 300
			width = 130
			value <=> "habitacionSeleccionada"
		]
	}

	/**
	 * Botonera segunda columna
	 */
	def armarBotonesSegundaColumna(Panel segundaColumna) {

		var botoneraHabitacionesPanel = new Panel(segundaColumna) => [
			layout = new HorizontalLayout
		]

		new Button(botoneraHabitacionesPanel) => [
			caption = "Agregar Habitación"
			onClick = [|agregarHabitacion]
		]

		new Button(botoneraHabitacionesPanel) => [
			caption = "Quitar Habitación"
		]
	}

	/**
	 * Segunda columna: habitación seleccionada y acciones
	 */
	def armarTerceraColumna(Panel contenedorPanel) {

		var terceraColumna = new Panel(contenedorPanel)
		armarPrimerTituloTerceraColumna(terceraColumna)
		armarCheckBoxesTerceraColumna(terceraColumna)
		armarSegundoTituloTerceraColumna(terceraColumna)
		armarListaTerceraColumna(terceraColumna)
		armarBotonesTerceraColumna(terceraColumna)
	}
	
	/**
	 * Primer título tercer columna: habitación seleccionada 
	 */
	def armarPrimerTituloTerceraColumna(Panel terceraColumna) {

		var habitacionTituloPanel = new Panel(terceraColumna) => [
			layout = new ColumnLayout(2)
		]

		new Label(habitacionTituloPanel).text = "Habitación seleccionada: "

		new Label(habitacionTituloPanel) => [
		value <=> "habitacionSeleccionada.nombreHabitacion"
		]
	}

	/**
	 * Checkboxes para una habitación
	 */
	def armarCheckBoxesTerceraColumna(Panel terceraColumna) {

		var habitacionCheckBoxPanel = new Panel(terceraColumna) => [
			layout = new ColumnLayout(2)
		]

		new CheckBox(habitacionCheckBoxPanel) => [
			value <=> "habitacionSeleccionada.first"
		]

		new Label(habitacionCheckBoxPanel).text = "¿Es inicial?"

		new CheckBox(habitacionCheckBoxPanel) => [
			
			value <=> "habitacionSeleccionada.last"
		]

		new Label(habitacionCheckBoxPanel).text = "¿Es final?"

	}

	/**
	 * Segundo título tercer columna: acciones
	 */
	def armarSegundoTituloTerceraColumna(Panel terceraColumna) {
		new Label(terceraColumna).text = "Acciones"
	}
	
	/**
	 * Lista de acciones
	 */
	def armarListaTerceraColumna(Panel terceraColumna) {

		new List(terceraColumna) => [
			(items <=> "habitacionSeleccionada.acciones").adapter = new PropertyAdapter(Accion, "nombre")
			height = 300
			value <=> "accionSeleccionada"
		]

	}

	/**
	 * Botonera para una habitación
	 */
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
	
	// *************************************************
	// ** Métodos asociados al Binding
	// *************************************************
	
	def agregarLaberinto() {
		var agregarLaberintoModel = new AgregarLaberintoAppModel
		agregarLaberintoModel.laberintos = modelObject.usuario.laberintos
		new AgregarLaberintoWindow(this, agregarLaberintoModel).open()
	}
	
	def agregarHabitacion() {
		var agregarHabitacionModel = new AgregarHabitacionAppModel
		agregarHabitacionModel.laberintoSeleccionado = modelObject.laberintoSeleccionado
		new AgregarHabitacionWindow(this, agregarHabitacionModel).open()
	}
	
	def agregarAccion() {
		var agregarAccionModel = new AgregarAccionAppModel => [
			laberintoSeleccionado = modelObject.laberintoSeleccionado
			habitacionSeleccionada = modelObject.habitacionSeleccionada
		]
		new AgregarAccionWindow(this, agregarAccionModel).open()
	}
	
}
