package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import domain.Course;

public interface CourseRepository extends JpaRepository<Course, Integer> {

	// Cursos que ofrece una academia
	@Query("select a.courses from Academy a where a.id=?1")
	Collection<Course> coursesOfAcademy(int AcademyID);
	
	//Cursos de un determinado estilo
	@Query("select s.courses from Style s where s.id=?1")
	Collection<Course> coursesOfStyle(int StyleID);
	
	//Buscar un curso usando una palabra clave que debe aparecer en su título o el nombre o descripción del estilo correspondiente.
	@Query("select o from Course o where (o.title LIKE '%?1%' OR o.style.name LIKE '%?1%' OR o.style.description LIKE '%?1%')")
	Collection<Course> findCourses(String keyWord);
}

