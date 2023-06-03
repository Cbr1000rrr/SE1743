<%-- 
    Document   : index.jsp
    Created on : Feb 28, 2023, 10:07:14 AM
    Author     : 84375
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width,initial-scale=1" />
        <title>SHOP</title>
        <link
            rel="stylesheet"
            href="css/user-64-1-4-35b21ab003fc2a365a29bdab4595d57d.css"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
            integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
            crossorigin="anonymous"
            />

    </head>
    <body>
        <header class="header">
            <h1 class="shop-name">
                <a href="FindAllProductServlet"
                   ><img src="images/2112_logo.png" alt="SHOP OFFICIAL SHOP"
                      /></a>
            </h1>

            <form action="FindAllProductServlet">
                <div class="headnav-wrap">

                    <div class="search-wrap">
                        <input
                            type="text"
                            name="txtSearch"
                            data-id="makeshop-search-keyword"
                            value="${param.txtSearch}"
                            class="search-keyword"
                            placeholder="tất cả sản phẩm"
                            aria-label="検索フォー�&nbsp;"
                            />
                        <button type="submit" class="search-btn" > </button>  

                    </div>

                    <ul class="head-btn">
                        <c:choose>
                            <c:when test="${sessionScope.USER != null}">
                                <li class="head-btn-item head-btn-account">
                                    <div class="member-nav-wrap">
                                        <p class="member-name">${sessionScope.USER.fullname}</p>
                                        <ul class="member-nav">
                                            <li class="member-nav-item"><a href="profile.jsp">profile</a></li>
                                            <li class="member-nav-item"><a href="LogoutServlet">logout</a></li>
                                                <c:if test="${sessionScope.USER.role == 1}">
                                                <li class="member-nav-item"><a href="MainController?action=manageProducts">dashboard</a></li>
                                                </c:if>
                                        </ul>
                                    </div>
                                </li>
                            </c:when> 
                            <c:otherwise>
                                <li class="head-btn-item head-btn-dropdown">
                                    <span class="dropdown-switch dropdown-open">Đăng ký thành viên mới</span>
                                </li>
                                <li class="head-btn-item head-btn-signup">
                                    <a href="register.jsp">Đăng ký</a>
                                </li>
                                <li class="head-btn-item head-btn-account">
                                    <a href="login.jsp" class="head-btn-login head-btn-icon">đăng nhập</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                        <li class="head-btn-item head-btn-cart">
                            <a href="cart.jsp" class="head-btn-icon" title="合計金額：0円">giỏ hàng</a>
                        </li>
                    </ul>
                </div>
            </form >
        </header>
        <nav class="nav">
            <ul class="nav-list">
                <li class="nav-item nav-category">
                    <a class="nav-category-switch" href="FindAllProductServlet"
                       >tất cả sản phẩm</a
                    >
                </li>
                <li class="nav-item nav-category">
                    <a class="nav-category-switch" href="FindAllProductServlet"
                       >tìm kiếm theo danh mục</a>
                    <div class="nav-category-wrap">
                        <ul class="nav-category-list">
                            <c:forEach var="cate" items="${sessionScope.cateList}">                     
                                <li class="nav-category-item">
                                    <a href="FindAllProductServlet?category=${cate.cateID}">${cate.cateName}</a>
                                </li>                               
                            </c:forEach>
                        </ul>
                    </div>
                </li>
            </ul>
        </nav>
        <div class="wrap">
            <div class="main-contents">
                <div class="section-head">
                    <h2 class="section-title category-title page-head">
                        <span class="headline">tất cả sản phẩm</span>
                    </h2>
                </div>
                <section class="category-product-list">
                    ${requestScope.MESSAGE}
                    <ul class="product-list">
                        <c:forEach var="p" items="${requestScope.PList}">
                            <li class="product-item instock">
                                <a href="FindOneProductServlet?id=${p.id}">
                                    <figure class="product-item-image-wrap">
                                        <img
                                            src="${p.imgPath}"
                                            alt=""
                                            class="product-item-image"
                                            />
                                    </figure>

                                    <p class="product-item-name">
                                        ${p.name}
                                    </p>

                                    <div class="product-item-price-wrap">
                                        <span class="product-item-price"><fmt:formatNumber type="number" pattern="#,###" value="${p.price}"/> VND</span>
                                    </div>
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                    <ul class="pager">

                        <c:forEach begin="1" end="${requestScope.totalPage}" var="p" >
                            <c:choose>
                                <c:when test="${p == requestScope.page}">
                                    <li class="pager-item"><span class="current">${p}</span></li>
                                    </c:when>
                                    <c:otherwise>
                                    <li class="pager-item"><a href="FindAllProductServlet?page=${p}"><span>${p}</span></a></li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>


                    </ul>




                </section>
            </div>
            <footer class="footer">
                <ul class="footer-list">
                    <li class="footer-item">
                        <a href=""> Giới thiệu về trang web này</a>
                    </li>
                    <li class="footer-item">
                        <a href=""> Hướng dẫn sử dụng</a>
                    </li>
                    <li class="footer-item">
                        <a href=""> Chính sách bảo mật</a>
                    </li>
                    <li class="footer-item">
                        <a href="">điều khoản thành viên</a>
                    </li>
                </ul>
                <div>
                    <p
                        style="
                        color: #ffffff;
                        margin: 30px 10px 10px;
                        font-weight: bold;
                        font-size: 14px;
                        "
                        >
                        Uống rượu bởi những người dưới 20 tuổi bị pháp luật nghiêm cấm.<br />
                        Chúng tôi không bán đồ uống có cồn cho người dưới 20 tuổi.
                    </p>
                </div>
                <div class="logo">
                    <img src="images/2112_logo-WT.png" alt="SHOP OFFICIAL SHOP" />
                </div>
                <p class="copyright">
                    ©2023 CỬA HÀNG CHÍNH THỨC CỦA SHOP Bảo lưu mọi quyền.
                </p>
            </footer>
        </div>

    </body>
</html>
