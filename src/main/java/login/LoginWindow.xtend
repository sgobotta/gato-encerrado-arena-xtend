package login

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Label
import java.awt.Color
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.PasswordField
import org.uqbar.appmodel.LoginAppModel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.appmodel.CrearCuentaAppModel
import principal.AcaHayGatoEncerradoWindow
import org.uqbar.appmodel.GatoEncerradoAppModel

class LoginWindow extends SimpleWindow<LoginAppModel>{
	
	new(WindowOwner parent, LoginAppModel model) {
		super(parent, model)
	}
	
	new(WindowOwner parent) {
		super(parent, new LoginAppModel)
	}
	
	def defaultTitle() {
		this.title = "Log In"
	}
	
	def crearPanelDeAcciones(Panel panel, Color letra, Color fondo) {
		var actionPanel = new Panel(panel) => [
			layout = new ColumnLayout(2)
		]
		this.crearBotonConCaptionYColor(actionPanel, "log In", letra,fondo) => [
			onClick = [| this.logearUsuario]
		]
		this.crearBotonConCaptionYColor(actionPanel, "Sign Up", letra, fondo) => [
			onClick = [|this.crearUsuario]
		]
	return actionPanel
		
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
		this.crearLabelConTexto(panelDeLogeo,"New here? Create an account", Color.GRAY)
	}


	
	def crearPanelDelFormulario(Panel parent, Color letra, Color fondo) {
		var formPanel = new Panel(parent)
		
		this.crearLabelConTexto(formPanel, "username", letra)
		this.crearTextBoxConValue(formPanel, "nombreDeCuentaALogear")

		this.crearLabelConTexto(formPanel, "password", letra)
		new PasswordField(formPanel) => [
			value <=> "contraseñaDeCuentaALogear"
		]
		
		return formPanel
	}
	
	// widgets
	
	def crearBotonConCaptionYColor(Panel panel, String text, Color letra, Color fondo) {
		new Button(panel) => [
			caption = text
			width = 100
			foreground = letra
			background = fondo
		]
	}	
	def crearTextBoxConValue(Panel panel, String valueText) {
		new TextBox(panel) => [
			value <=> valueText
			width = 200
		]
	}
	
	def crearLabelConTexto(Panel panel, String texto, Color letra) {
		new Label(panel) =>[
			text = texto
			foreground = letra
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