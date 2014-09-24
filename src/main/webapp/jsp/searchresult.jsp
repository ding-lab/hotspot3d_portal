<%@ page contentType="text/html;charset=GB2312" %>
<%@ page language="java" import="java.sql.*,java.util.*,java.lang.*"%>

<jsp:useBean id = "submitjobBean" scope="page" class="mydb.mysqlcon" />
<jsp:useBean id = "countBean" scope="page" class="mydb.deparsestr" />

<%
    String cancer = request.getParameter("cancers");
    String interaction = request.getParameter("interaction");
    String gene = request.getParameter("gene");
    String sdis = request.getParameter("sdis");
    String pvalue = request.getParameter("pvalue");

    int interactiond = Integer.valueOf(interaction).intValue();

    float sdisf = 0;
    try
    {
        sdisf = Float.parseFloat(sdis);
    }catch(Exception e){}

    ResultSet rs = null;

    String sql = "";

    if (cancer.equals("all"))
    {
        sql = "select * from run_10aa_10AA where (gene1 = '"+gene+"' OR gene2 = '"+gene+"') AND interaction = '"+interactiond+"' AND sdis <= '"+sdisf+"'";
    }
    else
    {
        sql = "select * from run_10aa_10AA where cancer = '"+cancer+"' AND (gene1 = '"+gene+"' OR gene2 = '"+gene+"') AND interaction = '"+interactiond+"' and  sdis <= '"+sdisf+"'";
    }

    rs = submitjobBean.executeQuery(sql);

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Hotspot 3D: Visualize Protein Mutations</title>
    <%@include file="/jsp/includes/html-header.jsp"%>
</head>

<body class="sub">

<div class="container">
    <div class="row">
        <%@include file="/jsp/includes/page-header.jsp"%>
    </div>
    <div class="row">
        <%@include file="/jsp/includes/main-menu.jsp"%>
    </div>
    <div class="row">
        <div class="col-lg-12 col-sm-12 content">

            <%
                if (rs == null || !rs.first())
                {
            %>

            <p align="center"><font size="3" color=#FF3300><font size="2"><I> Sorry , no record !</I></font> </p>

            <%

            }
            else
            {

            %>

            <table class="table table-condensed" id="search-results">
                <thead>
                <tr>
                    <th>col</th>
                    <th>col</th>
                    <th>col</th>
                    <th>col</th>
                    <th>col</th>
                    <th>col</th>
                    <th>col</th>
                    <th>col</th>
                    <th>col</th>
                    <th>col</th>
                    <th>col</th>
                    <th>col</th>
                    <th>col</th>
                    <th>col</th>
                    <th>col</th>
                    <th>col</th>
                </tr>
                </thead>
                <tbody>
                <% while(rs.next()) { %>
                <tr>
                    <td><%=rs.getString(18)%></td>
                    <td><%=rs.getString(13)%></td>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getString(5)%></td>
                    <td><%=rs.getString(6)%></td>
                    <td><%=rs.getString(7)%></td>
                    <td><%=rs.getString(8)%></td>
                    <td><%=rs.getString(9)%></td>
                    <td><%=rs.getString(10)%></td>
                    <td><%=rs.getString(11)%></td>
                    <td><%=rs.getString(12)%></td>
                    <td><%=rs.getString(14)%></td>
                    <td><%=rs.getString(15)%></td>
                </tr>
                <% } %>
                </tbody>
            </table>
            <% }
                submitjobBean.close();
            %>
        </div><!-- /content -->


    </div><!-- /row -->

    <div class="row">
        <%@include file="/jsp/includes/footer.html"%>
    </div> <!-- /row -->

</div> <!-- /container -->

<%@include file="/jsp/includes/js-libs.jsp"%>

</body>
</html>
