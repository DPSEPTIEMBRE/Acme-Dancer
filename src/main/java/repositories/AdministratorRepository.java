package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import domain.Administrator;
import domain.Tutorial;

public interface AdministratorRepository extends JpaRepository<Administrator, Integer>{

	//El m�nimo, media, desviaci�n est�ndar y m�ximo de cursos por academia.
	@Query("select min(a.courses.size),avg(a.courses.size),stddev(a.courses.size),max(a.courses.size) from Academy a")
	Object[] minAvgSdMaxCoursesPerAcademy();
	
	//El m�nimo, media, desviaci�n est�ndar y m�ximo de solicitudes por curso.
	@Query("select min(c.applications.size),avg(c.applications.size),stddev(c.applications.size),max(c.applications.size) from Course c")
	Object[] minAvgSdMaxApplicationsPerCourse();

	//El m�nimo, media y m�ximo de tutoriales por academia.
	@Query("select min(a.tutorials.size),avg(a.tutorials.size),max(a.tutorials.size) from Academy a")
	Object[] minAvgMaxTutorialsPerAcademy();
	
	//El m�nimo, media y m�ximo de veces que un tutorial se muestra.
	@Query("select min(t.numShows),avg(t.numShows),max(t.numShows) from Tutorial t")
	Object[] minAvgMaxTutorialNumShows();
	
	//La lista de tutoriales, ordenados en orden descendente de acuerdo al
	//n�mero de veces que se han visto.
	@Query("select t from Tutorial t order by t.numShows desc")
	Collection<Tutorial> tutorialsOrderByNumShowsDes();
	
	//La media de chirps por actor.
	@Query("select avg(a.chirps.size) from Actor a")
	Double avgChirpsPerActor();
	
	//La media de suscripciones por actor.
	@Query("select (count(ap)/(select count(a) from Actor a)) from Application ap where ap.statusApplication like 'ACCEPTED'")
	Double avgSubscriptionPerActor();
}
