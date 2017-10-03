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

		<title>Multi Banking </title>
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
								<a href="accinfo.jsp"
									title="Account Information">Acc Info</a>
							</li>
							<li>
								<a href="deposit.jsp" title="Amount Deposit">Deposit</a>
							</li>
							<li>
								<a href="balance.jsp" title="Account Balance">Balance</a>
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
					<center>Please enter the valid destination account number</center>
			<br />
			<br>
			<br />
			
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

