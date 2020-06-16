package reindltimea.film.Service;

import reindltimea.film.Exception.ResourceNotFoundException;

import javax.persistence.NoResultException;
import java.util.List;

/** CRUD interface
 *
 * @param <T>
 */
public interface ServiceInterface<T> {
    public T Create(T element) throws Exception;
    public List<T> getAll();
    public T getById(Long id) throws NoResultException;
    public T Update(T element) throws Exception;
    public void Delete(Long id) throws ResourceNotFoundException;
}
