package org.example;

import org.example.model.Person;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class App {
    public static void main(String[] args) {
        Configuration configuration = new Configuration().addAnnotatedClass(Person.class);

        SessionFactory sessionFactory = configuration.buildSessionFactory();

        Session session = sessionFactory.getCurrentSession();

//        try {
//            session.beginTransaction();
//
//            Person person = session.get(Person.class, 2);
//            person.setName("Updated2");
//            session.getTransaction().commit();
//        } finally {
//            session.close();
//        }

//        try {
//            session.beginTransaction();
//
//            Person person = session.get(Person.class, 2);
//            session.delete(person);
//
//            session.getTransaction().commit();
//        } finally {
//            session.close();
//        }

        try {
            session.beginTransaction();

            Person person1 = new Person("Test1", 30);

            session.save(person1);
            int id = (int) session.getIdentifier(person1);
            System.out.println(id);
            System.out.println(person1.getId());

            session.getTransaction().commit();
        } finally {
            session.close();
        }
    }
}

