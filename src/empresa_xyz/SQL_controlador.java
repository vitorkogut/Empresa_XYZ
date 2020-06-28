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
    
        public int retorna_id_cidade(String cidade){
        int id = -1;
        
        try{
           conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/empresa_xyz?useSSL=false", "root","root");
           System.err.println("coneção criada= " + conn);

           Statement stm = ( Statement ) conn.createStatement();
           System.err.println("Statmente criado!");

           ResultSet rs = stm.executeQuery("SELECT id FROM cidade WHERE cidade = '"+ cidade +"'" );
           rs.next();
           return rs.getInt("id");
                   
        }catch(Exception e){
            
        }

        return id;
    }
    
    public boolean insere_cliente(String nome, String email, String rua, String numero, String telefone, int cidade_id, int cidade_estado_id){

        String comando = "INSERT INTO cliente(nome, email, rua, numero, telefone, cidade_id, cidade_estado_id) VALUES ('"+ nome +"', '"+ email +"', '"+ rua +"', '"+ numero +"', '"+ telefone +"', '"+ cidade_id +"', '"+ cidade_estado_id +"')";
        executa_querry(comando);
        return true;

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
    
    
    public ResultSet retorna_status() throws SQLException{
        try{
           conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/empresa_xyz?useSSL=false", "root","root");
           System.err.println("coneção criada= " + conn);

           Statement stm = ( Statement ) conn.createStatement();
           System.err.println("Statmente criado!");

           ResultSet rs = stm.executeQuery("SELECT status FROM status");
           return rs;
                   
        }catch(Exception e){
            
        }
        
        System.out.println("deu ruim");
        return null;
    }
    
    
    public ResultSet retorna_clientes() throws SQLException{
        try{
           conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/empresa_xyz?useSSL=false", "root","root");
           System.err.println("coneção criada= " + conn);

           Statement stm = ( Statement ) conn.createStatement();
           System.err.println("Statmente criado!");

           ResultSet rs = stm.executeQuery("SELECT nome FROM cliente");
           return rs;
                   
        }catch(Exception e){
            
        }
        
        System.out.println("deu ruim");
        return null;
    }
    
    public int retorna_id_cliente(String cliente){
        int id = -1;
        
        try{
           conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/empresa_xyz?useSSL=false", "root","root");
           System.err.println("coneção criada= " + conn);

           Statement stm = ( Statement ) conn.createStatement();
           System.err.println("Statmente criado!");

           ResultSet rs = stm.executeQuery("SELECT id FROM cliente WHERE nome = '"+ cliente +"'" );
           rs.next();
           return rs.getInt("id");
                   
        }catch(Exception e){
            
        }

        return id;
    }
    
    
    public int retorna_id_status(String status){
        int id = -1;
        
        try{
           conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/empresa_xyz?useSSL=false", "root","root");
           System.err.println("coneção criada= " + conn);

           Statement stm = ( Statement ) conn.createStatement();
           System.err.println("Statmente criado!");

           ResultSet rs = stm.executeQuery("SELECT id FROM status WHERE status = '"+ status +"'" );
           rs.next();
           return rs.getInt("id");
                   
        }catch(Exception e){
            
        }

        return id;
    }
    
    public boolean insere_pacote(String data_entrada, String data_entrega, float peso, int largura, int altura, int profundidade, String rua, String numero, int status, int id_cidade, int id_estado, int id_cliente){

        int cliente_cidade_id = 0;
        int cliente_cidade_estado_id = 0;
        
        try{
           conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/empresa_xyz?useSSL=false", "root","root");
           System.err.println("coneção criada= " + conn);

           Statement stm = ( Statement ) conn.createStatement();
           System.err.println("Statmente criado!");

           ResultSet rs = stm.executeQuery("SELECT cidade_id FROM cliente WHERE id = '"+ id_cliente +"'" );
           rs.next();
           cliente_cidade_id = rs.getInt("cidade_id");
                   
        }catch(Exception e){
            
        }
        
        try{
           conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/empresa_xyz?useSSL=false", "root","root");
           System.err.println("coneção criada= " + conn);

           Statement stm = ( Statement ) conn.createStatement();
           System.err.println("Statmente criado!");

           ResultSet rs = stm.executeQuery("SELECT cidade_estado_id FROM cliente WHERE id = '"+ id_cliente +"'" );
           rs.next();
           cliente_cidade_estado_id = rs.getInt("cidade_estado_id");
                   
        }catch(Exception e){
            
        }
        
        
        
        
        String comando = "INSERT INTO pacote(data_entrada, data_entrega, peso, largura, altura, profundidade, rua, numero, status_id, cidade_id, cidade_estado_id, cliente_id, cliente_cidade_id, cliente_cidade_estado_id)"
                + " VALUES ('"+ data_entrada +"', '"+ data_entrega +"', '"+ peso +"', '"+ largura +"', '"+ altura +"', '"+ profundidade +"', '"+ rua +"', '"+ numero +"', '"+ status +"', '"+ id_cidade +"', '"+ id_estado +"', '"+ id_cliente +"', '"+ cliente_cidade_id +"', '"+ cliente_cidade_estado_id +"')";
        executa_querry(comando);
        return true;

    }
        
    
    
    
    
}
