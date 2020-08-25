	/*!-- IT19024882 *  Senevirathna D.M.S */
	//this is the servelet page
	package admin.flightdetailsmanagement.web;
	
	import java.io.IOException;
	import java.sql.SQLException;
	import java.util.List;
	
	import javax.servlet.RequestDispatcher;
	import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	
	import admin.flightdetailsmanagement.DAO.FlightDAO;
	import admin.flightdetailsmanagement.model.Flight;
	
	
	@WebServlet("/")
	public class FlightServlet extends HttpServlet {
		private static final long serialVersionUID = 1L;
		private FlightDAO flightDAO;
		
		public void init() {
			flightDAO = new FlightDAO();
		}
		/*!-- IT19024882 *  Senevirathna D.M.S */
		protected void doPost(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			doGet(request, response);
		}
	
		protected void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			String action = request.getServletPath();
				//exception handling try catch block
			try {
				switch (action) {
				case "/new":
					showNewForm(request, response);
					break;
				case "/insert":
					insertFlight(request, response);
					break;
				case "/delete":
					deleteFlight(request, response);
					break;
				case "/edit":
					showEditForm(request, response);
					break;
				case "/update":
					updateFlight(request, response);
					break;
				default:
					listFlight(request, response);
					break;
				}
			} catch (SQLException ex) {
				throw new ServletException(ex);
			}
			/*!-- IT19024882 *  Senevirathna D.M.S */
		}
	
		//list flight function request response
		private void listFlight(HttpServletRequest request, HttpServletResponse response)
				throws SQLException, IOException, ServletException {
			List<Flight> listFlight = flightDAO.selectAllFlights();
			request.setAttribute("listFlight", listFlight);
			RequestDispatcher dispatcher = request.getRequestDispatcher("admindashboard.jsp");
			dispatcher.forward(request, response);
		}
	
		//showing the new flight form
		private void showNewForm(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			RequestDispatcher dispatcher = request.getRequestDispatcher("flight-form.jsp");
			dispatcher.forward(request, response);
		}
	
		//show editing flight form
		private void showEditForm(HttpServletRequest request, HttpServletResponse response)
				throws SQLException, ServletException, IOException {
			int id = Integer.parseInt(request.getParameter("id"));
			Flight existingFlight = flightDAO.selectFlight(id);
			RequestDispatcher dispatcher = request.getRequestDispatcher("flight-form.jsp");
			request.setAttribute("flight", existingFlight);
			dispatcher.forward(request, response);
	
		}
	
		//insert flight request response
		private void insertFlight(HttpServletRequest request, HttpServletResponse response) 
				throws SQLException, IOException {
			String flight_No = request.getParameter("flight_No");
			String from_ = request.getParameter("from_");
			String to_ = request.getParameter("to_");
			String arrivetime = request.getParameter("arrivetime");
			String departtime = request.getParameter("departtime");
			String price = request.getParameter("price");
			String type_  = request.getParameter("type_");
			/*!-- IT19024882 *  Senevirathna D.M.S */
			Flight newFlight = new Flight(flight_No, from_, to_, arrivetime, departtime, price, type_);
			flightDAO.insertFlight(newFlight);
			response.sendRedirect("list");
		}
	 //update flight request ,response
		private void updateFlight(HttpServletRequest request, HttpServletResponse response) 
				throws SQLException, IOException {
			int id = Integer.parseInt(request.getParameter("id"));
			String flight_No = request.getParameter("flight_No");
			String from_ = request.getParameter("from_");
			String to_ = request.getParameter("to_");
			String arrivetime = request.getParameter("arrivetime");
			String departtime = request.getParameter("departtime");
			String price = request.getParameter("price");
			String type_  = request.getParameter("type_");
			Flight flight = new Flight(id, flight_No, from_, to_, arrivetime, departtime, price, type_);
			flightDAO.updateFight(flight);
			response.sendRedirect("list");
		}
	 //delete flight request,response
		private void deleteFlight(HttpServletRequest request, HttpServletResponse response) 
				throws SQLException, IOException {
			int id = Integer.parseInt(request.getParameter("id"));
			flightDAO.deleteFlight(id);
			response.sendRedirect("list");
	
		}
		/*!-- IT19024882 *  Senevirathna D.M.S */
	
	}
