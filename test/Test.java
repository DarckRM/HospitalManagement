import com.darcklh.controller.UserController;
import com.darcklh.dao.UserDao;
import com.darcklh.entity.User;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.util.List;
public class Test {

    @Autowired
    UserController userController;

    @org.junit.Test
    public void run1() {

        try {
            System.out.println(userController.test());
        } catch (NullPointerException e) {
            System.out.println("啥也没有");
        }

    }

}
