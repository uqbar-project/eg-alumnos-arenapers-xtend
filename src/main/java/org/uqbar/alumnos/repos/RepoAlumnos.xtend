package org.uqbar.alumnos.repos

import org.uqbar.alumnos.domain.Alumno

import uqbar.arena.persistence.PersistentHome

class RepoAlumnos extends PersistentHome<Alumno> {

	override getEntityType() {
		typeof(Alumno)
	}

	override createExample() {
		new Alumno
	}

	
	/**
	 * **********************************************************
	 *                           ALTA
	 * **********************************************************
	 * 
	 */
	
	def createIfNotExists(Alumno alumno) {
		var alumnoDB = this.get(alumno.nombre)
		if (alumnoDB == null) {
			this.create(alumno)
			alumnoDB = alumno
		} else {
		}
		alumnoDB
	}

	/**
	 * **********************************************************
	 *                           BUSQUEDA
	 * **********************************************************
	 * 
	 */

	def Alumno get(String unNombre) {
		// Traigo todo el grafo de objetos de disco a memoria y luego hago la búsqueda con el fwk de colecciones de xtend
		// allInstances().findFirst [ alumno | alumno.nombre.equalsIgnoreCase(unNombre) ] 
		// Hago la búsqueda directamente en el grafo que está en el disco
		val alumno = new Alumno => [
			nombre = unNombre
		]
		val alumnos = searchByExample(alumno)
		if (alumnos.isEmpty) {
			null
		} else {
			alumnos.get(0)
		}
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
