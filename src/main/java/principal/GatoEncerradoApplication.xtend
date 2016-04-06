package principal

import org.uqbar.arena.Application
import org.uqbar.appmodel.GatoEncerradoAppModel
import org.uqbar.dummyData.GatoEncerradoDummyData

class GatoEncerradoApplication extends Application {
	
	override protected createMainWindow() {
		
		val model = new GatoEncerradoAppModel => [
			usuario = new GatoEncerradoDummyData().crearUsuarioDummy("Pepe")
		]
		return new AcaHayGatoEncerradoWindow(this, model)
	}
	
	static def void main(String[] args) {
		new GatoEncerradoApplication().start()
	}
	
	
}