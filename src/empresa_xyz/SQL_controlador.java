/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package empresa_xyz;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author vitor
 */

public class SQL_controlador {
     static  Connection conn = null;
     
     
     
     
    
    public boolean insere_estado(String estado){
   
        String comando = "INSERT INTO estado(estado) VALUES ('"+ estado +"')";
        executa_querry(comando);
        return true;
        
    }
    
    
    
    public boolean executa_querry(String SQL){
        
        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/empresa_xyz?useSSL=false", "root","root");
            System.err.println("coneção criada= " + conn);
            
            Statement stm = ( Statement ) conn.createStatement();
            System.err.println("Statmente criado!");
             
            stm.executeUpdate(SQL);    
            System.out.println("Comando executado!");
            stm.close();
            return true;
            
            
        } catch (SQLException ex) {
            Logger.getLogger(frame_principal.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return false;
    }
    
    public ResultSet retorna_estados() throws SQLException{
        try{
           conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/empresa_xyz?useSSL=false", "root","root");
           System.err.println("coneção criada= " + conn);

           Statement stm = ( Statement ) conn.createStatement();
           System.err.println("Statmente criado!");

           ResultSet rs = stm.executeQuery("SELECT estado FROM estado");
           return rs;
                   
        }catch(Exception e){
            
        }
        
        System.out.println("deu ruim");
        return null;
    }
    
    public int retorna_id_estado(String estado){
        int id = -1;
        
        try{
           conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/empresa_xyz?useSSL=false", "root","root");
           System.err.println("coneção criada= " + conn);

           Statement stm = ( Statement ) conn.createStatement();
           System.err.println("Statmente criado!");

           ResultSet rs = stm.executeQuery("SELECT id FROM estado WHERE estado = '"+ estado +"'" );
           rs.next();
           return rs.getInt("id");
                   
        }catch(Exception e){
            
        }

        return id;
    }
    
    public boolean insere_cidade(String cidade, int estado){

        String comando = "INSERT INTO cidade(cidade, estado_id) VALUES ('"+ cidade +"', '"+ estado +"')";
        executa_querry(comando);
        return true;

    }
    
     public ResultSet retorna_cidades(int estado) throws SQLException{
        try{
           conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/empresa_xyz?useSSL=false", "root","root");
           System.err.println("coneção criada= " + conn);

           Statement stm = ( Statement ) conn.createStatement();
           System.err.println("Statmente criado!");

           ResultSet rs = stm.executeQuery("SELECT cidade FROM cidade WHERE estado_id = '" + estado + "'");
           return rs;
                   
        }catch(Exception e){
            
        }
        
        System.out.println("deu ruim");
        return null;
    }
    
   public ResultSet retorna_cidadess() throws SQLException{
        try{
           conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/empresa_xyz?useSSL=false", "root","root");
           System.err.println("coneção criada= " + conn);

           Statement stm = ( Statement ) conn.createStatement();
           System.err.println("Statmente criado!");

           ResultSet rs = stm.executeQuery("SELECT cidade FROM cidade");
           return rs;
                   
        }catch(Exception e){
            
        }
        
        System.out.println("deu ruim");
        return null;
    }
    
    
    
    
    
    
}
