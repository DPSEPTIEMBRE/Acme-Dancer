
package services;

import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import domain.Academy;
import domain.Actor;
import domain.Administrator;
import domain.Chirp;
import domain.Dancer;
import repositories.ChirpRepository;
import security.Authority;
import security.LoginService;

@Service
@Transactional
public class ChirpService {

	//Repository
	@Autowired
	private ChirpRepository			chirpRepository;

	//Services
	@Autowired
	private AcademyService			academyService;

	@Autowired
	private DancerService			dancerService;

	@Autowired
	private AdministratorService	administratorService;
	
	@Autowired
	private LoginService			loginService;


	//Constructor
	public ChirpService() {
		super();
	}

	//CRUD Methods

	public Chirp create() {
		Chirp chirp = new Chirp();
		
		chirp.setText(new String());
		chirp.setActor(loginService.findActorByUserName(LoginService.getPrincipal().getId()));
		chirp.setMomentWritten(new Date());

		return chirp;
	}
	public void delete(Chirp chirp) {
		Assert.notNull(chirp);
		Actor a = chirp.getActor();
		Assert.notNull(a);
		List<Chirp> chirps = a.getChirps();
		chirps.remove(chirp);
		a.setChirps(chirps);
		

		if (a.getUserAccount().getAuthorities().contains(Authority.ACADEMY)) {
			academyService.save((Academy) a);
		} else if (a.getUserAccount().getAuthorities().contains(Authority.DANCER)) {
			dancerService.save((Dancer) a);
		} else if (a.getUserAccount().getAuthorities().contains(Authority.ADMINISTRATOR)){
			administratorService.save((Administrator) a);
		}

		chirpRepository.delete(chirp);
	}

	public List<Chirp> findAll() {
		return chirpRepository.findAll();
	}
	
	public Chirp findOne(int id) {
		return chirpRepository.findOne(id);
	}

	public Chirp save(Chirp chirp) {
		Assert.notNull(chirp);
		return chirpRepository.save(chirp);
	}

	//Other Methods
	public Collection<Chirp> chirpsOfActor(int ActorId) {
		return chirpRepository.chirpsOfActor(ActorId);
	}

	public Collection<Chirp> allChirpsOrderByMommentDesc() {
		return chirpRepository.allChirpsOrderByMommentDesc();
	}

}
