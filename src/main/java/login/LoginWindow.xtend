package login

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.MainWindow
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Label
import java.awt.Color
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.windows.Dialog
import org.uqbar.exceptions.MyLoginException
import org.uqbar.arena.widgets.PasswordField
import org.uqbar.arena.windows.ErrorsPanel
import org.uqbar.appmodel.LoginAplicationModel

class LoginWindow extends MainWindow<LoginAplicationModel>{
	
	new(LoginAplicationModel model) {
		super(model)
	}
	
	new() {
		super(new LoginAplicationModel)
	}
	
	override createContents(Panel mainPanel) {
		
		this.title = "Log in"
		
		var panelDeLogeo = new Panel(mainPanel) => [
			width = 200
		]
		
		new ErrorsPanel(panelDeLogeo, "Log In") => [
			
		]
				
		this.crearPanelDelFormulario(panelDeLogeo, Color.BLACK, Color.CYAN)
		this.crearPanelDeAcciones(panelDeLogeo, Color.BLACK, Color.CYAN)
		
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
		catch(MyLoginException expected){
		//avisar que no se pudo logear el wachin
		}
	}
	
	def void crearUsuario() {
		this.openDialog(new CrearUsuarioWindow(this))
	}
	
	def openDialog(Dialog<?> dialog) {
		//dialog.onAccept[|modelObject.]
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
	def static main(String[] args) {
		new LoginWindow().startApplication
	}
}