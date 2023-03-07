package org.example;

import org.example.model.Item;
import org.example.model.Person;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

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

            Person person = session.get(Person.class, 1);
            System.out.println("Получили человека: " + person);

            session.getTransaction().commit();

            System.out.println("Сессия закончилась (session.close)");
            //...
            System.out.println("Открываем вторую транзакцию.");
            session = sessionFactory.getCurrentSession();
            session.beginTransaction();

            List<Item> itemList = session.createQuery("SELECT i FROM Item i WHERE i.owner.id=:personId", Item.class)
                    .setParameter("personId",person.getId())
                    .getResultList();

            session.getTransaction().commit();
            System.out.println("Вне второй сессии.");

            System.out.println(itemList);
        } finally {
            session.close();
            sessionFactory.close();
        }

    }
}

