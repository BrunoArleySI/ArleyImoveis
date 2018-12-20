package Classes;
// Generated 22/09/2018 14:09:28 by Hibernate Tools 4.3.1

import Hibernate.HibernateUtil;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.Session;

/**
 * TipoImovel generated by hbm2java
 */
@Entity
@Table(name = "TipoImovel")
public class TipoImovel implements java.io.Serializable {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int ti_cod;
    @Column
    private String ti_desc;

    public Integer getTi_cod() {
        return ti_cod;
    }

    public void setTi_cod(Integer ti_cod) {
        this.ti_cod = ti_cod;
    }

    public String getTi_desc() {
        return ti_desc;
    }

    public void setTi_desc(String ti_desc) {
        this.ti_desc = ti_desc;
    }

    public TipoImovel() {

    }

    public void cadastra(TipoImovel tipo) {

        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        session.save(tipo);
        session.getTransaction().commit();
    }

}
