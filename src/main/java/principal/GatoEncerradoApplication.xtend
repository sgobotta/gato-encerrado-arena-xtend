package principal

import org.uqbar.arena.Application
import org.uqbar.appmodel.GatoEncerradoAppModel
import org.uqbar.Usuario

class GatoEncerradoApplication extends Application {
	
	override protected createMainWindow() {
		
		val model = new GatoEncerradoAppModel => [
			// Saque el dummyData porque no me compilaba y no podía encontrar de donde bajar la dependencia...
			usuario = new Usuario("Pepe")
			laberintos = usuario.laberintos
		]
		return new AcaHayGatoEncerradoWindow(this, model)
	}
	
	static def void main(String[] args) {
		new GatoEncerradoApplication().start()
	}
	
	
}