
package services;

import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import domain.Application;
import repositories.ApplicationRepository;

@Service
@Transactional
public class ApplicationService {

	//Repositories
	@Autowired
	private ApplicationRepository applicationRepository;

	//Services


	//Constructor
	public ApplicationService() {
		super();
	}

	//CRUD Methods
	public Application create() {
		Application application = new Application();
		application.setCreateMoment(new Date());

		return application;

	}

	public List<Application> findAll() {
		return applicationRepository.findAll();
	}

	//Other Methods
	public Application save(Application application) {
		Assert.notNull(application);
		return applicationRepository.save(application);
	}

	public Collection<Application> applicationsOfCourse(int courseID) {
		return applicationRepository.applicationsOfCourse(courseID);
	}

	public Collection<Application> allApplicationsOfAcademy(int AcademyID) {
		return applicationRepository.allApplicationsOfAcademy(AcademyID);
	}

}
