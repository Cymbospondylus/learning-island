package site.bzyl.bitstore;

import site.bzyl.bitstore.configuration.property.SystemConfig;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableTransactionManagement
@EnableConfigurationProperties(value = { SystemConfig.class})
public class BitStoreApplication {
    public static void main(String[] args) {
        SpringApplication.run(BitStoreApplication.class, args);
    }
}
