
package services;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.CourseRepository;
import domain.Academy;
import domain.Application;
import domain.Course;
import domain.Style;

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
	
	@Autowired
	private ApplicationService	applicationService;

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

		if(!course.getApplications().isEmpty()){
			List<Application> apps = course.getApplications();
			List<Application> newApps = new ArrayList<Application>();
			course.setApplications(newApps);

			for(Application app : apps){
				applicationService.delete(app.getId());
			}
		}

		List<Course> coursesOfStyle = style.getCourses();
		List<Course> coursesOfAcademy  = academy.getCourses();

		coursesOfStyle.remove(course);
		coursesOfAcademy.remove(course);

		style.setCourses(coursesOfStyle);
		academy.setCourses(coursesOfAcademy);

		styleService.save(style);
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
		Collection<Course> courses = courseRepository.findAll();
		Collection<Course> res = new ArrayList<Course>();
		for (Course c : courses) {
			if (c.getTitle().contains(keyWord) || c.getStyle().getName().contains(keyWord) || c.getStyle().getDescription().contains(keyWord)) {
				res.add(c);
			}
		}

		return res;
	}
	public Collection<Course> coursesOfAcademy(int academyID) {
		return courseRepository.coursesOfAcademy(academyID);
	}

	public Collection<Course> coursesOfStyle(int StyleID) {
		return courseRepository.coursesOfStyle(StyleID);
	}


}
