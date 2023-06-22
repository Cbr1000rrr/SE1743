<%-- 
    Document   : createProduct
    Created on : Jun 22, 2023, 4:02:17 PM
    Author     : 84375
--%>

<%@page import="dal.CategoryDAO"%>
<%@page import="model.Categorie"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <c:import url="header.jsp"></c:import>         
            </header>
            <section class="right">


                <form action="MainController" method="post"  enctype="multipart/form-data" class="form">
                    <h1> create product </h1>
                    <table class="table2">
                        <tr>
                            <td> Name</td>
                            <td><input type="text" name="name"  required="" /> </td>
                        </tr>
                        <tr>
                            <td>Price</td>
                            <td><input type="number" name="price"  required="" min="0"/> </td>
                        </tr>
                        <tr>
                            <td>image</td>
                            <td><input type="file" name="file" size="60" accept="image/*" required=""/></td>
                        </tr>
                        <tr>
                            <td>description</td>
                            <td>
                                <textarea style="width: 222px;height: 61px;" id="id" name="description" required="" rows="5" cols="10"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>Status</td>
                            <td><select name="status">
                                    <option value="1">available</option>
                                    <option value="0">out of stock</option>
                                </select></td>
                        </tr>
                        <tr>
                            <td>Category</td>
                            <td>   
                                <select name="cateid" >
                                <% List<Categorie> list = CategoryDAO.getCategories("");
                                    for (Categorie cate : list) {
                                %>

                                <option value="<%=cate.getCateID()%>"><%=cate.getCateName()%></option>

                                <%
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="1"></td>
                        <td><input type="submit" value="createProduct" name="action"></td>
                    </tr>
                </table>

            </form> 


        </section>
        <footer>
            <c:import url="footer.jsp"></c:import>
        </footer>
    </body>
</html>
