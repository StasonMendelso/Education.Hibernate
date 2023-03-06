package org.example;

import jakarta.persistence.Id;
import org.example.model.Actor;
import org.example.model.Item;
import org.example.model.Movie;
import org.example.model.Passport;
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
                .addAnnotatedClass(Item.class)
                .addAnnotatedClass(Passport.class)
                .addAnnotatedClass(Movie.class)
                .addAnnotatedClass(Actor.class);

        SessionFactory sessionFactory = configuration.buildSessionFactory();

        Session session = sessionFactory.getCurrentSession();

        try {
            session.beginTransaction();

            Actor actor = session.get(Actor.class, 2);

            Movie movieToRemove = actor.getMovies().get(0);

            movieToRemove.getActors().remove(actor);
            actor.getMovies().remove(movieToRemove);

            session.getTransaction().commit();
        } finally {
            session.close();
            sessionFactory.close();
        }

    }
}

