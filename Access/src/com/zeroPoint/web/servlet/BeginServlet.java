package com.zeroPoint.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zeroPoint.service.GameService;
import com.zeroPoint.user.domain.Game;

public class BeginServlet extends HttpServlet {

	public BeginServlet() {
		super();
	}
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	public void init() throws ServletException {
		GameService gameService = new GameService();
		Game game = gameService.find();
		ServletContext application = getServletContext();
		application.setAttribute("gameInfo", game);
		
	}

}
