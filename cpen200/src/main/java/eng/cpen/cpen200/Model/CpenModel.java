package eng.cpen.cpen200.Model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Data
@Table(name = "students", schema = "department")

public class CpenModel {
    public String first_name;
    public String last_name;
    public String email;
    @Id
    public int student_id;
    public int phone;
    public int dob;
    public int password;
}
