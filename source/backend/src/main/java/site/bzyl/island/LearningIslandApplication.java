package site.bzyl.island;

import site.bzyl.island.configuration.property.SystemConfig;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableTransactionManagement
@EnableConfigurationProperties(value = { SystemConfig.class})
public class LearningIslandApplication {
    public static void main(String[] args) {
        SpringApplication.run(LearningIslandApplication.class, args);
    }
}
