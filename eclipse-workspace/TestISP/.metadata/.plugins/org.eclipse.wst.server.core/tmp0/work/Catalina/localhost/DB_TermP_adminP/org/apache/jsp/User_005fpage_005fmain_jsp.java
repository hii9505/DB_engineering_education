/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.29
 * Generated at: 2019-12-23 01:59:32 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.time.LocalTime;
import java.sql.*;
import needs.User;

public final class User_005fpage_005fmain_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.time.LocalTime");
    _jspx_imports_classes.add("needs.User");
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
      response.setContentType("text/html; charset=EUC-KR");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
 request.setCharacterEncoding("euc-kr"); 
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv =\"Content-Type\" content=\"text/html ; charset=EUC-KR\">\r\n");
 
	
	String in_id="";
	String in_pw="";
	boolean isLogined = false;
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if(! (id==null) ){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String result = "";
		try {
			String jdbcUrl = "jdbc:mysql://localhost:3306/termproject";
			String dbId = "root";
			String dbPass = "1234";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
			
			String sql = "SELECT * FROM member WHERE id = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){ //입력된 아이디가 존재 하면
				if(pw.equals(rs.getString("pw"))){
					in_id = id;
					in_pw = pw;
					isLogined = true;
				} else {
					throw new Exception("패스워드가 틀림.");
				}
			} else {
				throw new Exception("등록 되지 않은 아이디");
			}
			
		
		}catch (Exception e){
			e.printStackTrace();
			out.println(e.getMessage());
		} finally{
			if(rs != null) try{rs.close();}catch(SQLException sqle){}
			if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
			if(conn != null) try{conn.close();}catch(SQLException sqle){}
		}
	}


      out.write("\r\n");
      out.write("<title>USER PAGE</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("<hr>\r\n");
      out.write("<h2>로그인 정보</h2>\r\n");
 if( isLogined ){
	
      out.write(" \r\n");
      out.write("\t");
      out.print(in_id );
      out.write(" 님 로그인 하셨습니다.\r\n");
      out.write("\t<button onclick=\"location.href='User_page_main.jsp'\">로그 아웃</button> <hr>\r\n");
      out.write("\t<form>\r\n");
      out.write("\t<input type = \"hidden\" name = \"in_id\" value=");
      out.print(in_id);
      out.write(" >\r\n");
      out.write("\t<input type = \"hidden\" name = \"in_pw\" value=");
      out.print(in_pw);
      out.write(" >\r\n");
      out.write("\t- 회원메뉴 - <br>\r\n");
      out.write("\t<input type=\"submit\" value=\"회원정보 수정\" onclick=\"javascript: form.action='User_page_memDataUpdate.jsp';\">\r\n");
      out.write("\t<input type=\"submit\" value=\"대여도서 조회\" onclick=\"javascript: form.action='User_page_myRental.jsp';\">\r\n");
      out.write("\t<input type=\"submit\" value=\"예약도서 조회\" onclick=\"javascript: form.action='User_page_myReservation.jsp';\">\r\n");
      out.write("\t<input type=\"submit\" value=\"TOP10 조회\" onclick=\"javascript: form.action='User_page_rankPage.jsp';\">\r\n");
      out.write("\t<hr>\r\n");
      out.write("\t<h2>도서 검색</h2>\r\n");
      out.write("\t\tSEARCH BY [<input type=\"radio\" name=\"searchBy\" value=\"ISBN\" checked>ISBN /\r\n");
      out.write("\t\t\t\t   <input type=\"radio\" name=\"searchBy\" value=\"Title\">Title ]<br/>\r\n");
      out.write("\t\t<input type = \"text\" name=\"searchVal\" maxlength = \"40\">\r\n");
      out.write("\t\t<input type=\"submit\" value=\"검색\" onclick=\"javascript: form.action='User_page_bookSearch.jsp';\"> \r\n");
      out.write("\t\t<!--폼 정보 id, searchBy, searchVal  -->\r\n");
      out.write("\t<br>(아무것도 입력하지 않으면 전체 조회)\r\n");
      out.write("\t</form>\r\n");
      out.write("\t");
 
} else {
	
      out.write("\r\n");
      out.write("\t<form>\r\n");
      out.write("\t<input type=\"text\" maxlength=\"40\" name=\"id\" placeholder=\"insert id\"><br>\r\n");
      out.write("\t<input type=\"password\" maxlength=\"40\" name=\"pw\" placeholder=\"insert pw\"><br>\r\n");
      out.write("\t<input type=\"submit\" value = \"LOGIN\" onclick=\"javascript: form.action='User_page_main.jsp';\">\r\n");
      out.write("\t</form>\r\n");
      out.write("\t<button onclick=\"location.href='User_page_signUp.jsp'\">회원 가입</button>\r\n");
      out.write("\t");
	
}

      out.write("\r\n");
      out.write("<hr>\r\n");
      out.write("<button onclick=\"location.href='FRONT_PAGE.jsp'\">(개발자용)FrontPage</button>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
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