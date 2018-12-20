/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Classes.Imovel;
import Classes.Inquilino;
import Classes.Usuario;
import Hibernate.HibernateUtil;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Bruno Arley
 */
public class DaoInquilino {
    
     public void cadastra(Inquilino obj) {

        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session se = sf.openSession();

        Transaction tx = se.beginTransaction();

        se.save(obj);

        tx.commit();

        se.flush();

        se.close();
    }
    
     public void altera(Inquilino obj) {

        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session se = sf.openSession();

        Transaction tx = se.beginTransaction();

        se.update(obj);

        tx.commit();

        se.flush();

        se.close();
    }
      public void deleta(Inquilino obj) {

        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session se = sf.openSession();

        Transaction tx = se.beginTransaction();

        se.delete(obj);

        tx.commit();

        se.flush();

        se.close();
    }
    
      public List<Inquilino> listar(){
        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session se = sf.openSession();
        
        try{
            Criteria consulta = se.createCriteria(Inquilino.class);
            List<Inquilino> resultado = consulta.list();
            return(resultado);
        }catch(RuntimeException erro){
            throw erro;
        }finally{
            se.close();
        }
    }
      
      
       public Inquilino buscar(int cod){
        Inquilino obj = new Inquilino();
        
        for(int i = 0 ; i< listar().size();i++){
            if(cod == listar().get(i).getInq_cod()){
                obj.setInq_cod(cod);
                obj.setInq_cpf(listar().get(i).getInq_cpf());
                obj.setInq_email(listar().get(i).getInq_email());
                obj.setInq_idade(listar().get(i).getInq_idade());
                obj.setInq_nome(listar().get(i).getInq_nome());
                
            }
            
        }
        return obj;
    }
      
      
}
