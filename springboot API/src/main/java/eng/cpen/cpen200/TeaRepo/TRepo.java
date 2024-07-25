package eng.cpen.cpen200.TeaRepo;

import org.springframework.data.jpa.repository.JpaRepository;

import eng.cpen.cpen200.TeaModel.Tmodel;

public interface TRepo extends JpaRepository<Tmodel, Long> {

}
