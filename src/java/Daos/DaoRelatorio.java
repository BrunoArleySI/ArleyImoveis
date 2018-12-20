package Daos;

import Classes.Imovel;
import Classes.Relatorio;
import Hibernate.HibernateUtil;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;


public class DaoRelatorio {
   
     public void cadastra(Relatorio obj) {

        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session se = sf.openSession();

        Transaction tx = se.beginTransaction();

        se.save(obj);

        tx.commit();

        se.flush();

        se.close();
    }
    
     public void altera(Relatorio obj) {

        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session se = sf.openSession();

        Transaction tx = se.beginTransaction();

        se.update(obj);

        tx.commit();

        se.flush();

        se.close();
    }
      public void deleta(Relatorio obj) {

        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session se = sf.openSession();

        Transaction tx = se.beginTransaction();

        se.delete(obj);

        tx.commit();

        se.flush();

        se.close();
    }
      
      
      public List<Relatorio> listar(){
        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session se = sf.openSession();
        
        try{
            Criteria consulta = se.createCriteria(Relatorio.class);
            List<Relatorio> resultado = consulta.list();
            return(resultado);
        }catch(RuntimeException erro){
            throw erro;
        }finally{
            se.close();
        }
    }
      
      public Relatorio buscar(int cod){
        Relatorio obj = new Relatorio();
        
        for(int i = 0 ; i< listar().size();i++){
            if(cod == listar().get(i).getRel_cod()){
                obj = listar().get(i);
            }
            
        }
        return obj;
    }
    
    
}


