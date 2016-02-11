package ar.edu.alumnosPersistence.repos

import ar.edu.alumnosPersistence.domain.Alumno
import ar.edu.alumnosPersistence.domain.Cursada
import ar.edu.alumnosPersistence.domain.Materia
import org.junit.After
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import org.neo4j.graphdb.GraphDatabaseService
import org.neo4j.graphdb.Transaction
import org.neo4j.test.TestGraphDatabaseFactory
import uqbar.arena.persistence.Configuration
import uqbar.arena.persistence.SessionManager

class TestAlumnos {

	GraphDatabaseService graphDb
	Transaction transaction

	Alumno leandro
	Alumno fede
	
	@Test
	def void actualizacionDeUnEnum() {
		leandro.tipoAlumno = Alumno.TipoAlumno.ESTUDIOSO
		Assert.assertTrue(leandro.esEstudioso)
		RepoAlumnos.instance.update(leandro)
		val leandroActualizado = RepoAlumnos.instance.get("Leandro Barragan")
		Assert.assertEquals(Alumno.TipoAlumno.ESTUDIOSO, leandroActualizado.tipoAlumno) 
	}

	@Test
	def void searchByExamplePorNombreAlumnoFunciona() {
		val alumnoExample = new Alumno => [
			nombre = "Leandro Barragan"
		]
		val result = RepoAlumnos.instance.searchByExample(alumnoExample)
		Assert.assertEquals(1, result.size)
	}	
	
	@Test(expected=Exception)
	def void searchByExampleQueAlumnosCursanDesignFalla() {
		val alumnoExample = new Alumno => [
			cursadas = newArrayList(new Cursada("Design"))
		]
		RepoAlumnos.instance.searchByExample(alumnoExample)
	}

	@Before
	def void init() {
		graphDb = new TestGraphDatabaseFactory().newImpermanentDatabaseBuilder().newGraphDatabase()
		SessionManager.testMode(graphDb)
		Configuration.configure()
		transaction = graphDb.beginTx()
		leandro = RepoAlumnos.instance.createIfNotExists(leandroBarragan)
		fede = RepoAlumnos.instance.createIfNotExists(fedeCano)
	}
	
	@After
	def void end() {
		RepoAlumnos.instance.delete(leandro)
		RepoAlumnos.instance.delete(fede)
		transaction.finish
		graphDb.shutdown
		Configuration.clear()
	}
	
	def getLeandroBarragan() {
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

	def getFedeCano() {
		new Alumno => [
			nombre = "Fede Cano"
			tipoAlumno = Alumno.TipoAlumno.ESTUDIOSO
			cursadas = newArrayList(
				new Cursada => [
					materia = new Materia("Matematica Discreta", 1)
					comision = "K3052"
				],
				new Cursada => [
					materia = new Materia("Análisis Matemático I", 1)
					comision = "K3011"
				]
			)
		]
	}
	
}