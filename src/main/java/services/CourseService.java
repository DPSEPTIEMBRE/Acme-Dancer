
package services;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import domain.Academy;
import domain.Course;
import domain.Style;
import repositories.CourseRepository;

@Service
@Transactional
public class CourseService {

	//Repositories
	@Autowired
	private CourseRepository	courseRepository;

	//Services
	@Autowired
	private StyleService		styleService;

	@Autowired
	private AcademyService		academyService;

	//Constructor

	public CourseService() {
		super();
	}

	//CRUD Methods

	public Course create() {
		Course course = new Course();

		return course;
	}

	public void delete(Course course) {
		Assert.notNull(course);

		Style style = course.getStyle();
		Academy academy = course.getAcademy();

		style.getCourses().remove(course);
		styleService.save(style);
		academy.getCourses().remove(course);
		academyService.save(academy);

		courseRepository.delete(course);
	}

	public List<Course> findAll() {
		return courseRepository.findAll();
	}

	public Course findOne(Integer course) {
		Assert.notNull(course);
		return courseRepository.findOne(course);
	}

	public Course save(Course course) {
		return courseRepository.save(course);
	}

	//Other Methods
	public Collection<Course> findCourses(String keyWord) {
		return courseRepository.findCourses(keyWord);
	}
	public Collection<Course> coursesOfAcademy(int academyID) {
		return courseRepository.coursesOfAcademy(academyID);
	}

	public Collection<Course> coursesOfStyle(int StyleID) {
		return courseRepository.coursesOfStyle(StyleID);
	}


}
