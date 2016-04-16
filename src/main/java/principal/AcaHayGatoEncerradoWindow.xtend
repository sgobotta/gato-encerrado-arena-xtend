package principal

import org.uqbar.arena.widgets.Panel
import java.awt.Color
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import acciones.AgregarAccionWindow
import org.uqbar.Habitacion
import org.uqbar.appmodel.GatoEncerradoAppModel
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.Laberinto

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.appmodel.AgregarAccionAppModel
import org.uqbar.acciones.Accion
import laberinto.AgregarLaberintoWindow
import org.uqbar.appmodel.AgregarLaberintoAppModel
import org.uqbar.appmodel.AgregarHabitacionAppModel
import habitacion.AgregarHabitacionWindow
import utils.CreadorDeWidgets

class AcaHayGatoEncerradoWindow extends SimpleWindow<GatoEncerradoAppModel> {

	private CreadorDeWidgets creador = new CreadorDeWidgets()

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

		creador.crearLabelConTexto(mainPanel, "Hola " + modelObject.usuario.nombre + "! Administrá todos tus laberintos")
		creador.crearLabelConTexto(mainPanel, "Acá hay gato encerrado...") => [
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
		var contenedorPanel = creador.crearPanelConColumnas(mainPanel, 3)
		
        armarPanelDeLaberintos(contenedorPanel)
        armarPanelDeHabitaciones(contenedorPanel)
        armarPanelDeSeleccionarHabComoInicialFinalYPanelAcciones(contenedorPanel)
    }

    /**
	 * Primera columna: Laberintos
	 */
    def armarPanelDeLaberintos(Panel panel) {

        var panelDeLaberintos = new Panel(panel)
        creador.crearLabelConTexto(panelDeLaberintos, "Laberintos")
        creador.crearListaConValue(panelDeLaberintos, "laberintoSeleccionado") => [
            (items <=> "usuario.laberintos").adapter = new PropertyAdapter(Laberinto, "nombreLaberinto")
            height = 300
            width = 130       	
        ]
        armarBotonesPanelDeLaberintos(panelDeLaberintos)

    }

    /**
	 * Botonera para laberintos
	 */
    def armarBotonesPanelDeLaberintos(Panel panel) {

        var botoneraLaberintoPanel = creador.crearPanelHorizontal(panel)
		creador.crearBotonConCaptionYonClick(botoneraLaberintoPanel, "Agregar Laberinto", [|this.agregarLaberinto])
		creador.crearBotonConCaptionYonClick(botoneraLaberintoPanel, "Quitar Laberinto", [|this.quitarLaberinto])
    }
	
    /**
	 * Segunda columna: Habitaciones
	 */
    def armarPanelDeHabitaciones(Panel panel) {

        var panelDeHabitaciones = new Panel(panel)
        armarTituloPanelDeHabitaciones(panelDeHabitaciones)
        creador.crearListaConValue(panelDeHabitaciones, "habitacionSeleccionada") => [
            (items <=> "laberintoSeleccionado.habitaciones").adapter = new PropertyAdapter(Habitacion,
                "nombreHabitacion")
            height = 300
            width = 130
        ]
        armarBotonesPanelDeHabitaciones(panelDeHabitaciones)
    }

    /**
	 * Titulo segunda columna: habitaciones
	 */
    def armarTituloPanelDeHabitaciones(Panel panel) {

        var habitacionesTituloPanel = creador.crearPanelConColumnas(panel, 2)

		creador.crearLabelConTextoYVisibilidad(habitacionesTituloPanel, "Habitaciones de: ", "labSelected")
        creador.crearLabelConValue(habitacionesTituloPanel, "laberintoSeleccionado.nombreLaberinto")

    }

    /**
	 * Botonera segunda columna
	 */
    def armarBotonesPanelDeHabitaciones(Panel panelDeHabitaciones) {

        var botoneraHabitacionesPanel = creador.crearPanelHorizontal(panelDeHabitaciones)
		creador.crearBotonConCaptionYonClickYEnabled(botoneraHabitacionesPanel, "Agregar Habitacion", [|this.agregarHabitacion], "labSelected" )
		creador.crearBotonConCaptionYonClickYEnabled(botoneraHabitacionesPanel, "Quitar Habitacion", [|this.quitarHabitacion], "labSelected" )
    }

