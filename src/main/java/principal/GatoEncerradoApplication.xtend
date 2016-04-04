package principal

import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window
import org.uqbar.Usuario

class GatoEncerradoApplication extends Application {
	
	static def void main(String[] args) {
		new GatoEncerradoApplication().start()
	}
	
	override protected Window<?> createMainWindow() {
		return new AcaHayGatoEncerradoWindow(this, new Usuario("Nuevo Usuario"))
	}
	
}