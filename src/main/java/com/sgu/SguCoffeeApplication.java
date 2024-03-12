package com.sgu;

import org.modelmapper.ModelMapper;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class SguCoffeeApplication {
	
	public static void main(String[] args) {
		SpringApplication.run(SguCoffeeApplication.class, args);
		System.out.println("-----------------------------------------------------------");
        System.out.println("🚀 Server web: http://localhost:8080");
        System.out.println("🚀 Api docs: http://localhost:8080/swagger-ui.html ");
	}
	@Bean
	public ModelMapper modelMapper() {
	    return new ModelMapper();
	}
}
