package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import domain.Chirp;

public interface ChirpRepository extends JpaRepository<Chirp, Integer>{

	//Chirps de un actor ordenados en orden descendente por mommentWritten
	@Query("select c from Chirp c where c.actor.id=?1 order by c.momentWritten desc")
	Collection<Chirp> chirpsOfActor(int ActorId);
	
	//Todos los chirps ordenados en orden descendente.
	@Query("select c from Chirp c order by c.momentWritten desc")
	Collection<Chirp> allChirpsOrderByMommentDesc();
	
}
