/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Classes.Endereco;
import Classes.Imovel;
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
public class DaoImovel {
    
     public void cadastra(Imovel obj) {

        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session se = sf.openSession();

        Transaction tx = se.beginTransaction();

        se.save(obj);

        tx.commit();

        se.flush();

        se.close();
    }
    
     public void altera(Imovel obj) {

        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session se = sf.openSession();

        Transaction tx = se.beginTransaction();

        se.update(obj);

        tx.commit();

        se.flush();

        se.close();
    }
      public void deleta(Imovel obj) {

        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session se = sf.openSession();

        Transaction tx = se.beginTransaction();

        se.delete(obj);

        tx.commit();

        se.flush();

        se.close();
    }
      
      public List<Imovel> listar(){
        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session se = sf.openSession();
        
        try{
            Criteria consulta = se.createCriteria(Imovel.class);
            List<Imovel> resultado = consulta.list();
            return(resultado);
        }catch(RuntimeException erro){
            throw erro;
        }finally{
            se.close();
        }
    }
      
      public Imovel buscar(int cod){
        Imovel obj = new Imovel();
        
        for(int i = 0 ; i< listar().size();i++){
            if(cod == listar().get(i).getImo_cod()){
                obj.setImo_cod(cod);
                obj.setImo_cod_end(listar().get(i).getImo_cod_end());
                obj.setImo_desc(listar().get(i).getImo_desc());
                obj.setImo_tipo_cod(listar().get(i).getImo_tipo_cod());
                obj.setImo_valor(listar().get(i).getImo_valor());
                
               
            }
            
        }
        return obj;
    }
    
    
}
