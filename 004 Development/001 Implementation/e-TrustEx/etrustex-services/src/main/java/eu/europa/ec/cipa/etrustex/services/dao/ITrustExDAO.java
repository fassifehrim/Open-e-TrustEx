package eu.europa.ec.cipa.etrustex.services.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.Criterion;

public interface ITrustExDAO<T, PK extends Serializable> {
	
	 /** Persist the newInstance object into database */
    T create(T newInstance);

    /** Retrieve an object that was previously persisted to the database using
     *   the indicated id as primary key
     */
    T read(PK id);

    /** Save changes made to a persistent object.  */
    T update(T transientObject);

    /** Remove an object from persistent storage in the database */
    void delete(T persistentObject);
    
    /**
     * Retrieves a list containing all objects persisted in the database.
     * @return
     * 		a list of all persisted objects
     */
    public List<T> getAll();
    
    /**
     * Checks if the argument is an entity managed by the current persistence context
     * @param object
     * @return
     */
    public boolean isManaged(T object);    
    
    /**
     * Retrieves a list of the objects persisted in the database that satisfy a given criteria.
     * @param criterion
     * @return 
     * 		a list of objects satisfying the given criteria
     */
//    List<T> findByCriteria(Criterion... criterion);
}