    /**
	 * Segunda columna: habitación seleccionada y acciones
	 */
    def armarPanelDeSeleccionarHabComoInicialFinalYPanelAcciones(Panel panel) {

		var panelDeSeleccionarHabFinalInicialYPanelDeAcciones = new Panel(panel)
		//inicial - final
		armarPanelDeSeleccionarHabInicialFinal(panelDeSeleccionarHabFinalInicialYPanelDeAcciones)
        //acciones
        armarPanelDeAcciones(panelDeSeleccionarHabFinalInicialYPanelDeAcciones)
    }
	
	def armarPanelDeSeleccionarHabInicialFinal(Panel panel) {
        var panelDeSeleccionarHabInicialFinal = new Panel(panel)
        
        armarTituloDelPanelSeleccionarHabComoInicialFinal(panelDeSeleccionarHabInicialFinal)
        armarCheckBoxesDelPanelSeleccionarHabComoInicialFinal(panelDeSeleccionarHabInicialFinal)
	}
	
	def armarPanelDeAcciones(Panel panel) {
        var panelDeAcciones = new Panel(panel)
        creador.crearLabelConTexto(panelDeAcciones, "Acciones")
        creador.crearListaConValue(panelDeAcciones, "accionSeleccionada") => [
            (items <=> "habitacionSeleccionada.acciones").adapter = new PropertyAdapter(Accion, "nombre")
            height = 300
        ]
        armarBotonesDelPanelDeAcciones(panelDeAcciones)
	}
	
    /**
	 * Primer título tercer columna: habitación seleccionada 
	 */
    def armarTituloDelPanelSeleccionarHabComoInicialFinal(Panel panel) {

        var habitacionTituloPanel = creador.crearPanelConColumnas(panel, 2)
        
		creador.crearLabelConTextoYVisibilidad(habitacionTituloPanel, "Habitación seleccionada: ", "habSelected")
        creador.crearLabelConValue(habitacionTituloPanel, "habitacionSeleccionada.nombreHabitacion")
    }

    /**
	 * Checkboxes para una habitación
	 */
    def armarCheckBoxesDelPanelSeleccionarHabComoInicialFinal(Panel panel) {

        var habitacionCheckBoxPanel = creador.crearPanelConColumnas(panel, 2)
        
        creador.crearCheckBoxConValueYVisibildad(habitacionCheckBoxPanel, "first", "habSelected")
		creador.crearLabelConTextoYVisibilidad(habitacionCheckBoxPanel, "¿Es inicial?", "habSelected")

		creador.crearCheckBoxConValueYVisibildad(habitacionCheckBoxPanel, "last", "habSelected")
		creador.crearLabelConTextoYVisibilidad(habitacionCheckBoxPanel, "¿Es final?", "habSelected")
    }
	

    /**
	 * Botonera para una habitación
	 */
    def armarBotonesDelPanelDeAcciones(Panel panel) {

        var botoneraHabitacionSeleccionadaPanel = creador.crearPanelHorizontal(panel)

		creador.crearBotonConCaptionYonClickYEnabled(botoneraHabitacionSeleccionadaPanel, "Agregar Acción", [|this.agregarAccion], "habSelected")
		creador.crearBotonConCaptionYonClickYEnabled(botoneraHabitacionSeleccionadaPanel, "Quitar Acción", [|this.quitarAccion], "habSelected")
    }
	

    // *************************************************
    // ** Métodos asociados al Binding
    // *************************************************
    def agregarLaberinto() {
        var agregarLaberintoModel = new AgregarLaberintoAppModel
        agregarLaberintoModel.laberintos = modelObject.usuario.laberintos
        new AgregarLaberintoWindow(this, agregarLaberintoModel).open()
    }

    def quitarLaberinto() {
        modelObject.usuario.eliminarLaberinto(modelObject.laberintoSeleccionado)
    }

    def agregarHabitacion() {
        var agregarHabitacionModel = new AgregarHabitacionAppModel
        agregarHabitacionModel.laberintoSeleccionado = modelObject.laberintoSeleccionado
        new AgregarHabitacionWindow(this, agregarHabitacionModel).open()
    }

    def quitarHabitacion() {
        modelObject.usuario.eliminarHabitacion(modelObject.habitacionSeleccionada, modelObject.laberintoSeleccionado)
    }

    def agregarAccion() {
        var agregarAccionModel = new AgregarAccionAppModel => [
            laberintoSeleccionado = modelObject.laberintoSeleccionado
            habitacionSeleccionada = modelObject.habitacionSeleccionada
            objetoParaAgregarleAccion = modelObject.habitacionSeleccionada
        ]
        new AgregarAccionWindow(this, agregarAccionModel).open()
    }

    def quitarAccion() {
        modelObject.habitacionSeleccionada.eliminarAccion(modelObject.accionSeleccionada)
    }

}
