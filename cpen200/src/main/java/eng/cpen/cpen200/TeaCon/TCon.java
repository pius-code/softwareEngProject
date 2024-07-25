package eng.cpen.cpen200.TeaCon;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

import eng.cpen.cpen200.TeaModel.Tmodel;
import eng.cpen.cpen200.TeaRepo.TRepo;

@RestController
public class TCon {

    @Autowired
    TRepo tRepo;

    @PostMapping("/addTeacher")
    public String addTeacher(@RequestBody Tmodel tmodel) {
        tRepo.save(tmodel);
        return "Teacher added successfully";
    }

    @GetMapping("/getTeacher")
    public List<Tmodel> getTeacher() {
        return tRepo.findAll();
    }

}
