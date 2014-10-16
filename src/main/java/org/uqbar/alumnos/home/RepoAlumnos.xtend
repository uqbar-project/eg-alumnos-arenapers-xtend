package org.uqbar.alumnos.home

import org.uqbar.alumnos.domain.Alumno

import uqbar.arena.persistence.PersistentHome

class RepoAlumnos extends PersistentHome<Alumno> {

	override getEntityType() {
		typeof(Alumno)
	}

	override createExample() {
		new Alumno
	}

	def createIfNotExists(Alumno alumno) {
		println("Busco al alumno")
		var alumnoDB = this.get(alumno.nombre)
		if (alumnoDB == null) {
			println("No existe, creo al alumno")
			this.create(alumno)
			alumnoDB = alumno
		} else {
			println("Ya existe el alumno")
		}
		alumnoDB
	}

	def Alumno get(String descripcion) {
		allInstances().findFirst [ alumno | alumno.nombre.equalsIgnoreCase(descripcion) ] 
	}
	
	/**
	 * **********************************************************
	 * DEFINICION DEL SINGLETON
	 * **********************************************************
	 * 
	 */
	static RepoAlumnos instance

	static def getInstance() {
		if (instance == null) {
			instance = new RepoAlumnos()
		}
		instance
	}
}
