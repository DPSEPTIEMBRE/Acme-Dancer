
package services;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import domain.Administrator;
import domain.Tutorial;
import repositories.AdministratorRepository;

@Service
@Transactional
public class AdministratorService {

	//Repository
	private AdministratorRepository administratorRepository;

	//Service


	//Constructor
	public AdministratorService() {
		super();
	}

	//CRUD Methods
	public Administrator save(Administrator administrator) {
		return administratorRepository.save(administrator);
	}

	//Other Methods

	public Object[] minAvgSdMaxCoursesPerAcademy() {
		return administratorRepository.minAvgSdMaxCoursesPerAcademy();
	}

	public Object[] minAvgSdMaxApplicationsPerCourse() {
		return administratorRepository.minAvgSdMaxApplicationsPerCourse();
	}

	public Object[] minAvgMaxTutorialsPerAcademy() {
		return administratorRepository.minAvgMaxTutorialsPerAcademy();
	}

	public Object[] minAvgMaxTutorialNumShows() {
		return administratorRepository.minAvgMaxTutorialNumShows();
	}

	public Double avgChirpsPerActor() {
		return administratorRepository.avgChirpsPerActor();
	}

	public Double avgSubscriptionPerActor() {
		return administratorRepository.avgSubscriptionPerActor();
	}

	public List<Tutorial> tutorialsOrderByNumShowsDes() {
		return administratorRepository.tutorialsOrderByNumShowsDes();
	}

}
