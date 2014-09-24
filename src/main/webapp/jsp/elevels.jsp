

<%@ page contentType="text/html;charset=GB2312" %> 
<%@ page language="java" import="java.sql.*,java.util.*,java.lang.*"%>

<jsp:useBean id = "submitjobBean" scope="page" class="mydb.mysqlcon" />
<jsp:useBean id = "countBean" scope="page" class="mydb.deparsestr" />


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> Eukaryota Genomes Levels </TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/nbf.css" rel="stylesheet" type="text/css">

</HEAD>

<BODY>

<br><br><br>
<TABLE id=main cellSpacing=3 cellPadding=5 width=757 align=center border=0 height="135">
  <TBODY>
  <TR vAlign=top>
    <TD width=77 height="80">&nbsp;</TD>
    <TD width=644 height="80"><font face="Arial, Helvectica, sans-serif" size="6"><b>Groups of Eukaryota <I><U><FONT COLOR="#800000">Genomes</U></I></FONT>  Levels </b></font><BR><br>            
<% java.util.Date date = new java.util.Date(); %>
	<FONT face="Arial, Helvectica, sans-serif" 
      size=2 COLOR="#66CCFF"><B>&nbsp;&nbsp;&nbsp;&nbsp;<%=date%></B></FONT></TD>
  </TR>
  <TR vAlign=top><TD colSpan=2 width="737" height="5">
      <font size="1" color="#FF0000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Location:&nbsp;&nbsp;&nbsp; <a href="index.jsp">Home</a>&nbsp;&nbsp; 
            </font><font size="1">&gt;&gt;&nbsp; <a href="levels.jsp">Genome Levels</a>&nbsp;</font>
	  <font size="1">&gt;&gt;&nbsp; <a href="elevels.jsp">Eukaryota Genomes Levels</a>&nbsp;</font>
      <hr width="80%" color="#008080">
    </TD></TR>

</table>

<br>
<table cellSpacing=3 cellPadding=5 width=537 align=center border=0 >
<FORM action="elevels.jsp" method="post">
<tr><td align=center>
<FONT COLOR="#800000" face="Arial, Helvectica, sans-serif" size="5"><i>Groups of Eukaryota Genomes Levels</I></FONT>
</td></tr>
<tr>
<td align=right><FONT face="Arial, Helvetica, sans-serif" size="2">Select Levels :</font> 
                    <SELECT name=level style="border: 1 solid #0099FF"> size="1">
					          <OPTION selected  
							    value=1>----<OPTION 
                                value=1>1  <OPTION 
                                value=2>2  <OPTION 
                                value=3>3  <OPTION 
                                value=4>4  <OPTION 
								value=5>5  <OPTION 
								value=6>6  <OPTION 
								value=7>7  <OPTION 
								value=8>8  <OPTION
								value=9>9  <OPTION 
								value=10>10  <OPTION 
								value=11>11  <OPTION
								value=12>12  <OPTION
								value=13>13  <OPTION 
								value=14>14  <OPTION 
								value=15>15  <OPTION 
								value=16>16  <OPTION 
								value=17>17  <OPTION 
								value=18>18  <OPTION 
								value=19>19  <OPTION 
								value=20>20  <OPTION 
								value=21>21  <OPTION
								value=22>22  <OPTION
								value=23>23  <OPTION
								value=24>24  <OPTION
								value=25>25  <OPTION
								value=26>26  <OPTION
								value=27>27  <OPTION
								value=28>28  <OPTION
								value=29>29  <OPTION
								value=30>30  <OPTION
								value=31>31  <OPTION
								value=32>32  <OPTION
								value=33>33  <OPTION
								value=34>34  <OPTION
								value=35>35  <OPTION
								value=36>36  <OPTION
								value=37>37  <OPTION
                                value=38>38  </OPTION></SELECT>&nbsp;&nbsp;&nbsp;&nbsp;<INPUT type=submit value=Submit>


</td>
</tr>
</form>
</table>

<%
    
    ResultSet rs1=null;
	String sql1="";

	String level = request.getParameter("level");
	
	if ( (level==null) || (level.equals("----")) )
			{  
				level = "1";
			}
   
   String tab = "elevel" + level;
	  
	ResultSet rs=null;
	String sql = "select * from "+tab+""; 
	rs = submitjobBean.executeQuery(sql);
	rs.last();
    int i = rs.getRow();

	rs.beforeFirst();
    

	%>
 
  

<table cellSpacing=3 cellPadding=5 width=537 align=center border=0 >
  <tr>
    <td  align=right>
	 <FONT face="Arial, Helvetica, sans-serif" size=2>Levels: <FONT COLOR="#FF0000"><B><%=level%></FONT></B></font> &nbsp;&nbsp;&nbsp; 
	 <FONT face="Arial, Helvetica, sans-serif" size=2>Groups: <FONT COLOR="#FF0000"><B><%=i%></B></font></font>
    </td>
  </tr>
</table>
<br><br>

<table cellSpacing=3 cellPadding=5 width=650 align=center border=0 >
  
  <% while (rs.next()) { %>
  <tr>
    <td  align=left width=650>
	 <FONT face="Arial, Helvetica, sans-serif" color=#FF0000>Group <%=rs.getRow()%></font> <br><br>
	 <%
	             
        
                String[] arr = countBean.getArray(rs.getString(1),";");
				for(int j=0;j<countBean.getCount(rs.getString(1),";");j++){ %>  <FONT face="Arial, Helvetica, sans-serif" size=2><I><%=arr[j]%></I></font><br>
				<% 
					for (int p=0;p<=j;p++)

					{ %>&nbsp;&nbsp;&nbsp; <%} } 
 
				String[] arr0 = countBean.getArray(rs.getString(2),";");
				for(int k=0;k<countBean.getCount(rs.getString(2),";");k++){ 
					
					
					    sql1= "select * from genome where serialnum = '"+arr0[k]+"'";
						rs1 = submitjobBean.executeQuery(sql1);
						rs1.first();
					%><FONT face="Arial, Helvetica, sans-serif" size=2><I><A HREF=<%=rs1.getString(6)%>><%=arr0[k]%>.&nbsp;&nbsp;<%=rs1.getString(4)%></A></I></font><br>
				     

				<%
                     submitjobBean.close();
				for (int m=0;m<countBean.getCount(rs.getString(1),";");m++)
					{ %> &nbsp;&nbsp;&nbsp; <%} %>
				
				
				
				<%}%> 
    </td>
	</tr>
	<tr><td>&nbsp;</tr></td>
	<tr><td>&nbsp;</tr></td>

   <% } %>

</table>

  <%  
   submitjobBean.close();
 
  %>


<TABLE id=main cellSpacing=3 cellPadding=5 width=757 align=center border=0 height="20">
  <TR vAlign=top><TD width="737" height="1">
      <hr width="80%" color="#008080">
    </TD></TR>

</table>

<table border="0" width="757" height="2" align="center">
  <tr>
    <td width="100%" height="1" align="center"><FONT 
            face="Arial, Helvetica, sans-serif" size=2>Copyrignt? Bioinformatics Group in SCCAS.</font></td> 
  </tr>
</table>

</body>
</html>
