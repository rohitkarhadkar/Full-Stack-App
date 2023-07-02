package dev.rkarhadkar.movies;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
//@RestController
public class MoviesApplication {
//	@Value("${spring.data.mongodb.database}")
//	private static String mongoCluster;

	public static void main(String[] args) {
		//System.out.println(MoviesApplication.mongoCluster);
		SpringApplication.run(MoviesApplication.class, args);


	}

//	@GetMapping("/root")
//	public String apiRoot()
//	{
//		return  "Hello, World!!!";
//	}


}
