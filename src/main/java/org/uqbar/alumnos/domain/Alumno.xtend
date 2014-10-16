package org.uqbar.alumnos.domain

import java.util.ArrayList
import java.util.List
import org.uqbar.commons.model.Entity
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.utils.Transactional
import uqbar.arena.persistence.annotations.PersistentClass
import uqbar.arena.persistence.annotations.PersistentField
import uqbar.arena.persistence.annotations.Relation

@Transactional
@Observable
@PersistentClass
class Alumno extends Entity {
	
	@Property String nombre
	@Property List<Cursada> cursadas
	@Property Alumno.TipoAlumno tipoAlumno
	
	enum TipoAlumno {
		ESTUDIOSO, VAGONETA, COMUN
	}
	
	new() {
		nombre = ""
		cursadas = new ArrayList<Cursada>
		tipoAlumno = Alumno.TipoAlumno.COMUN	
	}
	
	@PersistentField
	def getTipoAlumno() {
		_tipoAlumno
	}
	
	@PersistentField
	def getNombre() {
		_nombre
	}
	
	@Relation
	def getCursadas() {
		_cursadas
	}

	override toString() {
		nombre + " (" + tipoAlumno + ") - cursando " + cursadas.map [ it.materia ].map [ it.nombre ]
	}
		
}
