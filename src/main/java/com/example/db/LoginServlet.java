package com.example.db;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String[] roles = request.getParameterValues("role");
        LoginDao dao = new LoginDaoImpl();
        int flag = dao.queryPwd(username, password, roles[0]);
        if (password != null && flag == 1) {
            request.getSession().setAttribute("username", username);
            request.getSession().setAttribute("role", roles[0]);
            if (roles[0].equals("1")) {
                RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
                rd.forward(request, response);
            } else if (roles[0].equals("2")) {
                RequestDispatcher rd = request.getRequestDispatcher("teacher.jsp");
                rd.forward(request, response);
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("student.jsp");
                rd.forward(request, response);
            }
        } else {
            response.sendRedirect("index.jsp");
        }
    }
}