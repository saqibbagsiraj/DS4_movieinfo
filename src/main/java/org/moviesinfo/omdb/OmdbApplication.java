package org.moviesinfo.omdb;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@AutoConfiguration
public class OmdbApplication {

    public static void main(String[] args) {
        SpringApplication.run(OmdbApplication.class, args);
    }

}
