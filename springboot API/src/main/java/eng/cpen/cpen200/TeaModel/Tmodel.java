package eng.cpen.cpen200.TeaModel;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "lectures", schema = "department")
public class Tmodel {
    @Id
    public int lecture_id;
    public String full_name;
    public String email;
    public int phone;
    public int password;
}
