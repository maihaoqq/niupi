import org.junit.After;
import org.junit.Before;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:application.xml")
public class BaseTest {
    @Before
    public void init() {
        //在运行测试之前的业务代码
    }
    @After
    public void after() {
        //在测试完成之后的业务代码
    }
}