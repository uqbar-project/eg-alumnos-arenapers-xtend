package org.uqbar.alumnos.domain

import java.util.ArrayList
import java.util.List
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
class Alumno extends Entity {
	
	@PersistentField String nombre
	@Relation List<Cursada> cursadas
	@PersistentField Alumno.TipoAlumno tipoAlumno
	
	enum TipoAlumno {
		ESTUDIOSO, VAGONETA, COMUN
	}
	
	new() {
		nombre = ""
		cursadas = new ArrayList<Cursada>
		tipoAlumno = Alumno.TipoAlumno.COMUN	
	}
	
	def getCursadas() {
		cursadas
	}

	def esEstudioso() {
		tipoAlumno.equals(Alumno.TipoAlumno.ESTUDIOSO)
	}
	
	override toString() {
		nombre + " (" + tipoAlumno + ") - cursando " + cursadas.map [ it.materia ].map [ it.nombre ]
	}
		
}
