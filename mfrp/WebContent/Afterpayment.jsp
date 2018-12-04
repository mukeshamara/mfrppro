<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,com.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<style>
       body {
       
              
  background-image:linear-gradient(rgba(0,0,0,0.1),rgba(0,0,0,0.1)),url(image.jpg);

 

       height:100vh;

 

       background-size:cover;

 

       background-position:center;
       
       }
</style>
</head>
<body>

${errmsg2}
${errmsg3}
<h2> Your order no is: ${sessionScope.or_id}</h2>
<br></br>
<h3> The ordered details are:</h3>

<sql:setDataSource driver="com.mysql.jdbc.Driver"

            url="jdbc:mysql://localhost:3306/mfrpproject"

            user="root" password="root"

            var="mysrc"

    />

   



    <sql:query var="stmt" dataSource="${mysrc}">

        select p.book_id,p.book_name,p.Language,p.Delivery_Time,p.Author_Name,p.price,a.quantity_needed from product p join add_to_cart a on(a.book_id=p.book_id) where a.price_per_book>0;

    </sql:query>
    
    <table border='1'>

        <tr>

           <th>Book Id</th><th>Book Name</th><th>Language</th><th>Delivery_Time</th><th>Author Name</th><th>Price of the Book</th><th>Quantity Ordered</th><th>Status</th>

        </tr>

        <c:forEach var="rs" items="${stmt.rows}">
	
            <tr>
				
                

                <td>${rs.book_id}</td>
					
                <td>${rs.book_name}</td>
                
                <td>${rs.Language}</td>
                <td>${rs.Delivery_Time}</td>
                <td>${rs.Author_Name}</td>
                <td>${rs.price}</td>
                <td>${rs.quantity_needed}</td>
               <td> <h3> Ordered </h3></td>
				<td>
				
		<td/>
            </tr>

        </c:forEach>
        
	

    </table>
    <form action="cancel.jsp">
    	<h2> If you want to cancel the ordered books press below icon</h2>
    	<input type="submit" value="Cancel the order"/><br/>
		</form>
  </body>

</html>



</body>
</html>