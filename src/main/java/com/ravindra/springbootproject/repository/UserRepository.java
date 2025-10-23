package com.ravindra.springbootproject.repository;

import com.ravindra.springbootproject.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
}