<%-- 
    Document   : login
    Created on : Feb 28, 2023, 1:06:03 PM
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
                        đăng nhập
                    </h2>
                    <p class="txt01">
                        Nếu bạn là thành viên, vui lòng đăng nhập bằng địa chỉ email và
                        mật khẩu bạn đã nhập khi đăng ký.
                    </p>
                    <p id="ErrorTextMsg" class="errortxt">${requestScope.MESSAGE}</p>
                    <form name="login_form" action="LoginServlet" method="post">
                        <table class="loginform">
                            <tbody>
                                <tr>
                                    <th>
                                        địa chỉ thư điện tử
                                    </th>
                                    <td>
                                        <input type="text" name="userID" value="" style="ime-mode: disabled"  />
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        mật khẩu
                                    </th>
                                    <td>
                                        <input type="password" name="password" style="ime-mode: disabled"/>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="btn">
                            <input type="submit" value="đăng nhập"  />
                        </div>
                    </form>
                </div>

                <div class="section entry">
                    <h2>
                        Những ai chưa đăng ký thành viên
                    </h2>
                    <p class="txt01">
                        Nếu bạn là người dùng lần đầu, bạn có thể mua sắm thuận tiện
                        bằng cách đăng ký làm thành viên tại đây.
                    </p>
                    <div class="btn">
                        <a href="register.jsp"><input type="button" value="Đăng ký thành viên mới" /></a>
                    </div>
                </div>
            </div>
            <div class="footer"></div>
        </div>
    </body>
</html>
