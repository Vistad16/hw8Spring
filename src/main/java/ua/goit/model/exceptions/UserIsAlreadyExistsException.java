package ua.goit.model.exceptions;

public class UserIsAlreadyExistsException extends RuntimeException{

    public UserIsAlreadyExistsException(String message) {
        super(message);
    }

}
