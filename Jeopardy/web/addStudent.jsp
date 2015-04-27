<%-- 
    Document   : addStudent
    Created on : Apr 26, 2015, 9:00:11 PM
    Author     : enriqueohernandez
--%>

<%@include file="/header.jsp" %>

    <div class="container">
        <h1>Add new Student!</h1>

      <p class="lead">Please Enter the following information to add a new Student!</p>
      
      <form action="DataControlador?data=AddStudent" method ="POST">
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

