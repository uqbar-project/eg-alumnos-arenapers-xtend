package org.uqbar.alumnos.domain

import org.uqbar.alumnos.home.RepoAlumnos
import uqbar.arena.persistence.Configuration

class App {

	def static void main(String[] args) {
		Configuration.configure()
		val leandro = RepoAlumnos.instance.createIfNotExists(leandroBarragan)
		println("Alumno es " + leandro.tipoAlumno)
		leandro.tipoAlumno = Alumno.TipoAlumno.ESTUDIOSO
		println("Alumno ahora es " + leandro.tipoAlumno)
		RepoAlumnos.instance.update(leandro)
		println("Estos son los alumnos: " + RepoAlumnos.instance.allInstances())

		// Exception in thread "main" java.lang.Exception: No se puede hacer query by example con relaciones entre objetos.
		println("¿Qué alumnos cursan Design?")
		println
		val alumnoExample = new Alumno => [
			cursadas = newArrayList(new Cursada("Design"))
		]
		RepoAlumnos.instance.searchByExample(alumnoExample)
	}

	static def getLeandroBarragan() {
		new Alumno => [
			nombre = "Leandro Barragan"
			tipoAlumno = Alumno.TipoAlumno.COMUN
			cursadas = newArrayList(
				new Cursada => [
					materia = new Materia("Design", 3)
					comision = "K3052"
				],
				new Cursada => [
					materia = new Materia("SysOp", 3)
					comision = "K3011"
				]
			)
		]
	}

}