package principal


import org.uqbar.Usuario
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.windows.ErrorsPanel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.MainWindow


class AcaHayGatoEncerradoWindow extends MainWindow<Usuario> {
	new() {
		super(new Usuario("Nuevo Usuario"))
	}

	override createContents(Panel mainPanel) {
		this.title = "Hola " + modelObject.nombre + "! Administrá todos tus laberintos"
		
		// no es necesario, el layout default es el vertical
		mainPanel.layout = new VerticalLayout
		
		new ErrorsPanel(mainPanel, "Acá hay gato encerrado...")	

		new Label(mainPanel).text = "Laberintos"

		new Button(mainPanel) => [
			caption = "Agregar Laberinto"
		]

		new Button(mainPanel) => [
			caption = "Quitar Laberinto"
		]
	}

	def static main(String[] args) {
		new AcaHayGatoEncerradoWindow().startApplication
	}
}