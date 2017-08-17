package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import domain.Application;

public interface ApplicationRepository extends JpaRepository<Application, Integer>{

	//Solicitudes de un curso
	@Query("select c.applications from Course c where c.id=?1")
	Collection<Application> applicationsOfCourse(int courseID);
	
	//Solicitudes totales de la academia(todos los cursos)
	@Query("select c.applications from Academy a join a.courses c where a.id=?1")
	Collection<Application> allApplicationsOfAcademy(int AcademyID);
}
