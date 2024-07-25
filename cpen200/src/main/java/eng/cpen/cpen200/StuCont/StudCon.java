package eng.cpen.cpen200.StuCont;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import eng.cpen.cpen200.Model.CpenModel;
import eng.cpen.cpen200.Repo.stuRepo;

@RestController
public class StudCon {

    @Autowired
    stuRepo studRepo;

    @PostMapping("/addStudent")
    public String addPerson(@RequestBody CpenModel cpenModel) {
        studRepo.save(cpenModel);
        return "added student succesfully";
    }

    @GetMapping("/getStudent")
    public List<CpenModel> getStudent() {
        return studRepo.findAll();
    }

}
