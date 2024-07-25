package eng.cpen.cpen200.TARepo;

import org.springframework.data.jpa.repository.JpaRepository;

import eng.cpen.cpen200.TAModel.TAModel;

public interface TARepo extends JpaRepository<TAModel, Long> {

}
