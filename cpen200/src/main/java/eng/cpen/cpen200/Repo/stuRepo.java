package eng.cpen.cpen200.Repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import eng.cpen.cpen200.Model.CpenModel;

@RepositoryRestResource
public interface stuRepo extends JpaRepository<CpenModel, Long> {

}
