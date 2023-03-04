package org.example;

import org.example.model.Person;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.util.List;

public class App {
    public static void main(String[] args) {
        Configuration configuration = new Configuration().addAnnotatedClass(Person.class);

        SessionFactory sessionFactory = configuration.buildSessionFactory();

        Session session = sessionFactory.getCurrentSession();

        try {
            session.beginTransaction();

            int deletedRows = session.createQuery("DELETE FROM Person WHERE age>30").executeUpdate();
            System.out.println(deletedRows);

            session.getTransaction().commit();
        } finally {
            sessionFactory.close();
        }

    }
}

