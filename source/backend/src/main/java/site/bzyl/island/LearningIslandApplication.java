package site.bzyl.island;

import org.apache.ibatis.reflection.Reflector;
import site.bzyl.island.configuration.property.SystemConfig;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import sun.security.util.Password;

//@SpringBootApplication
//@EnableTransactionManagement
//@EnableConfigurationProperties(value = { SystemConfig.class})
//public class LearningIslandApplication {
//    public static void main(String[] args) {
//        SpringApplication.run(LearningIslandApplication.class, args);
//    }
//}


class Main {
    public static void main(String[] args) {
        Reflector reflector = new Reflector(User.class);
    }
}

class User {
    private String username;

    private String password;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}

