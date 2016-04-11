package login

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.MainWindow
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Label
import java.awt.Color
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.PasswordField
import org.uqbar.arena.windows.ErrorsPanel
import org.uqbar.appmodel.CrearUsuarioAppModel
import org.uqbar.appmodel.LoginAppModel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class LoginWindow extends SimpleWindow<LoginAppModel>{
	
	new(WindowOwner parent, LoginAppModel model) {
		super(parent, model)
	}
	
	new(WindowOwner parent) {
		super(parent, new LoginAppModel)
	}
	
//	override createContents(Panel mainPanel) {
//	}
	
	def defaultTitle() {
		this.title = "Log In"
	}
	
	def crearPanelDeAcciones(Panel panel, Color letra, Color fondo) {
		var actionPanel = new Panel(panel)
		
		new Button(actionPanel) => [
			caption = "Log In"
			onClick = [|this.logearUsuario]
			width = 100
			foreground = letra
			background = fondo
		]
		new Label(actionPanel).text = "New here? Create an account"
		new Button(actionPanel) => [
			caption = "Sign Up"
			width = 100
			foreground = letra
			background = fondo
			onClick = [|this.crearUsuario]
		]
	return actionPanel
		
	}
	
	def logearUsuario() {
		try{
			modelObject.logearUsuario()
		//pasar a otra ventana con usuarioSeleccionado
			this.close
		}
		catch(Exception expected){
		//avisar que no se pudo logear el wachin
			showError(expected.message)
		}
	}
	
	def void crearUsuario() {
		this.openDialog(new CrearUsuarioWindow(this, new CrearUsuarioAppModel(modelObject.servicioDeLogeo)))
	}
	
	def openDialog(Dialog<?> dialog) {
		dialog.open
	}
	
	def crearPanelDelFormulario(Panel parent, Color letra, Color fondo) {
		var formPanel = new Panel(parent)
		
		new Label(formPanel) => [
			text = "username"
			foreground = letra
		]
		new TextBox(formPanel) => [
			value <=> "nombreDeUsuarioALogear"
			width = 200
		]
		new Label(formPanel) => [
			text = "password"
			foreground = letra
		]
		new PasswordField(formPanel) => [
			value <=> "contraseñaDeUsuarioALogeaer"
			width = 200
		]
		
		return formPanel
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
		
	}
	
}