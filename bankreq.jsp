<%@ page language="java"
	import="java.util.*,java.sql.*,com.multibank.db.DbUtil"
	pageEncoding="ISO-8859-1"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>Multi Banking |Bankers Requests</title>
		<link rel="stylesheet" type="text/css" href="style.css" media="screen" />
		<script type="text/javascript" src="js/jquery.core.js"></script>
		<script type="text/javascript" src="js/jquery.superfish.js"></script>
		<script type="text/javascript" src="js/jquery.jcarousel.pack.js"></script>
		<script type="text/javascript" src="js/jquery.easing.js"></script>
		<script type="text/javascript" src="js/jquery.scripts.js"></script>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	</head>

	<body>
		<div id="wrap">
			<div class="top_corner"></div>
			<div id="main_container">

				<div id="header">
					<div id="logo">
						<font size="8" color="#996666">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Multi
							Banking Transaction System</font>
					</div>

					<div id="menu">
						<ul>
							<li>
								<a href="adminhome.jsp" title="Admin Home">Home</a>
							</li>
							<li>
								<a class="current" href="bankreq.jsp"
									title="Requests from Bankers">Bankers Requests</a>
							</li>
							<li>
								<a href="userreq.jsp" title="Requests from Users">Users
									Requests</a>
							</li>

							<li>
								<a href="./logout" title="Logout">Logout</a>
							</li>
						</ul>
					</div>


				</div>



			</div>



		</div>
		<!---------------------------------end of middle banner-------------------------------->


		<div class="center_content">
			<center>
				<table border="5">
					<tr>
						<th>
							Name
						</th>
						<th>
							Email Id
						</th>
						<th>
							Bank Name
						</th>
						<th>
							Phone
						</th>
						<th>
							Address
						</th>
						<th>
							Status
						</th>
					</tr>
					<%!Connection con = null;%>
					<%
						try {

							Statement pst = null;

							con = DbUtil.getCon();

							pst = con.createStatement();
							// where status = 'new request'
							ResultSet rs = pst.executeQuery("select * from bankadmin");

							while (rs.next()) {
					%>

					<tr>
						<td><%=rs.getString(1)%></td>
						<td><%=rs.getString(4)%></td>
						<td><%=rs.getString(5)%></td>
						<td><%=rs.getString(6)%></td>
						<td><%=rs.getString(7)%></td>
						<td><%=rs.getString(8)%></td>
						<%
							if (rs.getString(8).equalsIgnoreCase("new request")) {
						%>

						<td>
							<a href="./bankerstatus?t1=<%=rs.getString(4)%>">Accept</a>
						</td>
						<td>
							<a href="./bankerstatusreject?t1=<%=rs.getString(4)%>">Reject</a>
						</td>
						<%
							}
						%>
					</tr>
					<%
						}
						} catch (Exception e) {
							e.printStackTrace();
						}
						finally{
						DbUtil.close(con);
						}
					%>


				</table>
			</center>

			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<div class="footer">
				<div class="copyright">
					Designed by
					</a> |
					<a href="http://www.kresttechnology.com/" target="_blank">Krest
						Technologies</a>
				</div>
			</div>



		</div>
		</div>
	</body>
</html>





