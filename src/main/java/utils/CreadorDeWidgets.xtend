package utils

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.List
import java.awt.Color
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.PasswordField

class CreadorDeWidgets {

	// Label

	def crearLabelConTexto(Panel panel, String texto) {
        new Label(panel) => [
            text = texto
        ]
	}


	def crearLabelConValue(Panel panel, String valueText) {
        new Label(panel) => [
            value <=> valueText
        ]
	}
	def crearLabelConTextoYVisibilidad(Panel panel, String texto, String visibleText) {
		this.crearLabelConTexto(panel, texto) => [
			visible <=> visibleText
		]
	}
	def crearLabelConTextoYColor(Panel panel, String texto, Color letra) {
		this.crearLabelConTexto(panel, texto) => [
			foreground = letra
		]
	}
	// Boton

	def crearBotonConCaption(Panel panel, String text) {
        new Button(panel) => [
            caption = text
        ]
	}

	def crearBotonConCaptionYonClick(Panel panel, String captionText, ()=>void bloque) {
		this.crearBotonConCaption(panel, captionText) => [
			onClick = bloque
		]
	}
	def crearBotonConCaptionOnClickYColorLetra(Panel panel, String captionText, ()=>void bloque, Color letra){
		crearBotonConCaptionYonClick(panel, captionText, bloque) => [
			foreground = letra
		]
	}
	
	def crearBotonConCaptionOnClickYColorLetraYFondo(Panel panel, String captionText, ()=>void bloque, Color letra, Color fondo){
	crearBotonConCaptionOnClickYColorLetra(panel, captionText, bloque, letra) => [
		background = fondo
	]
	}	
	def crearBotonConCaptionYonClickYEnabled(Panel panel, String captionText, ()=>void bloque, String enabledText) {
		this.crearBotonConCaptionYonClick(panel, captionText, bloque) => [
			enabled <=> enabledText
		]
	}
	
	// Lista
	
	def crearListaConValue(Panel panel, String valueText){
		new List(panel) => [
			value <=> valueText
		]
	}
	
	// Checkbox

	def crearCheckBoxConValueYVisibildad(Panel panel, String valueText, String visibleText) {
		this.crearCheckBoxConValueYTransformerNullToBoolean(panel, valueText) => [
			visible <=> visibleText
		]
	}
	
	def crearCheckBoxConValueYTransformerNullToBoolean(Panel panel, String valueText) {
		new CheckBox(panel) => [
			(value <=> valueText).transformer = new NullToBoolean()
		]
	}
	
	// Panel
	
	def crearPanelConColumnas(Panel panel, int cantidadDeColumnas) {
		new Panel(panel) => [
			layout = new ColumnLayout(cantidadDeColumnas)
		]
	}
	
	
	def crearPanelHorizontal(Panel panel) {
       new Panel(panel) => [
            layout = new HorizontalLayout
       ]
	}
	
	// TextBox
	
	def crearTextBoxConValue(Panel panel, String valueText) {
		new TextBox(panel) => [
			value <=> valueText
			width = 200
		]
	}
	
	// PasswordField
	
	def crearPasswordFieldConValue(Panel panel, String valueText) {
		new PasswordField(panel) => [
			value <=> valueText
		]
	}
	
}