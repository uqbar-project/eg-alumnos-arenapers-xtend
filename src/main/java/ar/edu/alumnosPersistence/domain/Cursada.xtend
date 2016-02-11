package ar.edu.alumnosPersistence.domain

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.Entity
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.utils.Transactional
import uqbar.arena.persistence.annotations.PersistentClass
import uqbar.arena.persistence.annotations.PersistentField
import uqbar.arena.persistence.annotations.Relation

@Transactional
@Observable
@PersistentClass
@Accessors
class Cursada extends Entity {

	@PersistentField String comision
	@Relation Materia materia
	
	new(String nombreMateria) {
		materia = new Materia(nombreMateria, 0)
	}
	
	new() {
		
	}
	
}
