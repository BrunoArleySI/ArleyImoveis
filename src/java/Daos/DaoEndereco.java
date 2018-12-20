/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Classes.Aluguel;
import Classes.Endereco;
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
public class DaoEndereco {
    
     public void cadastra(Endereco obj) {

        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session se = sf.openSession();

        Transaction tx = se.beginTransaction();

        se.save(obj);

        tx.commit();

        se.flush();

        se.close();
    }
    
     public void altera(Endereco obj) {

        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session se = sf.openSession();

        Transaction tx = se.beginTransaction();

        se.update(obj);

        tx.commit();

        se.flush();

        se.close();
    }
      public void deleta(Endereco obj) {

        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session se = sf.openSession();

        Transaction tx = se.beginTransaction();

        se.delete(obj);

        tx.commit();

        se.flush();

        se.close();
    }
    
      
      public List<Endereco> listar(){
        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session se = sf.openSession();
        
        try{
            Criteria consulta = se.createCriteria(Endereco.class);
            List<Endereco> resultado = consulta.list();
            return(resultado);
        }catch(RuntimeException erro){
            throw erro;
        }finally{
            se.close();
        }
    }
      
      public Endereco buscar(int cod){
        Endereco obj = new Endereco();
        
        for(int i = 0 ; i< listar().size();i++){
            if(cod == listar().get(i).getEnd_cod()){
                obj.setEnd_cod(cod);
                obj.setEnd_cep(listar().get(i).getEnd_cep());
                obj.setEnd_cidade(listar().get(i).getEnd_cidade());
                obj.setEnd_estado(listar().get(i).getEnd_estado());
                obj.setEnd_bairro(listar().get(i).getEnd_bairro());
                obj.setEnd_numero(listar().get(i).getEnd_numero());
                obj.setEnd_rua(listar().get(i).getEnd_rua());
                
            }
            
        }
        return obj;
    }
    
      
      
}
