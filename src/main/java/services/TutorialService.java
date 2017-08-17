
package services;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import domain.Tutorial;
import repositories.TutorialRepository;

@Service
@Transactional
public class TutorialService {

	//Repositories
	@Autowired
	private TutorialRepository tutorialRepository;

	//Services


	//Constructor

	public TutorialService() {
		super();
	}

	//CRUD Methods
	public Tutorial create() {
		Tutorial tutorial = new Tutorial();

		return tutorial;
	}

	public void delete(Tutorial tutorial) {
		Assert.notNull(tutorial);
		tutorialRepository.delete(tutorial);
	}

	public List<Tutorial> findAll() {
		return tutorialRepository.findAll();
	}

	public Tutorial findOne(Integer tutorial) {
		Assert.notNull(tutorial);
		return tutorialRepository.findOne(tutorial);
	}

	public Tutorial save(Tutorial tutorial) {
		Assert.notNull(tutorial);
		return tutorialRepository.save(tutorial);
	}

	//Other methods
	public Collection<Tutorial> tutorialsOfAcademy(int academyID) {
		return tutorialRepository.tutorialsOfAcademy(academyID);
	}

}
