<%-- 
    Document   : cart
    Created on : Jun 23, 2023, 2:59:05 PM
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
                                <c:if test="${sessionScope.USER.role == 1}">
                                    <li class="member-nav-item"><a href="MainController?action=manageProducts">dashboard</a></li>
                                    </c:if>
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
        <p id="ErrorTextMsg" class="errortxt">${requestScope.WARNING}</p>
        <div class="wrap">
            <div class="main-contents">
                <div class="section-head">
                    <h2 class="section-title category-title page-head">
                        <span class="headline">giỏ hàng</span>
                    </h2>
                </div>
                <section class="cart-inner-list">
                    <c:if test="${sessionScope.cart != null}">
                        <ul class="cart-list-head">
                            <li class="cart-list-title cart-list-delete"></li>
                            <li class="cart-list-title cart-list-info">
                                Tên sản phẩm
                            </li>
                            <li class="cart-list-title cart-list-quantity">
                                Số lượng
                            </li>
                            <li class="cart-list-title cart-list-price">
                                giá
                            </li>
                        </ul>
                        <ul class="cart-list">
                            <c:forEach var="p" items="${sessionScope.cart.getCart().values()}">
                                <c:set var="total" value="${total + (p.price * p.quantity)}" />
                                <li class="cart-list-item">
                                    <div class="cart-list-delete cart-list-unit">
                                        <a
                                            href="DeleteCartServlet?pid=${p.id}"
                                            class="btn cart-delete-btn"
                                            >×</a
                                        >
                                    </div>
                                    <div class="cart-list-info cart-list-unit">
                                        <div class="cart-list-wrap">
                                            <div class="cart-list-image">
                                                <a href="FindOneProductServlet?id=${p.id}"
                                                   ><img
                                                        src="${p.imgPath}"
                                                        alt="Bộ công cụ Terra Cognita kỷ niệm 3 năm Arknights"
                                                        /></a>
                                            </div>
                                            <div class="cart-list-detail">
                                                <p class="cart-list-name">
                                                    <a href="FindOneProductServlet?id=${p.id}">
                                                        ${p.name}</a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="cart-list-unit-wrap">
                                        <form action="UpdateCartServlet">
                                            <div class="cart-list-quantity cart-list-unit">
                                                <label
                                                    ><input
                                                        type="number"
                                                        min="1"
                                                        max="20"
                                                        name="quantity"
                                                        data-id="makeshop-common-cart-quantity:000000000642-0-0-0-0"
                                                        value="${p.quantity}"
                                                        name="item-quantity"
                                                        /></label>
                                                <input type="hidden" name="pid" value="${p.id}" />
                                                <button type="submit" class="btn cart-quantity-btn">thay đổi</button>
                                            </div>

                                            <div class="cart-list-price cart-list-unit">
                                                <p class="cart-list-total-price">
                                                    <fmt:formatNumber type="number" pattern="#,###" value="${p.price * p.quantity}"/> VND
                                                </p>
                                                <p class="cart-list-unit-price">
                                                    Đơn giá: <fmt:formatNumber type="number" pattern="#,###" value="${p.price}"/> VND
                                                </p>
                                            </div>
                                        </form>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>

                        <div class="cart-list-foot">
                            <div class="cart-total">
                                <label for=""
                                       >tổng cộng</label
                                >
                                <p class="cart-total-price">
                                    <fmt:formatNumber type="number" pattern="#,###" value="${total}"/> VND
                                </p>
                            </div>
                        </div>
                    </c:if>
                    <c:choose>
                        <c:when test="${sessionScope.cart == null}">

                            <p class="incart-total-item">Bạn không có mặt hàng nào trong giỏ</p>
                            <div class="noitem-btn-wrap"> <a href="FindAllProductServlet" class="btn keep-btn">tiếp tục mua sắm</a> </div>


                        </c:when>
                        <c:when test="${sessionScope.USER == null}">
                            <div class="cart-notice-msg">
                                <p>
                                    Vui lòng<a
                                        href="register.jsp"
                                        > đăng ký </a
                                    >hoặc<a href="login.jsp"
                                            > đăng nhập </a
                                    >để tiến hành thanh toán .
                                </p>
                            </div>
                        </c:when> 
                        <c:otherwise>

                            <div class="checkout-btn-wrap" id="orderBtn" style="display: block;">
                                <a href="SaveShoppingCartServlet" class="btn checkout-btn"
                                   >Tiến hành thanh toán</a
                                >
                                <p class="cart-continue">
                                    <a href="FindAllProductServlet"
                                       >tiếp tục mua sắm</a
                                    >
                                </p>
                            </div>

                        </c:otherwise>
                    </c:choose>




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
