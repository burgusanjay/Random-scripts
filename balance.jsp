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

		<title>Multi Banking |Acc Balance</title>
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
		<%
			String uname = (String) session.getAttribute("uname");
		%>
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
								<a href="customerhome.jsp" title="Customer Home">Home</a>
							</li>

							<li>
								<a href="accinfo.jsp" title="Account Information">Account Info</a>
							</li>
							<li>
								<a href="deposit.jsp" title="Amount Deposit">Deposit</a>
							</li>
							<li>
								<a class="current" href="balance.jsp" title="Account Balance">Balance</a>
							</li>
							<li>
								<a href="transfer.jsp" title="Amount Transfer">Transfer</a>
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
		<br />
		<br>
		<br />
		<br>

		<div class="center_content">
			<font size='6' color='#8B008B'><center>
					Welcome Mr/Ms.
					<%=uname%></center> </font>
			<br />
			<br>
			<br />

			<center>
				<table border="5">
					<tr>
						<th>
							Acc Number
						</th>
						<th>
							Balance
						</th>
					</tr>
					<%!Connection con = null; %>
					<%
						try {
							//String bname = (String) session.getAttribute("bname");
							
							PreparedStatement pst = null;
							PreparedStatement pst1 = null;
							String no = null;

							con = DbUtil.getCon();
							pst1 = con
									.prepareStatement("select * from customer where uname = ?");
							pst1.setString(1, uname);
							ResultSet rs1 = pst1.executeQuery();
							if(rs1.next()){
							no = rs1.getString(11);
							}
							pst = con
									.prepareStatement("select * from deposit where accno = ? ");
							pst.setString(1, no);
							ResultSet rs = pst.executeQuery();

							while (rs.next()) {
					%>
					<tr>
						<td><%=rs.getString(1)%></td>
						<td><%=rs.getString(2)%></td>

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
			<br>
			<br>
			<br />
			<br>
			<br />
			<br>
			<br />
			<br>
			<br />
			<br>
			<br />
			<br>
			<br />
			<br>
			<br />
			<br>
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

