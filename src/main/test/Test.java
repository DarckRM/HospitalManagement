import com.corepower.dao.UserDao;
import com.corepower.domain.User;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @author DarckLH
 * @date 2021/6/22 19:41
 * @Description
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class Test {

    @Autowired
    private UserDao userDao;

    @org.junit.Test
    public void run1() {
        User user = new User();
        user.setUsername("111");
        user.setPassword("698D51A19D8A121CE581499D7B701668");

        System.out.println(userDao.findUser(user));
    }
}
