<%@ page contentType="text/html;charset=GB2312" %>
<%@ page language="java" import="java.sql.*,java.lang.*"%>

<jsp:useBean id = "submitjobBean" scope="page" class="mydb.mysqlcon" />
<jsp:useBean id = "countBean" scope="page" class="mydb.deparsestr" />

<%
    String cancer = request.getParameter("cancer");
    ResultSet rscancers = null;
    String sqlcancers = "select * from TCGA_cancers where cancer = '"+cancer+"'";
    rscancers = submitjobBean.executeQuery(sqlcancers);
    String detail = "";
    if (rscancers.next())
    {
        detail = rscancers.getString(2);
    }
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
                ResultSet rs = null;
                String sql = "select * from run_10aa_10AA where cancer = '"+cancer+"'";
                rs = submitjobBean.executeQuery(sql);

            %>

            <table class="table table-condensed" id="singlecancer-list">
                <thead>
                <tr class="categorized">
                    <th colspan="4" class="category-3">

                    </th>
                    <th colspan="5" class="category-1">
                        Mutation 1
                    </th>
                    <th colspan="5" class="category-2">
                        Mutation 2
                    </th>
                </tr>
                <tr class="categorized">
                    <th class="category-item-3">
                        ID
                    </th>
                    <th class="category-item-3">
                        pdbid
                    </th>
                    <th class="category-item-3">
                        sdis
                    </th>
                    <th class="category-item-3">
                        ld
                    </th>
                    <th class="category-item-1">
                        gene
                    </th>
                    <%--<th class="category-item-1">--%>
                    <%--pdbcon--%>
                    <%--</th>--%>
                    <th class="category-item-1">
                        aac
                    </th>
                    <th class="category-item-1">
                        type
                    </th>
                    <th class="category-item-1">
                        chain
                    </th>
                    <th class="category-item-1">
                        domain
                    </th>
                    <th class="category-item-2">
                        gene
                    </th>
                    <%--<th class="category-item-2">--%>
                    <%--pdbcon--%>
                    <%--</th>--%>
                    <th class="category-item-2">
                        aac
                    </th>
                    <th class="category-item-2">
                        type
                    </th>
                    <th class="category-item-2">
                        chain
                    </th>
                    <th class="category-item-2">
                        domain
                    </th>
                </tr>
                </thead>

                <% while(rs.next()) { %>

                <tr class="categorized">
                    <td class="category-item-3"><%=rs.getString(18)%></td>
                    <td class="category-item-3"><%=rs.getString(13)%></td>
                    <td class="category-item-3"><%=rs.getString(14)%></td>
                    <td class="category-item-3"><%=rs.getString(15)%></td>
                    <td class="category-item-1"><%=rs.getString(1)%></td>
                    <%--<td class="category-item-1"><%=rs.getString(2)%></td>--%>
                    <td class="category-item-1"><%=rs.getString(3)%></td>
                    <td class="category-item-1"><%=rs.getString(4)%></td>
                    <td class="category-item-1"><%=rs.getString(5)%></td>
                    <td class="category-item-1"><%=rs.getString(6)%></td>
                    <td class="category-item-2"><%=rs.getString(7)%></td>
                    <%--<td class="category-item-2"><%=rs.getString(8)%></td>--%>
                    <td class="category-item-2"><%=rs.getString(9)%></td>
                    <td class="category-item-2"><%=rs.getString(10)%></td>
                    <td class="category-item-2"><%=rs.getString(11)%></td>
                    <td class="category-item-2"><%=rs.getString(12)%></td>
                </tr>

                <% }
                    submitjobBean.close();
                %>

            </table>
        </div><!-- /content -->


    </div><!-- /row -->

    <div class="row">
        <%@include file="/jsp/includes/footer.html"%>
    </div> <!-- /row -->

</div> <!-- /container -->

<%@include file="/jsp/includes/js-libs.jsp"%>

</body>
</html>


