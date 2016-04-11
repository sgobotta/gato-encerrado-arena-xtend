package login

import org.uqbar.arena.Application

class LoginApplication extends Application{
	
	override protected createMainWindow() {
		return new LoginWindow(this)
	}
	static def void main(String[] args) {
		new LoginApplication().start()
	}
}