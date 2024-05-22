<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Registration</title>
<style type="text/css">
table {
  border-collapse: collapse;
  margin: 0;
  padding: 0; 
  width: 100%;
  table-layout: auto; /* Adjusts column width based on content */
  background: #fefefe;
}

table caption {
  font-size: 1.5em;
  color: black;
}

table thead{
  background:#1976d2;
  border-bottom: none;
  color: #fff;
}

table tr {
  padding: 1em;
}

table tr:nth-child(even) {
  background: #f0f0f0;
}

table tbody tr:hover {
  background: #d9e3e8;
}

table th,
table td {
  padding: 1em;
  text-align: center;
}

table th {
  font-size: .85em;
  letter-spacing: .1em;
  text-transform: uppercase;
}

@media screen and (max-width: 600px) {
  table {
    border: 0;
  }

  table caption {
    font-size: 1.3em;
  }

  table thead th {
    display: none;
  }

  table tr {
    display: block;
  }

  table td {
    display: block;
    text-align: left;
  }

  table td::before {
    content: attr(data-label);
    display: block;
    font-weight: light;
    text-transform: uppercase;
    font-size: 0.7em;
    margin-bottom: 0.6em;
    color: #1976d2;
  }

  table td:last-child {
    border-bottom: 0;
  }
}
#catcaption{
   justify-content:center;
   text-align: center;
   font-family: sans-serif;
   font-size: 1.5em;
   margin-bottom:1em;
   padding:0.3em;
   width:35em;
   height:2em;
   background-color:#1976d2;
   border-radius:20px;
  color: white; 
}
#searchbycat{
justify-content:center;
   text-align: center;
   font-family: sans-serif;
   font-size: 1.1em;
   margin-bottom:1em;
   margin-left:2em;
   padding:0.08em;
   width:15em;
   height:2em;
   float:right;
   border:2px solid #1976d2; 
   border-radius:0.2em;
 
}
/* #searchbycat:focus { */
/* width:15em; */
/*    height:2em; */
/* 	font-size: 16px; */
/* } */
</style>
<script type="text/javascript">
function setDeleteAlert(){
	alert("Are you sure want's to delete Registration?");
}
function setUpdateAlert(){
	alert("Are you sure want's to Update Registration?");
}
function searchByCategory(){
	let cat=document.getElementById("searchbycat").value;
	let xhttp=new XMLHttpRequest();
	xhttp.onreadystatechange=function(){
		 if(this.readyState==4 && this.status==200){
			 document.getElementById("d").innerHTML=this.responseText;
		 }
	};
	xhttp.open("GET","searchByCategory.jsp?category="+cat,true)
	xhttp.send();
}

</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- DataTables CSS -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css">
    <!-- DataTables JS -->
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
</head>
<body>
     <%@include file="admindashboard.jsp"%>
	<div class="col-md-9 mt-3">
     <div class="container-fluid overflow-auto">
        <h2>Registration Table</h2>
        <table id="example" class="display" style="width:100%">
            <thead>
                <tr>
                    <th>Sr.No.</th>
					<th>Name</th>
					<th>Contact</th>
					<th>Address</th>
					<th>Reg. start</th>
					<th>Reg. end</th>
					<th>Amount paid</th>
					<th>Username</th>
					<th>Password</th>
					<th>Category</th>
					<th>Role</th>
					<th>Delete</th>
					<th>Update</th>
                </tr>
            </thead>
            <tbody>
            <%
				RegistrationService regService=new RegistrationServiceImpl();
				List<Object[]> list=regService.getAllRegistration();
				int count=0;
				for (Object []obj:list) {
				%>
                <tr>
					<td data-label="Sr.No."><%=++count%></td>
					<td data-label="Name"><%=obj[1] %></td>
					<td data-label="Contact"><%=obj[2] %></td>
					<td data-label="Address"><%=obj[3]%></td>
					<td data-label="Reg. start"><%=obj[4]%></td>
					<td data-label="Reg. end"><%=obj[5] %></td>
					<td data-label="Amount paid"><%=obj[6]%></td>
					<td data-label="Username"><%=obj[7] %></td>
					<td data-label="Password"><%=obj[8] %></td>
					<td data-label="Category"><%=obj[9]%></td>
					<td data-label="Role"><%=obj[10]%></td>
					<td data-label="Delete"><a href="deleteregistration?rid=<%=obj[0]%>"><img src="images/Trash.webp" alt="delete icon" width="30" height="30" class="rounded-circle" onclick="setDeleteAlert()"></a></td>
					<td data-label="Update"><a href="updateregister?rid=<%=obj[0]%>&name=<%=obj[1]%>&contact=<%=obj[2]%>&address=<%=obj[3]%>&rsdate=<%=obj[4]%>&redate=<%=obj[5]%>&amount=<%=obj[6]%>&username=<%=obj[7]%>&password=<%=obj[8]%>&category=<%=obj[9]%>&rolename=<%=obj[10]%>"><img src="images/edit.webp" alt="update icon" width="30" height="30" class="rounded-circle" onclick="setUpdateAlert()"></a></td>
				</tr>
				<%
				}
				%>
                <!-- Add more rows as needed -->
            </tbody>
            <tfoot>
<!--                 <tr> -->
<!--                     <th>Sr.No.</th> -->
<!-- 					<th>Name</th> -->
<!-- 					<th>Contact</th> -->
<!-- 					<th>Address</th> -->
<!-- 					<th>Reg. start</th> -->
<!-- 					<th>Reg. end</th> -->
<!-- 					<th>Amount paid</th> -->
<!-- 					<th>Username</th> -->
<!-- 					<th>Password</th> -->
<!-- 					<th>Category</th> -->
<!-- 					<th>Role</th> -->
<!-- 					<th>Delete</th> -->
<!-- 					<th>Update</th> -->
<!--                 </tr> -->
            </tfoot>
        </table>
    </div>
    </div>


	</div>
	</div>
    <!-- Initialize DataTables -->
    <script>
        $(document).ready(function() {
            $('#example').DataTable();
        });
    </script>
</body>
</html>