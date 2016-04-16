package utils

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.List

class CreadorDeWidgets {
		def crearLabelConTexto(Panel panel, String texto) {
        new Label(panel) => [
            text = texto
        ]
	}
	
	def crearPanelConColumnas(Panel panel, int cantidadDeColumnas) {
		new Panel(panel) => [
			layout = new ColumnLayout(cantidadDeColumnas)
		]
	}
	def crearBotonConCaptionYonClick(Panel panel, String text, ()=>void bloque) {
		this.crearBotonConCaption(panel, text) => [
			onClick = bloque
		]
	}
	def crearBotonConCaption(Panel panel, String text) {
        new Button(panel) => [
            caption = text
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
	def crearBotonConCaptionYonClickYEnabled(Panel panel, String captionText, ()=>void bloque, String enabledText) {
		this.crearBotonConCaptionYonClick(panel, captionText, bloque) => [
			enabled <=> enabledText
		]
	}
	def crearListaConValue(Panel panel, String valueText){
		new List(panel) => [
			value <=> valueText
		]
	}

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
	def crearPanelHorizontal(Panel panel) {
       new Panel(panel) => [
            layout = new HorizontalLayout
       ]
	}
}