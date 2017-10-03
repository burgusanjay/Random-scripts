<%@ page language="java" import="java.util.*,java.sql.*,com.multibank.db.DbUtil" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
   <title>Multi Banking |Accounts</title>
		<link rel="stylesheet" type="text/css" href="style.css" media="screen" />
		<script type="text/javascript" src="js/jquery.core.js"></script>
		<script type="text/javascript" src="js/jquery.superfish.js"></script>
		<script type="text/javascript" src="js/jquery.jcarousel.pack.js"></script>
		<script type="text/javascript" src="js/jquery.easing.js"></script>
		<script type="text/javascript" src="js/jquery.scripts.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type = "text/javascript">

 function rdoChanged()
    {
	
        var button1 = document.getElementById('r1');
		        var button2 = document.getElementById('r2');
				if(button1.checked){
				document.getElementById('one').style.display='block';
				document.getElementById('three').style.display='none';
				}
				if(button2.checked){
								document.getElementById('one').style.display='none';
								document.getElementById('three').style.display='block';

				}
    }


</script>
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
									<a href="bankadminhome2.jsp"
										title="BankAdmin Home">Home</a>
								</li>
								<li>
									<a href="customers2.jsp" title="List Of Customers">Customers</a>
								</li>
								<li>
									<a class="current" href="accounts2.jsp" title="Requests from Users">Accounts</a>
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
				

				<center>
				select a type of account<br/>
					<input type="radio" name = "acctype" value="currentaccount" id = "r1" onclick="rdoChanged();">CurrentAccount
					<input type="radio" name = "acctype" value="savingaccount" id = "r2" onclick="rdoChanged();">SavingAccount
				</center>
				<br />
				<br>
				<br>
				
				<div  id="one" style="display: none;">
				<center>
				<table border="5">
				<tr>
				<th>Name</th>
				<th>Email</th>
				<th>Phone</th>
				<th>Address</th>
				</tr>
				<%! Connection con = null;%>
				<%
						try {
							String bname = (String) session.getAttribute("bname");
							
							PreparedStatement pst = null;

							con = DbUtil.getCon();

							pst = con
									.prepareStatement("select * from customer where bank = ? and status = ? and acctype = ? ");
							pst.setString(1, bname);
							pst.setString(2, "activated");
							pst.setString(3, "current");
							ResultSet rs = pst.executeQuery();

							while (rs.next()) {
					%>
					<tr>
						<td><%=rs.getString(1) + " " + rs.getString(2)%></td>
						<td><%=rs.getString(5)%></td>
						<td><%=rs.getString(6)%></td>
						<td><%=rs.getString(7)%></td>
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
        </div>
        


        <div  id="three" style="display: none;">
            <form action = "./customerreg" method = "post" onsubmit="return frm2();" name='customer'>
				<center>
				<table border="5">
				<tr>
				<th>Name</th>
				<th>Email</th>
				<th>Phone</th>
				<th>Address</th>
				</tr>
				<%
						try {
							String bname = (String) session.getAttribute("bname");
							Connection con = null;
							PreparedStatement pst = null;

							con = DbUtil.getCon();

							pst = con
									.prepareStatement("select * from customer where bank = ? and status = ? and acctype = ? ");
							pst.setString(1, bname);
							pst.setString(2, "activated");
							pst.setString(3, "saving");
							ResultSet rs = pst.executeQuery();

							while (rs.next()) {
					%>
					<tr>
						<td><%=rs.getString(1) + " " + rs.getString(2)%></td>
						<td><%=rs.getString(5)%></td>
						<td><%=rs.getString(6)%></td>
						<td><%=rs.getString(7)%></td>
					</tr>
					<%
						}
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>
				</table>

				</center>
			</form>
        </div>
        
        
        
        
   
        
        <div class="clear"></div>
        </div>
        

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