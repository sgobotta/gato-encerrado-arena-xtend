package login

import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.appmodel.CrearCuentaAppModel

class CrearCuentaWindow extends TransactionalDialog<CrearCuentaAppModel>{
	new(WindowOwner owner, CrearCuentaAppModel model) {
		super(owner, model)
		title = defaultTitle
	}
	
	def defaultTitle() {
		"Registro de nueva cuenta"
	}
	
	override protected createFormPanel(Panel mainPanel) {

		this.crearPanelDeRegistroDeCuenta(mainPanel)
		this.crearPanelDeAcciones(mainPanel)
	}
	
	def crearPanelDeAcciones(Panel panel) {
		var panelDeAcciones = new Panel(panel)
		new Button(panelDeAcciones) => [
			caption = "Registrar"
			onClick = [| this.crearCuenta]
		]
		new Button(panelDeAcciones) => [
			caption = "cancelar"
			onClick = [| this.cancel]
		]
	}
	
	def crearCuenta() {
		modelObject.registrarCuenta()
		this.close()
	}
	
	
	def crearPanelDeRegistroDeCuenta(Panel panel) {
		var panelDeRegistracion = new Panel(panel).layout = new ColumnLayout(2)
		new Label(panelDeRegistracion).text = "username"
		new TextBox(panelDeRegistracion) => [
			value <=> "nombreCuentaACrear"
		]
		new Label(panelDeRegistracion).text = "password"
		new TextBox(panelDeRegistracion) => [
			value <=> "passwordCuentaACrear"
		]
		
	}

}
