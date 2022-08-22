package ua.goit.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import ua.goit.model.dao.UserDao;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface UsersRepository extends CrudRepository<UserDao, UUID> {

    Optional<UserDao> findByEmail(String email);

    @Query("SELECT u FROM UserDao u")
    List<UserDao> findAllUsers();

    @Query("SELECT u FROM UserDao u WHERE u.email IN (?1)")
    List<UserDao> findUserByEmail(String email);


}
