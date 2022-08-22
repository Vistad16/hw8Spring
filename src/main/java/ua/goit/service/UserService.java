package ua.goit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.goit.converter.UserConverter;
import ua.goit.model.exceptions.UserIsAlreadyExistsException;
import ua.goit.model.exceptions.UserNotFoundException;
import ua.goit.model.RolesEnum;
import ua.goit.model.dao.UserDao;
import ua.goit.model.dto.UserDto;
import ua.goit.repository.UsersRepository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
public class UserService {
    private final UsersRepository userRepository;
    private final UserConverter userConverter;


    @Autowired
    public UserService(UsersRepository userRepository, UserConverter userConverter) {
        this.userRepository = userRepository;
        this.userConverter = userConverter;
    }

    public void save(UserDto user) {
        validateUser(user);
        user.setRole(RolesEnum.ROLE_USER);
        userRepository.save(userConverter.dtoToDao(user));
    }

    public void updateToAdmin(UserDto user) {
        Optional<UserDao> userDao = userRepository.findById(user.getId());
        UserDao userOld = userDao.get();
        UserDao userDaoNew = new UserDao();
        userDaoNew.setId(userOld.getId());
        userDaoNew.setFirstName(userOld.getLastName());
        userDaoNew.setLastName(userOld.getLastName());
        userDaoNew.setPassword(userOld.getPassword());
        userDaoNew.setRole(RolesEnum.ROLE_ADMIN);
        userDaoNew.setEmail(userOld.getEmail());
        userRepository.save(userDaoNew);
    }

    public void updateToUser(UserDto user) {
        Optional<UserDao> userDao = userRepository.findById(user.getId());
        UserDao userOld = userDao.get();
        UserDao userDaoNew = new UserDao();
        userDaoNew.setId(userOld.getId());
        userDaoNew.setFirstName(userOld.getLastName());
        userDaoNew.setLastName(userOld.getLastName());
        userDaoNew.setPassword(userOld.getPassword());
        userDaoNew.setRole(RolesEnum.ROLE_USER);
        userDaoNew.setEmail(userOld.getEmail());
        userRepository.save(userDaoNew);
    }

    public void deleteById(UUID id) {
        Optional<UserDao> vendorDao = userRepository.findById(id);
        userRepository.deleteById(id);
    }

    private void validateUser(UserDto dto) {
        userRepository.findByEmail(dto.getEmail())
                .ifPresent((user) -> {
                    throw new UserIsAlreadyExistsException("User with " + user.getEmail() + " is already exists");
                });
    }

    public UserDto loadUserByEmail(String email) {
        return userConverter.daoToDto(userRepository.findByEmail(email).orElseThrow(() ->
                new UserNotFoundException(String.format("User with email %s not exists", email))));
    }

    public List<UserDto> findAll() {
        List<UserDao> users = userRepository.findAllUsers();
        return users.stream()
                .map(userConverter::daoToDto)
                .collect(Collectors.toList());
    }

    public List<UserDto> findUserByEmail(String email) {
        List<UserDao> users = userRepository.findUserByEmail(email);
        return users.stream()
                .map(userConverter::daoToDto)
                .collect(Collectors.toList());
    }
}
