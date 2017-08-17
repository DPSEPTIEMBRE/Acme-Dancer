
package services;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import domain.Application;
import domain.Chirp;
import domain.Dancer;
import repositories.DancerRepository;
import security.Authority;
import security.UserAccount;

@Service
@Transactional
public class DancerService {

	//Repositories
	@Autowired
	private DancerRepository dancerRepository;

	//Services


	//Constructor
	public DancerService() {
		super();
	}

	//CRUD Methods
	public Dancer create() {
		Dancer dancer = new Dancer();
		dancer.setChirps(new ArrayList<Chirp>());
		dancer.setApplications(new ArrayList<Application>());

		Authority a = new Authority();
		a.setAuthority(Authority.DANCER);
		UserAccount account = new UserAccount();
		account.setAuthorities(Arrays.asList(a));
		dancer.setUserAccount(account);

		return dancer;

	}
	public Dancer findOne(Integer dancer) {
		Assert.notNull(dancer);
		return dancerRepository.findOne(dancer);
	}

	public Dancer save(Dancer dancer) {
		Assert.notNull(dancer);
		return dancerRepository.save(dancer);
	}

	//Other methods
	public Collection<Application> applicationsOfDancer(int DancerID) {
		return dancerRepository.applicationsOfDancer(DancerID);
	}

}
