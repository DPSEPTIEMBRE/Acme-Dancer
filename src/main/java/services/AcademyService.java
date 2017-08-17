
package services;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import domain.Academy;
import domain.Chirp;
import domain.Course;
import domain.Tutorial;
import repositories.AcademyRepository;
import security.Authority;
import security.UserAccount;

@Service
@Transactional
public class AcademyService {

	//Repositories
	@Autowired
	private AcademyRepository academyRepository;

	//Services


	//Constructor
	public AcademyService() {
		super();
	}

	//CRUD Methods

	public Academy create() {
		Academy academy = new Academy();
		academy.setTutorials(new ArrayList<Tutorial>());
		academy.setCourses(new ArrayList<Course>());
		academy.setChirps(new ArrayList<Chirp>());

		Authority a = new Authority();
		a.setAuthority(Authority.ACADEMY);
		UserAccount account = new UserAccount();
		account.setAuthorities(Arrays.asList(a));
		academy.setUserAccount(account);

		return academy;

	}

	public List<Academy> findAll() {
		return academyRepository.findAll();
	}

	public Academy findOne(Integer academy) {
		Assert.notNull(academy);
		return academyRepository.findOne(academy);
	}

	public Academy save(Academy academy) {
		Assert.notNull(academy);
		return academyRepository.save(academy);
	}

	//Others Methods

	public Academy academyOfCourse(int CourseID) {
		return academyRepository.academyOfCourse(CourseID);
	}

}
