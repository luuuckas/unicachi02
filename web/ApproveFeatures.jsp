
<%@page import="java.util.ArrayList"%>
<%@page import="models.Features"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
	<head>
            <jsp:include page="Templates/HeadMetaInfo.jsp"/>
            
            <title>Manager Portal</title>
        </head>

	<body style="background-color:black;  background: url('./assets/img/dashboard.jpg'); background-size:cover;">
  	
                <jsp:include page="Templates/AdminHeader.jsp"/>
		
		<div class="row">
			
                <jsp:include page="Templates/ManagerPanel.jsp"/>
                
		<!-- Table -->
		<section class="col-9" style="margin:1%;">
		<table class="table table-inverse table-striped table-bordered table-hover mx-auto table-responsive">
		  <thead>
			<tr>
			  <th>#</th>
			  <th>Detalle</th>
			  <th>Nº Puesto</th>
			  <th>Nº Puesto</th>
                          <th>Nº Puesto</th>
			</tr>
		  </thead>
		  <tbody>
                      
                        <% 
                            ArrayList<Features> fres = (ArrayList<Features>)(application.getAttribute("features"));
                            Features e = fres.get(0);
                            Features b = fres.get(1);
                            Features f = fres.get(2);                        
                        %>
                        <tr>
			  <th scope="row">1</th>
			  <th>Seccion index </th>
                        
                          <td <% if ((e.getNewSeatPitch() != e.getSeatPitch()) && (e.getIsChanged())){out.print("Class = 'bg-success text-white'");}%> >  <input type="number" name="seat_pitch_e" min="29" max="38" placeholder="29-38" disabled value ='${(features[0])["seatPitch"]}'> </td>
			  <td <% if ((b.getNewSeatPitch() != b.getSeatPitch()) && (e.getIsChanged())){out.print("Class = 'bg-success text-white'");}%> >  <input type="number" name="seat_pitch_b" min="30" max="87" placeholder="30-87" disabled value ='${(features[1])["seatPitch"]}'>	</td>			  
			  <td <% if ((f.getNewSeatPitch() != f.getSeatPitch()) && (e.getIsChanged())){out.print("Class = 'bg-success text-white'");}%> >  <input type="number" name="seat_pitch_f" min="42" max="90" placeholder="42-90" disabled value ='${(features[2])["seatPitch"]}'>	</td>
			 </tr>
			<tr>
			  <th scope="row">2</th>
			  <th>Tamaño anuncio</th>
			  <td <% if ((e.getNewSeatWidth() != e.getSeatWidth()) && (e.getIsChanged())){out.print("Class = 'bg-success text-white'");}%> >  <input type="number" name="seat_width_e" min="17" max="20" placeholder="17-20" disabled value ='${(features[0])["seatWidth"]}'>	</td>
			  <td <% if ((b.getNewSeatWidth() != b.getSeatWidth()) && (e.getIsChanged())){out.print("Class = 'bg-success text-white'");}%> >  <input type="number" name="seat_width_b" min="17" max="34" placeholder="17-34" disabled value ='${(features[1])["seatWidth"]}'>	</td>
			  <td <% if ((f.getNewSeatWidth() != f.getSeatWidth()) && (e.getIsChanged())){out.print("Class = 'bg-success text-white'");}%> >  <input type="number" name="seat_width_f" min="18.5" max="35.5" placeholder="18.5-35.5" disabled value ='${(features[2])["seatWidth"]}'>	</td>
			  </tr>
			<tr>
			  <th scope="row">3</th>
			  <th>Tipo de producto</th>				
                          <td <% if ((e.getNewVideoType() != null) && (!e.getNewVideoType().equals(e.getVideoType())) && (e.getIsChanged())){out.print("Class = 'bg-success text-white'");}%> >
				  <select name="video_e" disabled>					  
                                          <option selected hidden value ='${(features[0])["videoType"]}'>${(features[0])["videoType"]}</option>					
					  <option value="None">Ninguna</option>
					  <option value="On-Demand TV">Pollo</option>
					  <option value="Overhead TV">Tecnologia</option>
					  <option value="Portable Device">Ropa</option>					  
					  <option value="Satellite TV">Carne</option>
					  <option value="Seatback TV">Bebidas</option>
				  </select>
			   </td>

			  <td <% if ((b.getNewVideoType() != null) && (!b.getNewVideoType().equals(b.getVideoType())) && (e.getIsChanged())){out.print("Class = 'bg-success text-white'");}%> >
				  <select name="video_e" disabled>					  
                                          <option selected hidden value ='${(features[0])["videoType"]}'>${(features[0])["videoType"]}</option>					
					  <option value="None">Ninguna</option>
					  <option value="On-Demand TV">Pollo</option>
					  <option value="Overhead TV">Tecnologia</option>
					  <option value="Portable Device">Ropa</option>					  
					  <option value="Satellite TV">Carne</option>
					  <option value="Seatback TV">Bebidas</option>
				  </select>
			   </td>

			  <td <% if ((f.getNewVideoType() != null) && (!f.getNewVideoType().equals(f.getVideoType())) && (e.getIsChanged())){out.print("Class = 'bg-success text-white'");}%> >
				  <select name="video_f" disabled>					  
                                          <option selected hidden value ='${(features[0])["videoType"]}'>${(features[0])["videoType"]}</option>					
					  <option value="None">Ninguna</option>
					  <option value="On-Demand TV">Pollo</option>
					  <option value="Overhead TV">Tecnologia</option>
					  <option value="Portable Device">Ropa</option>					  
					  <option value="Satellite TV">Carne</option>
					  <option value="Seatback TV">Bebidas</option>
				  </select>
			   </td>

		   </tr>
			
				<th scope="row">4</th>
				<th>Tipo de Categoria</th>
				<td <% if ((e.getNewSeatType() != null) && (!e.getNewSeatType().equals(e.getSeatType())) && (e.getIsChanged())){out.print("Class = 'bg-success text-white'");}%> >
					  <select name="seat_type_e" disabled>
                                                    <option selected hidden value ='${(features[0])["seatType"]}'>${(features[0])["seatType"]}</option>	                                              
						  <option value="Recliner">Sillón reclinable</option>
						  <option value="Standard">Standard</option>
					  </select>
				
				</td>			

				<td <% if ((b.getNewSeatType() != null) && (!b.getNewSeatType().equals(b.getSeatType())) && (e.getIsChanged())){out.print("Class = 'bg-success text-white'");}%> >
					  <select name="seat_type_b" disabled>
                                                    <option selected hidden value ='${(features[1])["seatType"]}'>${(features[1])["seatType"]}</option>	                                              
						  <option value="Angle Lie Flat">Ángulo plano</option>
						  <option value="Flat Bed">Cama plana</option>
						  <option value="Open Suite">Suite abierta</option>
						  <option value="Recliner">Sillón reclinable</option>
					  </select>
				
				</td>			

				<td <% if ((f.getNewSeatType() != null) && (!f.getNewSeatType().equals(f.getSeatType())) && (e.getIsChanged())){out.print("Class = 'bg-success text-white'");}%> >
					  <select name="seat_type_f" disabled>
                                                    <option selected hidden value ='${(features[2])["seatType"]}'>${(features[2])["seatType"]}</option>	                                              
						  <option value="Closed Suite">Suite cerrada</option>					  
						  <option value="Angle Lie Flat">Ángulo plano</option>
						  <option value="Flat Bed">Cama plana</option>
						  <option value="Open Suite">Suite abierta</option>
						  <option value="Recliner">Sillón reclinable</option>
					  </select>
				
				</td>			
				
			</tr>			
			<tr>
				<th scope="row">5</th>
				<th>Oferta</th>
				<td>
					  <select name="special_food_e" disabled>
						  <option value="No">No</option>
						  <option value="Yes">Si</option>
					  </select>
				</td>
				<td>
					  <select name="special_food_b" disabled>
						  <option value="No">No</option>
						  <option value="Yes">Si</option>
					  </select>

   			    </td>
				<td <% if ((f.getNewSpecialFood() != null) && (!f.getNewSpecialFood().equals(f.getSpecialFood())) && (e.getIsChanged())){out.print("Class = 'bg-success text-white'");}%> >
					  <select name="special_food_f" disabled>
                                                  <option selected hidden value ='${(features[2])["specialFood"]}'>${(features[2])["specialFood"]}</option>	                                              
						  <option value="No">No</option>
						  <option value="Yes">Si</option>
					  </select>
				</td>	
			</tr>
			
			<tr>
				<th scope="row"></th>
				<th scope="row">Precio</th>
				<td <% if ((e.getNewPrice() != e.getPrice()) && (e.getIsChanged())){out.print("Class = 'bg-success text-white'");}%> >
					<div class="input-group">
					<div class="input-group-addon col-1 d-inline">$</div>
					<input type="number" min="10" max="200" placeholder="10-200" name="price_e" disabled value="${(features[0])["price"]}">
					</div>
				</td>
				<td <% if ((b.getNewPrice() != b.getPrice()) && (e.getIsChanged())){out.print("Class = 'bg-success text-white'");}%> >
					<div class="input-group">
					<div class="input-group-addon col-1 d-inline">$</div>
					<input type="number" min="300" max="350" placeholder="300-350" name="price_b" disabled value="${(features[1])["price"]}">
					</div>
				</td>				
				<td <% if ((f.getNewPrice() != f.getPrice()) && (e.getIsChanged())){out.print("Class = 'bg-success text-white'");}%> >
					<div class="input-group">
					<div class="input-group-addon col-1 d-inline">$</div>
					<input type="number" min="1000" max="5000" placeholder="1000-5000" name="price_f" disabled value="${(features[2])["price"]}">
					</div>
				</td>				
			</tr>

			</tbody>
		</table>
                                       
                <%
                    if (Features.isChanged)
                    {
                        out.print("<div style='text-align:right;'>");
                        out.print("<form action='ApproveFeatures.do' method='post'>");
                        out.print("<button class='btn btn-primary flex-row-reverse' id='approve_button' type='submit'>Approve</button>                    </form>                </div>                    ");
                    
                        out.print("		<div style='text-align:right; margin-top:1%;'>");
                        out.print("                    <form action='DisapproveFeatures.do' method='post'>");
                        out.print("                        <button class='btn btn-primary flex-row-reverse' id='reject_button'  style='margin-left:2%;' type='submit'>Reject</button>			                    </form>                </div>		");
                    }
                    else
                    {
                        out.print("<div style='text-align:center;' class='bg-success text-white'>");
                        out.print("No changes to be approved/disapproved.");
                        out.print("</div>");
                    }
                %>                        
                                        
								
		</section>
		
		</div>
                
                <jsp:include page="Templates/Footer.jsp"/>
	
	</body>

	
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
  </body>
</html>