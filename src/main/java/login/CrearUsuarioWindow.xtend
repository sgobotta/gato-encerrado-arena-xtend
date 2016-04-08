package login

import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.Usuario
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button

class CrearUsuarioWindow extends TransactionalDialog<Usuario>{
	new(WindowOwner owner) {
		super(owner, new Usuario)
		title = defaultTitle
	}
	
	def defaultTitle() {
		"Registro de nuevo usuario"
	}
	
	override protected createFormPanel(Panel mainPanel) {

		this.crearPanelDeRegistroDeUsuario(mainPanel)
		this.crearPanelDeAcciones(mainPanel)
	}
	
	def crearPanelDeAcciones(Panel panel) {
		var panelDeAcciones = new Panel(panel)
		new Button(panelDeAcciones) => [
			caption = "Registrar"
			onClick = [| this.accept]
		]
		new Button(panelDeAcciones) => [
			caption = "cancelar"
			onClick = [| this.cancel]
		]
	}
	
	def crearPanelDeRegistroDeUsuario(Panel panel) {
		var panelDeRegistracion = new Panel(panel).layout = new ColumnLayout(2)
		new Label(panelDeRegistracion).text = "username"
		new TextBox(panelDeRegistracion) => [
			value <=> "nombre"
		]
		new Label(panelDeRegistracion).text = "password"
		new TextBox(panelDeRegistracion) => [
			value <=> "password"
		]
		
	}

}
