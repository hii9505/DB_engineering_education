/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.29
 * Generated at: 2019-12-20 15:31:44 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.ArrayList;
import needs.*;

public final class yourRentalPage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("needs");
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.util.ArrayList");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
 
	request.setCharacterEncoding("UTF-8");

      out.write('\n');
      out.write('\n');
 
	User user = (User) session.getAttribute("user");
	ArrayList<Rental> rentals = new ArrayList<Rental>();

	Connection connection = null;

	PreparedStatement pstmt = null;
	String message = (String) request.getAttribute("message");

      out.write('\n');
      out.write('\n');

	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/db_test?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPass = "1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		String sql = "select ISBN, RentStartDate from db_test.books_on_rent where RentMemid like ? order by RentStartDate desc;";
		pstmt = connection.prepareStatement(sql);
		pstmt.setString(1, user.id);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			Rental rental = new Rental();
			rental.isbn = rs.getString(1);
			rental.start = rs.getString(2);
			rentals.add(rental);
		}
	}
	catch (Exception e){
		e.printStackTrace();
	}
	finally {
		if (pstmt != null)
			try{pstmt.close();}catch(SQLException sqle){}
		if (connection != null)
			try{connection.close();}catch(SQLException sqle){}
	}

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("\t<head>\n");
      out.write("\t\t<meta charset=\"UTF-8\" />\n");
      out.write("\t\t<title>Insert title here</title>\n");
      out.write("\t</head>\n");
      out.write("\t<body>\n");
      out.write("\t\t<header>\n");
      out.write("\t\t\t<h1>welcome, ");
      out.print( user.id );
      out.write("</h1>\n");
      out.write("\t\t</header>\n");
      out.write("\t\t<main id=\"yourRental\">\n");
      out.write("\t\t\t<h2>현재 대여 목록</h2>\n");
      out.write("\t\t\t<form action=\"./yourRental.jsp\" method=\"post\">\n");
      out.write("\t\t\t\t<table>\n");
      out.write("\t\t\t\t    <thead>\n");
      out.write("\t\t\t\t        <tr>\n");
      out.write("\t\t\t\t            <th>isbn</th>\n");
      out.write("\t\t\t\t            <th>start</th>\n");
      out.write("\t\t\t\t            <th>return?</th>\n");
      out.write("\t\t\t\t        </tr>\n");
      out.write("\t\t\t\t    </thead>\n");
      out.write("\t\t\t\t    <tbody>\n");
      out.write("\t\t\t\t    \t");
 int j = 1; for (Rental r : rentals) { 
      out.write("\n");
      out.write("\t\t\t\t    \t <tr>\n");
      out.write("\t\t\t\t            <th>");
      out.print( r.isbn );
      out.write("</th>\n");
      out.write("\t\t\t\t            <th>");
      out.print( r.start );
      out.write("</th>\n");
      out.write("\t\t\t\t            <th><input type=\"checkbox\" name=\"return\" value=\"");
      out.print( r.isbn );
      out.write("\" /></th>\n");
      out.write("\t\t\t\t        </tr>\n");
      out.write("\t\t\t\t       ");
 j++;} if (j == 1) { 
      out.write("\n");
      out.write("\t\t\t\t    \t <tr>\n");
      out.write("\t\t\t\t            <th colspan=\"3\">대여한 책이 없습니다.</th>\n");
      out.write("\t\t\t\t        </tr>\n");
      out.write("\t\t\t\t        ");
 } 
      out.write("\n");
      out.write("\t\t\t\t    </tbody>\n");
      out.write("\t\t\t\t</table>\n");
      out.write("\t\t\t\t<p><input type=\"submit\" value=\"바로 가기\" /></p>\n");
      out.write("\t\t\t</form>\n");
      out.write("\t\t</main>\n");
      out.write("\t\t<p>");
      out.print( ((message != null) ? message : "") );
      out.write("</p>\n");
      out.write("\t</body>\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
