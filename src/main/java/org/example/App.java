package org.example;

import jakarta.persistence.Id;
import org.example.model.Item;
import org.example.model.Person;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class App {
    public static void main(String[] args) {
        Configuration configuration = new Configuration()
                .addAnnotatedClass(Person.class)
                .addAnnotatedClass(Item.class);

        SessionFactory sessionFactory = configuration.buildSessionFactory();

        Session session = sessionFactory.getCurrentSession();

        try {
            session.beginTransaction();

            Person person = session.get(Person.class, 4);
            Item item = session.get(Item.class, 1);

            item.getOwner().getItemList().remove(item);
            item.setOwner(person);
            person.getItemList().add(item);

            session.save(item);

            session.getTransaction().commit();
        } finally {
            session.close();
        }

    }
}

