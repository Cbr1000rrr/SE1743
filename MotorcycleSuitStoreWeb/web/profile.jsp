<%-- 
    Document   : profile
    Created on : Feb 28, 2023, 2:53:13 PM
    Author     : choip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width,initial-scale=1" />
        <title>SHOP</title>
        <link rel="stylesheet" href="css/login.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
              integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
              crossorigin="anonymous" />
    </head>
    <body>
        <div class="wrap">
            <div class="header">
                <a href="FindAllProductServlet">
                    <p>
                        CỬA HÀNG CHÍNH THỨC CỦA SHOP
                    </p>
                </a>
            </div>

            <div class="main">
                <p class="shoplink">
                    <a href="FindAllProductServlet">quay trở lại cửa hàng</a>
                </p>

                <div class="section login">
                    <h2>
                        Sửa thông tin thành viên
                    </h2>

                    <p class="txt01">
                        Để sửa thông tin thành viên, vui lòng nhấn nút "Thay đổi" sau khi nhập thông tin sửa.
                        Vui lòng sử dụng địa chỉ email của bạn làm ID đăng nhập của bạn.
                    </p>
                    <p id="ErrorTextMsg" class="errortxt">${requestScope.MESSAGE}</p>

                    <form name="login_form" action="UpdateAccountServlet" method="post">
                        <table class="loginform">
                            <tbody>
                                <tr>
                                    <th>
                                        email
                                    </th>
                                    <td>
                                        <input type="text" name="txtemail" value="${sessionScope.USER.email}" readonly="" style="ime-mode: disabled" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>    
                                        Tên
                                    </th>
                                    <td>
                                        <input type="text" name="txtfullname" value="${sessionScope.USER.fullname}" style="ime-mode: disabled" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        số điện thoại
                                    </th>
                                    <td>
                                        <input type="number" value="${sessionScope.USER.phone}" name="txtphone" style="ime-mode: disabled" min="0"/>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="btn">
                            <input type="hidden" name="txtpassword" value="${sessionScope.USER.password}" />
                            <input type="submit" value="thay đổi" />
                        </div>
                    </form>
                </div>
            </div>
            <div class="footer"></div>
        </div>
    </body>
</html>
