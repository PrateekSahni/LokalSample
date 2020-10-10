<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="bean.Task" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Your own Todo-List</title>
</head>
<body bgcolor="blue">

	<script>
	$(document).ready(function(){
	    // Hide displayed paragraphs
	    $(".hide-btn").click(function(){
	        $("form").hide();
	    });
	    
	    // Show hidden paragraphs
	    $(".show-btn").click(function(){
	        $("form").show();
	    });
	});
	</script>
	
	<h2 align="center">Your simple Todo-List</h2>
	
	<h3 align="center" >Active Tasks</h3>
	<div align="center">
		
		<%
			Date cur = new Date();
			List<Task> tasks = (List<Task>)session.getAttribute("tasks");
			
			int count1 = 0;
			
			if(tasks!=null)
			for(Task temp : tasks)
			{
				if((temp.getExpiry().compareTo(cur))>0)
				{
					count1++;
				}
			}
			
			if(count1>0)
			{
				%>
				<table border="1">
					<tr>
            			<td>Title</td>
            			<td>Details</td>
            			<td>Creation</td>
            			<td>Expiry</td>
         			</tr>
			<%	
			for(Task temp : tasks)
			{
				if((temp.getExpiry().compareTo(cur))>0)
				{
					out.println("<tr>");
					out.println("<td>"+temp.getTitle()+"</td>");
					out.println("<td>"+temp.getDetail()+"</td>");
					out.println("<td>"+temp.getCreated()+"</td>");
					out.println("<td>"+temp.getExpiry()+"</td>");
					out.println("</tr>");
				}
			}
				out.println("</table>");
			}
			else
			{
				out.println("<p>No tasks present!</p>");
			}
		%>
	
	</div>
	<br>
	
	<h3 align="center">Expired Tasks</h3>
	<div align="center">
		<%
		int count = 0;
		
		if(tasks!=null)
		for(Task temp : tasks)
		{
			if((temp.getExpiry().compareTo(cur))<=0)
			{
				count++;
			}
		}
		
		if(count>0)
		{
			%>
			<table border="1">
				<tr>
        			<td>Title</td>
        			<td>Details</td>
        			<td>Creation</td>
            			<td>Expiry</td>
     			</tr>
		<%	
		for(Task temp : tasks)
		{
			if((temp.getExpiry().compareTo(cur))<=0)
			{
				out.println("<tr>");
				out.println("<td>"+temp.getTitle()+"</td>");
				out.println("<td>"+temp.getDetail()+"</td>");
				out.println("<td>"+temp.getCreated()+"</td>");
				out.println("<td>"+temp.getExpiry()+"</td>");
				out.println("</tr>");
			}
		}
			out.println("</table>");
		}
		else
		{
			out.println("<p>No tasks present!</p>");
		}
	%>
	</div>
	
	<br>
	<h3 align="center" >Create your new task here!</h3>
	<br>
	<div align="center">
	
		
    	<button type="button" class="show-btn">Add Task</button>
		<button type="button" class="hide-btn">Hide</button> 
		
		<form id="form1" action = "/LokalAssignment/CreateTask" method="get" style="display:none">
			<p>Title : </p><input type="text" id="title" name="title"/><br><br>
			<p>Details : </p><input type="text" id = "detail" name="detail"/><br><br>
			<p>Duration (Minutes) : </p><input type ="text"  id="duration" name="duration"/><br><br>
			<input type ="submit" value="Submit"/>
			<input type = "reset" value="Clear"/><br><br>
		</form>
	</div>
</body>
</html>