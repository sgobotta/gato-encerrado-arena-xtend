package login

import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.appmodel.CrearCuentaAppModel
import utils.CreadorDeWidgets

class CrearCuentaWindow extends TransactionalDialog<CrearCuentaAppModel>{
	
	private CreadorDeWidgets creador = new CreadorDeWidgets()
	
	new(WindowOwner owner, CrearCuentaAppModel model) {
		super(owner, model)
		title = defaultTitle
	}
	
	def defaultTitle() {
		"Registro de nueva cuenta"
	}
	
	override protected createFormPanel(Panel mainPanel) {

		var panelDeRegistro = new Panel(mainPanel)
		this.crearPanelDeRegistroDeCuenta(panelDeRegistro)
		var panelDeBotones = new Panel(mainPanel)
		this.crearPanelDeAcciones(panelDeBotones)
	}
	
	def crearPanelDeAcciones(Panel panel) {
		var panelDeAcciones = new Panel(panel)
		
		creador.crearBotonConCaptionYonClick(panelDeAcciones,"Registrar", [| this.crearCuenta])
		creador.crearBotonConCaptionYonClick(panelDeAcciones,"Cancelar", [| this.cancel])
	}
	
	def crearCuenta() {
		modelObject.registrarCuenta()
		this.close()
	}
	
	
	def crearPanelDeRegistroDeCuenta(Panel panel) {
		var panelDeRegistracion = creador.crearPanelConColumnas(panel, 2)

		creador.crearLabelConTexto(panelDeRegistracion,"Username")
		creador.crearTextBoxConValueYWidth(panelDeRegistracion,"nombreCuentaACrear", 100)
		creador.crearLabelConTexto(panelDeRegistracion,"Password")
		creador.crearTextBoxConValueYWidth(panelDeRegistracion, "passwordCuentaACrear", 100)		
	}

}
