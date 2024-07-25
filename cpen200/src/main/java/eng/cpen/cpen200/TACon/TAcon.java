package eng.cpen.cpen200.TACon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import eng.cpen.cpen200.TAModel.TAModel;
import eng.cpen.cpen200.TARepo.TARepo;

public class TAcon {

    @Autowired
    TARepo taRepo;

    @PostMapping("/addTA")
    public String addTA(@RequestBody TAModel taModel) {
        taRepo.save(taModel);
        return "TA added successfully";
    }

    @GetMapping("/getTA")
    public List<TAModel> getTA() {
        return taRepo.findAll();
    }

}
