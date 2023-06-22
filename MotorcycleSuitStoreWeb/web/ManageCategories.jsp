<%-- 
    Document   : ManageCategories
    Created on : Feb 25, 2023, 6:22:45 PM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="static/mycss.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <header>
            <c:import url="header.jsp"></c:import>
            </header>
            <section class="right">
                <form action="MainController" method="get">
                    <input type="text" name="txtSearch" value="${param.txtSearch}" />
                <input type="submit" value="searchCategory" name="action">
            </form>
            <h1></h1>

            <table border="1" class="order" >
                <thead>
                    <tr>
                        <th>Category ID</th>
                        <th>Category Name</th>
                        <th>action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="cate" items="${requestScope.categoryList}">
                    <form action="MainController">
                        <tr>
                            <td>${cate.cateID}</td>
                            <td><input type="text" name="cateName" value="${cate.cateName}" required="" /> </td>
                            <td>
                                <input type="hidden" name="txtSearch" value="${param.txtSearch}" />
                                <input type="hidden" name="cateID" value="${cate.cateID}" />
                                <input type="submit" value="updateCategory" name="action" />
                            </td>
                        </tr>
                    </form>
                </c:forEach>
                </tbody>
            </table>

            <c:if test="${empty requestScope.categoryList}">
                <p>don't have any category</p>
            </c:if>
            <form action="MainController">
                Category name <input type="text" name="cateName" required=""/>
                <input type="submit" value="createCategory" name="action" />
            </form>
        </section>
        <footer>
            <c:import url="footer.jsp"></c:import>
        </footer>
    </body>
</html>
