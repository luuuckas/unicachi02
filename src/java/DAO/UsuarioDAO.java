package DAO;
import Modelo.DTOusuario;
import Persistencia.*;
public class UsuarioDAO extends Conexion{
    public UsuarioDAO(){}
    public DTOusuario VerificarUsuario(DTOusuario user) throws Exception{
        DTOusuario usuario=null;
        String SQL="select * from usuario where nombreusuario=? and clave=?";
        try{
            ps=con.prepareStatement(SQL);
            ps.setString(1, user.getNombreusuario());
            ps.setString(2, user.getClave());
            rs = ps.executeQuery();
            if(rs.next()){
                usuario = new DTOusuario();
                usuario.setIdusuario(rs.getString(1));
                usuario.setNombreusuario(rs.getString(2));
                usuario.setClave(rs.getString(3));
                usuario.setEstado(rs.getBoolean(4));
                usuario.setPerfil(rs.getString(5));
                usuario.setEmail(rs.getString(6));
            }            
        }catch(Exception ex){
            System.out.println("ERROR al recuperar usuario : "+ex);
        }        
        return usuario;
    }//fin del método
}//fin de la clase
