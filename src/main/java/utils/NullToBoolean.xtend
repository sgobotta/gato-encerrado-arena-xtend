package utils

import org.uqbar.arena.bindings.ValueTransformer

class NullToBoolean implements ValueTransformer<Boolean, Boolean> {

    override getModelType() {
        Boolean
    }

    override getViewType() {
        Boolean
    }

    override modelToView(Boolean valueFromModel) {
        if(valueFromModel != null) valueFromModel else false
    }

    override viewToModel(Boolean valueFromView) {
        valueFromView
    }

}
