package Controlador;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.*;
import Modelo.*;
import java.util.UUID;
import javax.servlet.http.HttpSession;


@WebServlet(name = "srvUsuario", urlPatterns = {"/srvUsuario"})
public class srvUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String accion = request.getParameter("accion");
        try{
            if(accion!=null){
                switch(accion){
                    case "verificar": VerificarLogin(request,response); break;
                    case "cerrar": CerrarSesion(request,response); break;
                   case "solicitarRestablecimiento": SolicitarRestablecimiento(request, response); break;
                    case "restablecerContraseña": RestablecerContraseña(request, response); break;
                    default: response.sendRedirect("Login.jsp");
                   }                             
            }else{
               response.sendRedirect("Login.jsp"); //regresa al archivo
            }                
        }catch(Exception ex){
            System.out.println("ERROR.."+ex.getMessage());
        } 
    }//fin processRequest

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void CerrarSesion(HttpServletRequest request, HttpServletResponse response){
        try{
            HttpSession sesion = request.getSession();
            sesion.setAttribute("usuario",null);
            sesion.invalidate();
            response.sendRedirect("Login.jsp");
        }catch(Exception ex){
            System.out.println("ERROR al cerrar sesion..."+ex.getMessage());
       }
    }//fin cerrar sesion
    
    private void VerificarLogin(HttpServletRequest request, HttpServletResponse response){
        try{
            HttpSession sesion;
            UsuarioDAO dao;
            DTOusuario user =  new DTOusuario();
            user.setNombreusuario(request.getParameter("txtusuario"));
            user.setClave(request.getParameter("txtclave"));
            dao = new UsuarioDAO();
            DTOusuario usuario=dao.VerificarUsuario(user);
            if(usuario!=null && usuario.getPerfil().equals("ADMINISTRADOR")){
                sesion = request.getSession();
                sesion.setAttribute("administrador",usuario);
                request.setAttribute("mensaje", "Bienvenido al ventana del admistrador");
                this.getServletConfig().getServletContext().
                        getRequestDispatcher("/Vista/FormAdmin.jsp").forward(request, response);
            }else if(usuario!=null && usuario.getPerfil().equals("OPERARIO")){
                sesion = request.getSession();
                sesion.setAttribute("operario",usuario);
                request.setAttribute("mensaje", "Bienvenido sistema del operario");
                this.getServletConfig().getServletContext().
                        getRequestDispatcher("/Vista/FormOperario.jsp").forward(request, response);
            }else{
                request.setAttribute("mensaje","Credenciales incorrectas...");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }
        }catch(Exception ex){
            System.out.println("ERROR al verificar sesión..."+ex.getMessage());
        }
    }// fin de verificar

  private void SolicitarRestablecimiento(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        // Generar un token único y enviarlo por correo
        String token = generarToken();
        // Lógica para guardar el token y el email en la base de datos
        guardarToken(email, token);
        // Lógica para enviar el correo electrónico
        enviarCorreoRestablecimiento(email, token);
        response.getWriter().write("Se ha enviado un correo con instrucciones para restablecer la contraseña.");
    }

    private void RestablecerContraseña(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String token = request.getParameter("token");
        String nuevaClave = request.getParameter("nuevaClave");
        // Validar el token y actualizar la contraseña del usuario en la base de datos
        if (validarToken(token)) {
            actualizarClaveUsuario(token, nuevaClave);
            response.getWriter().write("Contraseña restablecida exitosamente");
        } else {
            response.getWriter().write("Token inválido o expirado");
        }
    }

   // Métodos adicionales para generar y validar tokens, enviar correos, etc.
    private String generarToken() {
        // Implementar lógica para generar un token único
        return UUID.randomUUID().toString();
    }

    private void guardarToken(String email, String token) {
        // Implementar lógica para guardar el token y el email en la base de datos
    }

    private boolean validarToken(String token) {
        // Implementar lógica para validar el token
        return true;
    }

    private void actualizarClaveUsuario(String token, String nuevaClave) {
        // Implementar lógica para actualizar la contraseña del usuario en la base de datos
    }

    private void enviarCorreoRestablecimiento(String email, String token) {
        // Implementar lógica para enviar el correo electrónico con el enlace de restablecimiento
    }

    
}//fin de la clase

