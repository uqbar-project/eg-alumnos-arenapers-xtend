package org.uqbar.alumnos.domain

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.Entity
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.utils.Transactional
import uqbar.arena.persistence.annotations.PersistentClass
import uqbar.arena.persistence.annotations.PersistentField

@Transactional
@Observable
@PersistentClass
@Accessors
class Materia extends Entity {

	String nombre
	int anio

	new() {
		
	}
	
	new(String unNombre, int unAnio) {
		nombre = unNombre
		anio = unAnio	
	}	
	
	@PersistentField
	def getNombre() {
		nombre
	}
	
	@PersistentField
	def getAnio() {
		anio
	}
	
}
