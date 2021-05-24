/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.29
 * Generated at: 2019-12-23 02:00:55 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class User_005fpage_005fbookSearch_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes = null;
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
 request.setCharacterEncoding("euc-kr"); 
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv =\"Content-Type\" content=\"text/html ; charset=EUC-KR\">\r\n");
      out.write("<title>Search Book</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<h2>검색 결과</h2>\r\n");
      out.write("<table width = \"100%\" border = \"1\">\r\n");
      out.write("\t<thead>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td>ISBN</td> <td>TITLE</td> <td>AUTHOR</td> <td>PUBLISHER</td> <td>status</td> <td>MENU</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t</thead>\r\n");
      out.write("\t<tbody>\r\n");
      out.write("\t\t");
 
		String in_id = request.getParameter("in_id");
		String in_pw = request.getParameter("in_pw");
		String searchBy = request.getParameter("searchBy");
		String searchVal = request.getParameter("searchVal");

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs_book = null;
		ResultSet rs_rentStat = null;
		ResultSet rs_reserved = null;
		try {
			String jdbcUrl = "jdbc:mysql://localhost:3306/termproject";
			String dbId = "root";
			String dbPass = "1234";
		
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
			String sql = "";
			if(searchVal.isEmpty()){
				sql = "SELECT * FROM books";
			}
			else {
				if(searchBy.compareTo("ISBN")==0){
					sql = "SELECT * FROM books WHERE isbn ="+searchVal;
				}else {
					sql = "SELECT * FROM books WHERE title like '%"+searchVal+"%'";
				}	
			}
			
			pstmt = conn.prepareStatement(sql);
			rs_book = pstmt.executeQuery();
			while (rs_book.next())
			{
		
      out.write("\t\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td>");
      out.print(rs_book.getInt("isbn") );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td>");
      out.print(rs_book.getString("title") );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td>");
      out.print(rs_book.getString("author") );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td>");
      out.print(rs_book.getString("publisher") );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t");

						sql = "SELECT * FROM books_on_rent WHERE isbn="+rs_book.getInt("isbn");
						pstmt=conn.prepareStatement(sql);
						rs_rentStat = pstmt.executeQuery();
						if(rs_rentStat.next() ){
					
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<td>대여 중 ( ");
      out.print(rs_rentStat.getDate("RentEndDate") );
      out.write(" 까지 )</td>\r\n");
      out.write("\t\t\t\t\t");

						} else {
							sql = "SELECT * FROM rent_reservation WHERE isbn= ? ORDER BY reserve_date LIMIT 1";
							pstmt=conn.prepareStatement(sql);
							pstmt.setInt(1, rs_book.getInt("isbn"));
							rs_reserved = pstmt.executeQuery();
							if(rs_reserved.next()){
								if(in_id.equals(rs_reserved.getString("memid")) ){
									
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>대여 가능</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t");

								} else {
									
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td>예약 중</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t");

								}
							} else {
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>대여 가능</td>\r\n");
      out.write("\t\t\t\t\t\t\t");

							}
						}
					
      out.write("\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t<form name=\"tableDataFrom\" method=\"post\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"hidden\" name=\"isbn\" value= ");
      out.print(rs_book.getInt("isbn") );
      out.write(" >\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"hidden\" name=\"in_id\" value =");
      out.print(in_id );
      out.write(" >\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"hidden\" name=\"in_pw\" value = ");
      out.print(in_pw );
      out.write(" >\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"submit\" value=\"대여\" onclick=\"javascript: form.action='User_page_bookRent.jsp';\"/>\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"submit\" value=\"예약\" onclick=\"javascript: form.action='User_page_bookReservation.jsp';\"/>\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"submit\" value=\"예약확인\" onclick=\"javascript: form.action='User_page_reservationCheck.jsp';\"/>\r\n");
      out.write("\t\t\t\t\t\t</form>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t</tr>\t\t\t\t\r\n");
      out.write("\t\t");
		
			}		
		}catch (Exception e){
			e.printStackTrace(); 
		} finally{
			if(rs_book != null) try{rs_book.close();}catch(SQLException sqle){}
			if(rs_rentStat != null) try{rs_rentStat.close();}catch(SQLException sqle){}
			if(rs_reserved != null) try{rs_reserved.close();}catch(SQLException sqle){}
			if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
			if(conn != null) try{conn.close();}catch(SQLException sqle){}
		}
		
      out.write("\r\n");
      out.write("\t</tbody>\r\n");
      out.write("</table>\r\n");
      out.write("<br>\r\n");
      out.write("<form method=\"post\" action = \"User_page_main.jsp\">\r\n");
      out.write("<input type=\"hidden\" name=\"id\" value =");
      out.print(in_id );
      out.write(" >\r\n");
      out.write("<input type=\"hidden\" name=\"pw\" value = ");
      out.print(in_pw );
      out.write(" >\r\n");
      out.write("<input type=\"submit\" value=\"메인 페이지 돌아가기\">\r\n");
      out.write("</form>\r\n");
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
