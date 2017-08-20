
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
		Application app= new Application();
		if(exists(application.getId())){
			app=findOne(application.getId());
			app.setCourse(application.getCourse());
			app.setCreateMoment(application.getCreateMoment());
			app.setStatusApplication(application.getStatusApplication());
			return applicationRepository.save(app);
		}else{
			return applicationRepository.save(application);
		}
	}

	public Application findOne(Integer arg0) {
		return applicationRepository.findOne(arg0);
	}

	public Collection<Application> applicationsOfCourse(int courseID) {
		return applicationRepository.applicationsOfCourse(courseID);
	}

	public boolean exists(Integer arg0) {
		return applicationRepository.exists(arg0);
	}

	public Collection<Application> allApplicationsOfAcademy(int AcademyID) {
		return applicationRepository.allApplicationsOfAcademy(AcademyID);
	}

}
