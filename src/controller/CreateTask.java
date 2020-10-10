package controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Task;

/**
 * Servlet implementation class CreateTask
 */
@WebServlet("/CreateTask")
public class CreateTask extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateTask() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		try
		{
			
			PrintWriter out = response.getWriter();
			String title = request.getParameter("title");
			String detail = request.getParameter("detail");
			int minutes = Integer.parseInt(request.getParameter("duration"));
			
			//Creating task object
			Task task = new Task();
			task.setTitle(title);
			task.setDetail(detail);
			
			
			Date created = new Date();
			task.setCreated(created);
			
			Calendar cal = Calendar.getInstance();
			cal.setTime(created);
			cal.add(Calendar.MINUTE, minutes);
			Date expiry = cal.getTime();
			
			task.setExpiry(expiry);
			
			//Test
			System.out.println(task);
			
			//Adding task
			HttpSession session= request.getSession();
			
			List<Task> tasks;
			
			tasks = (List<Task>)session.getAttribute("tasks");
			
			if(tasks==null)
			{
				tasks = new ArrayList<Task>();
			}
			
			tasks.add(task);
			session.setAttribute("tasks", tasks);
			
			response.sendRedirect("/LokalAssignment/index.jsp");
		}
		catch(Exception e)
		{
			response.getWriter().println("Some unknown error occured.");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
