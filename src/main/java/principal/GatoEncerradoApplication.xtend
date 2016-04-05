package principal

import org.uqbar.arena.Application
import org.uqbar.appmodel.GatoEncerradoAppModel
import org.uqbar.dummyData.DummyData

class GatoEncerradoApplication extends Application {
	
	override protected createMainWindow() {
		
		val model = new GatoEncerradoAppModel => [
			usuario = new DummyData().crearUsuarioDummy("User001")
			laberintos = usuario.laberintos
		]
		return new AcaHayGatoEncerradoWindow(this, model)
	}
	
	static def void main(String[] args) {
		new GatoEncerradoApplication().start()
	}
	
	
}