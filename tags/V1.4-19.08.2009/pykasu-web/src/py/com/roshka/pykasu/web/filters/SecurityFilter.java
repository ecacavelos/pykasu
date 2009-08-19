package py.com.roshka.pykasu.web.filters;

import java.io.IOException;
import java.util.Set;

import javax.security.auth.Subject;
import javax.security.auth.callback.CallbackHandler;
import javax.security.auth.login.LoginContext;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jboss.security.SimplePrincipal;
import org.jboss.security.auth.callback.SecurityAssociationHandler;

import py.com.roshka.pykasu.persistence.users.User;
import py.com.roshka.pykasu.web.Globals;

/**
 * 
 * @author Pablo
 * 
 * 
 * @web.filter name = "SecurityFilter"
 * 
 * @web.filter-mapping url-pattern = "*.do"
 * 
 */
public class SecurityFilter implements Filter {
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(SecurityFilter.class);

	public void init(FilterConfig filterConfig) throws ServletException {

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		logger.debug(">>>>>>>>>> Enter in SecurityFilter! <<<<<<<<<<");
		//logger.info(((HttpServletRequest) request).getRequestURI());
		try {
			if ( ((HttpServletRequest) request).getParameter("j_username") != null || 
					((HttpServletRequest) request).getRequestURI().contains("showuserform.do") || 
					((HttpServletRequest) request).getRequestURI().contains("/register.do") ||
					((HttpServletRequest) request).getRequestURI().contains("/registerJuridico.do"))	{
				chain.doFilter(request, response);
			} else {
				
				User userBean = (User) ((HttpServletRequest) request).getSession(false)
				.getAttribute(Globals.LOGIN_USER);
				
				logger.info("user es null? "+(userBean==null));
				logger.info(userBean.getUserName());
				
				SecurityAssociationHandler handler = new SecurityAssociationHandler();
				SimplePrincipal user = new SimplePrincipal(userBean
						.getUserName());
				handler.setSecurityInfo(user, userBean.getPasswordDigest()
						.toCharArray());
				LoginContext loginContext = new LoginContext("PykasuAppPolicy",
						(CallbackHandler) handler);
				loginContext.login();
				Subject subject = loginContext.getSubject();
				Set principals = subject.getPrincipals();
				logger.info("Add Principals to User : " + user);
				principals.add(user);
				logger.info(">>>" + user + " is added to principal");
				logger.info(">>> request:" + request + " response: " + response.toString() );
				chain.doFilter(request, response);
				loginContext.logout();
			}
			logger.debug(">>>>>>>>>> Exit to SecurityFilter! <<<<<<<<<<");			
		} catch (Throwable e) {
			logger.error(e);
			e.printStackTrace();
			
			((HttpServletRequest) request).getSession().setAttribute("errorMessage",e.getMessage());
			
			//RequestDispatcher rd = ((HttpServletRequest) request).getSession().getServletContext().getRequestDispatcher("/index.jsp");
			//rd.forward(request, response);
			((HttpServletResponse) response).sendRedirect("index.jsp");
		}
	}

	public void destroy() {

	}

}
