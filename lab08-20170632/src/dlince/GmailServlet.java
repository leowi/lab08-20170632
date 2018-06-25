 package dlince;

import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;


@SuppressWarnings("serial")
public class GmailServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)throws IOException {
		UserService us = UserServiceFactory.getUserService();
		if(us.getCurrentUser() == null)
			resp.sendRedirect(us.createLoginURL(req.getRequestURI()));
		else{
			resp.sendRedirect("/users/index");
		}
	 
	}
}