package eng.cpen.cpen200.TAModel;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "teaching_assistants", schema = "department")
public class TAModel {
    @Id
    public int ta_id;
    public String fullname;
    public String email;
    public int phone;
}
