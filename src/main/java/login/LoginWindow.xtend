package login

import org.uqbar.arena.widgets.Panel
import java.awt.Color
import org.uqbar.arena.windows.Dialog
import org.uqbar.appmodel.LoginAppModel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.appmodel.CrearCuentaAppModel
import principal.AcaHayGatoEncerradoWindow
import org.uqbar.appmodel.GatoEncerradoAppModel
import utils.CreadorDeWidgets

class LoginWindow extends SimpleWindow<LoginAppModel>{
	
	private CreadorDeWidgets creador = new CreadorDeWidgets()
	
	new(WindowOwner parent, LoginAppModel model) {
		super(parent, model)
	}
	
	new(WindowOwner parent) {
		super(parent, new LoginAppModel)
	}
	
	def defaultTitle() {
		this.title = "Log In"
	}
	
	override protected addActions(Panel actionsPanel) {
	}
	
	override protected createFormPanel(Panel mainPanel) {
		this.defaultTitle()
		
		
		var panelDeLogeo = new Panel(mainPanel) => [
			width = 200
		]
		this.crearPanelDelFormulario(panelDeLogeo, Color.BLACK, Color.CYAN)
		this.crearPanelDeAcciones(panelDeLogeo, Color.BLACK, Color.CYAN)
		creador.crearLabelConTextoYColor(panelDeLogeo,"New here? Create an account", Color.GRAY)
	}


	
	def crearPanelDelFormulario(Panel panel, Color letra, Color fondo) {
		var formPanel = new Panel(panel)
		
		creador.crearLabelConTextoYColor(formPanel, "username", letra)
		creador.crearTextBoxConValueYWidth(formPanel, "nombreDeCuentaALogear", 200)

		creador.crearLabelConTextoYColor(formPanel, "password", letra)
		creador.crearPasswordFieldConValueYAncho(formPanel, "contraseñaDeCuentaALogear", 200)
		
	}
	def crearPanelDeAcciones(Panel panel, Color letra, Color fondo) {
		var actionPanel = creador.crearPanelHorizontal(panel)

		creador.crearBotonConCaptionOnClickYColorLetraYFondo(actionPanel, "Log In", [| this.logearUsuario], letra, fondo) => [
			width = 100
			height = 30
		]
		creador.crearBotonConCaptionOnClickYColorLetraYFondo(actionPanel, "Sign Up", [| this.crearUsuario], letra, fondo) => [
			width = 100
			height = 30
		]
	}
	

	// ventanas
	
	def logearUsuario() {
		modelObject.logearUsuario()
		this.abrirGatoEncerradoWindow()
	}
	
	def abrirGatoEncerradoWindow() {
		new AcaHayGatoEncerradoWindow(this, new GatoEncerradoAppModel(this.modelObject.getUsuario())).open
	}

	def void crearUsuario() {
		this.openDialog(new CrearCuentaWindow(this, new CrearCuentaAppModel(modelObject.servicioDeLogeo)))
	}
	
	def openDialog(Dialog<?> dialog) {
		dialog.open
	}
}