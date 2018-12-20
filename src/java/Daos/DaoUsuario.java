/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Hibernate.HibernateUtil;
import Classes.*;
import java.util.List;
import org.hibernate.Criteria;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Bruno Arley
 */
public class DaoUsuario {

    public void cadastra(Usuario obj) {

        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session se = sf.openSession();

        Transaction tx = se.beginTransaction();

        se.save(obj);

        tx.commit();

        se.flush();

        se.close();
    }
    
     public void altera(Usuario obj) {

        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session se = sf.openSession();

        Transaction tx = se.beginTransaction();

        se.update(obj);

        tx.commit();

        se.flush();

        se.close();
    }
      public void deleta(Usuario obj) {

        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session se = sf.openSession();

        Transaction tx = se.beginTransaction();

        se.delete(obj);

        tx.commit();

        se.flush();

        se.close();
    }
    
    public List<Usuario> listar(){
        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session se = sf.openSession();
        
        try{
            Criteria consulta = se.createCriteria(Usuario.class);
            List<Usuario> resultado = consulta.list();
            return(resultado);
        }catch(RuntimeException erro){
            throw erro;
        }finally{
            se.close();
        }
    }
    
    public Usuario buscar(int cod){
        Usuario usuario = new Usuario();
        
        for(int i = 0 ; i< listar().size();i++){
            if(cod == listar().get(i).getUsu_cod()){
                usuario.setUsu_cod(cod);
                usuario.setUsu_email(listar().get(i).getUsu_email());
                usuario.setUsu_nome(listar().get(i).getUsu_nome());
                usuario.setUsu_senha(listar().get(i).getUsu_senha());
            }
            
        }
        return usuario;
    }
    
    public Usuario buscar_cpf(String cod){
        Usuario usuario = new Usuario();
        
        for(int i = 0 ; i< listar().size();i++){
            if(cod.equals(listar().get(i).getUsu_email())){
                usuario.setUsu_cod(listar().get(i).getUsu_cod());
                usuario.setUsu_email(listar().get(i).getUsu_email());
                usuario.setUsu_nome(listar().get(i).getUsu_nome());
                usuario.setUsu_senha(listar().get(i).getUsu_senha());
            }
            
        }
        return usuario;
    }
    
     public Usuario buscar_email(String cod){
        Usuario usuario = new Usuario();
        
        for(int i = 0 ; i< listar().size();i++){
            if(cod.equals(listar().get(i).getUsu_email())){
                usuario.setUsu_cod(listar().get(i).getUsu_cod());
                usuario.setUsu_email(listar().get(i).getUsu_email());
                usuario.setUsu_nome(listar().get(i).getUsu_nome());
                usuario.setUsu_senha(listar().get(i).getUsu_senha());
            }
            
        }
        return usuario;
    }
    

}
