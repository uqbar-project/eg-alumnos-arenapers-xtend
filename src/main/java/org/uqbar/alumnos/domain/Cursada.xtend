package org.uqbar.alumnos.domain

import org.uqbar.commons.model.Entity
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.utils.Transactional
import uqbar.arena.persistence.annotations.PersistentClass
import uqbar.arena.persistence.annotations.PersistentField
import uqbar.arena.persistence.annotations.Relation

@Transactional
@Observable
@PersistentClass
class Cursada extends Entity {

	@Property String comision
	@Property Materia materia
	
	new(String nombreMateria) {
		materia = new Materia(nombreMateria, 0)
	}
	
	new() {
		
	}
	
	@PersistentField
	def getComision() {
		_comision
	}
	
	@Relation
	def getMateria() {
		_materia
	}
	
}
