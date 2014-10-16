package org.uqbar.alumnos.domain

import org.uqbar.commons.model.Entity
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.utils.Transactional
import uqbar.arena.persistence.annotations.PersistentClass
import uqbar.arena.persistence.annotations.PersistentField

@Transactional
@Observable
@PersistentClass
class Materia extends Entity {

	@Property String nombre
	@Property int anio

	new() {
		
	}
	
	new(String unNombre, int unAnio) {
		nombre = unNombre
		anio = unAnio	
	}	
	
	@PersistentField
	def getNombre() {
		_nombre
	}
	
	@PersistentField
	def getAnio() {
		_anio
	}
	
}
