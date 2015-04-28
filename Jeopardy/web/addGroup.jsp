<%-- 
    Document   : addGroup
    Created on : Apr 27, 2015, 2:49:32 PM
    Author     : mrquorr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="container">
        <h1>Add new Group!</h1>

      <p class="lead">Please Enter the following information to add a new Group!</p>
      
      <form action="DataControlador?data=AddGroup" method ="POST">
      <div class="form-group">
        <label for="StudentID">Student ID</label>
        <input type="number" class="form-control" id="StudentID" name="studentID" placeholder="Student ID">
      </div>
      <div class="form-group">
        <label for="Name">Name</label>
        <input type="text" class="form-control" id="Name" name="name" placeholder="Password">
      </div>
          <div class="form-group">
        <label for="LastName">Last Name</label>
        <input type="text" class="form-control" id="LastName" name="lName" placeholder="Last Name">
      </div>
      
          <br>
          
      <button type="submit" class="btn btn-default">Submit</button>
    </form>

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    </body>
</html>
