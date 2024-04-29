package com.springboot.main.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.springboot.main.UserEntity.RegisteredUser;


@Repository
public interface UserRepository extends JpaRepository<RegisteredUser, Long>{
	
}
