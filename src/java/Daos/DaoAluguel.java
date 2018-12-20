/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Classes.Aluguel;
import Classes.Usuario;
import Hibernate.HibernateUtil;
import java.util.GregorianCalendar;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Bruno Arley
 */
public class DaoAluguel {
    
     public void cadastra(Aluguel obj) {

        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session se = sf.openSession();

        Transaction tx = se.beginTransaction();

        se.save(obj);

        tx.commit();

        se.flush();

        se.close();
    }
    
     public void altera(Aluguel obj) {

        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session se = sf.openSession();

        Transaction tx = se.beginTransaction();

        se.update(obj);

        tx.commit();

        se.flush();

        se.close();
    }
      public void deleta(Aluguel obj) {

        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session se = sf.openSession();

        Transaction tx = se.beginTransaction();

        se.delete(obj);

        tx.commit();

        se.flush();

        se.close();
    }
    
      public List<Aluguel> listar(){
        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session se = sf.openSession();
        
        try{
            Criteria consulta = se.createCriteria(Aluguel.class);
            List<Aluguel> resultado = consulta.list();
            return(resultado);
        }catch(RuntimeException erro){
            throw erro;
        }finally{
            se.close();
        }
    }
      
      
       public Aluguel buscar(int cod){
        Aluguel obj = new Aluguel();
        
        for(int i = 0 ; i< listar().size();i++){
            if(cod == listar().get(i).getAlu_cod()){
                obj.setAlu_cod(cod);
                obj.setAlu_dia_pagamento(listar().get(i).getAlu_dia_pagamento());
                obj.setAlu_end_cod(listar().get(i).getAlu_end_cod());
                obj.setAlu_imo_cod(listar().get(i).getAlu_imo_cod());
                obj.setAlu_inq_cod(listar().get(i).getAlu_inq_cod());
                obj.setAlu_pagamento(listar().get(i).isAlu_pagamento());
                obj.setAlu_preco(listar().get(i).getAlu_preco());
                obj.setAlu_usu_cod(listar().get(i).getAlu_usu_cod());
            }
            
        }
        return obj;
    }
    
      
      public void reseta_aluguel() {
          
         for(int i =0; i < listar().size();i++){
             listar().get(i).setAlu_pagamento(false);
                     }
          
      
      }
}
