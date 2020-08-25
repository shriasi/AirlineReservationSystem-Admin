	package admin.flightdetailsmanagement.DAO;
	
	import java.sql.Connection;
	import java.sql.DriverManager;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.sql.SQLException;
	import java.util.ArrayList;
	import java.util.List;
	
	import admin.flightdetailsmanagement.model.Flight;
	
	
	public class FlightDAO {
		private String jdbcURL = "jdbc:mysql://localhost:3306/flight_details_?useSSL=false";//establishing database connection
		private String jdbcUsername = "root"; //database user name 
		private String jdbcPassword = ""; //database password
	
		//sql functions statements for insert ,update ,delete and retrieve
		private static final String INSERT_FLIGHTS_SQL = "INSERT INTO flightinfo" + "  (flight_No,from_, to_, arrivetime,departtime,price,type_) VALUES "
				+ " (?, ?, ?, ?, ?, ?, ?);";
	
		private static final String SELECT_FLIGHT_BY_ID = "select id,flight_No,from_,to_,arrivetime,departtime,price,type_ from flightinfo where id =?";
		private static final String SELECT_ALL_FLIGHTS = "select * from flightinfo";
		private static final String DELETE_FLIGHTS_SQL = "delete from flightinfo where id = ?;";
		private static final String UPDATE_FLIGHTS_SQL = "update flightinfo set flight_No = ?, from_ = ?,to_= ?, arrivetime =?, departtime =?, price =?, type_ =? where id = ?;";
	
		public FlightDAO() {
		}
	
		protected Connection getConnection() {
			Connection connection = null;
			try {
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return connection;
		}
	
		//insert flight details function
		public void insertFlight(Flight flight) throws SQLException {
			System.out.println(INSERT_FLIGHTS_SQL);
		
			try (Connection connection = getConnection();
					PreparedStatement preparedStatement = connection.prepareStatement(INSERT_FLIGHTS_SQL)) {
				preparedStatement.setString(1, flight.getFlight_No());
				preparedStatement.setString(2, flight.getFrom_());
				preparedStatement.setString(3, flight.getTo_());
				preparedStatement.setString(4, flight.getArrivetime());
				preparedStatement.setString(5, flight.getDeparttime());
				preparedStatement.setString(6, flight.getPrice());
				preparedStatement.setString(7, flight.getType_());
				
				System.out.println(preparedStatement);
				preparedStatement.executeUpdate();
			} catch (SQLException e) {
				printSQLException(e);
			}
		}
	
		//select flight from id function
		public Flight selectFlight(int id) {
			Flight flight = null;
			// Establishing a Connection
			try (Connection connection = getConnection();
					//Create a statement using connection object
					PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FLIGHT_BY_ID);) {
				preparedStatement.setInt(1, id);
				System.out.println(preparedStatement);
				//Execute the query or update query
				ResultSet rs = preparedStatement.executeQuery();
	
				// Process the ResultSet object.
				while (rs.next()) {
					String flight_No = rs.getString("flight_No");
					String from_ = rs.getString("from_");
					String to_ = rs.getString("to_");
					String arrivetime = rs.getString("arrivetime");
					String departtime = rs.getString("departtime");
					String price = rs.getString("price");
					String type_ = rs.getString("type_");
					flight = new Flight(id, flight_No, from_, to_, arrivetime, departtime, price, type_);
				}
			} catch (SQLException e) {
				printSQLException(e);
			}
			return flight;
		}
	
		//select all flights
		public List<Flight> selectAllFlights() {
			
			List<Flight> flights = new ArrayList<>();
			//Establishing a Connection
			try (Connection connection = getConnection();
	
					//Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_FLIGHTS);) {
				System.out.println(preparedStatement);
				//Execute the query or update query
				ResultSet rs = preparedStatement.executeQuery();
	
				//Process the ResultSet object.
				while (rs.next()) {
					int id = rs.getInt("id");
					String flight_No = rs.getString("flight_No");
					String from_ = rs.getString("from_");
					String to_ = rs.getString("to_");
					String arrivetime = rs.getString("arrivetime");
					String departtime = rs.getString("departtime");
					String price = rs.getString("price");
					String type_ = rs.getString("type_");
					
					flights.add(new Flight(id, flight_No , from_, to_, arrivetime, departtime, price, type_));
				}
			} catch (SQLException e) {
				printSQLException(e);
			}
			return flights;
		}
		/*!-- IT19024882 *  Senevirathna D.M.S */
		//delete flights function
		public boolean deleteFlight(int id) throws SQLException {
			boolean rowDeleted;
			try (Connection connection = getConnection();
					PreparedStatement statement = connection.prepareStatement(DELETE_FLIGHTS_SQL);) {
				statement.setInt(1, id);
				rowDeleted = statement.executeUpdate() > 0;
			}
			return rowDeleted;
		}
	
		//update flight function
		public boolean updateFight(Flight flight) throws SQLException {
			boolean rowUpdated;
			try (Connection connection = getConnection();
				
					PreparedStatement statement = connection.prepareStatement(UPDATE_FLIGHTS_SQL);) {
			    
				statement.setString(1, flight.getFlight_No());
				statement.setString(2, flight.getFrom_());
				statement.setString(3, flight.getTo_());
				statement.setString(4, flight.getArrivetime());
				statement.setString(5, flight. getDeparttime());
				statement.setString(6, flight.getPrice());
				statement.setString(7, flight.getType_());
				statement.setInt(8, flight.getId());
				/*!-- IT19024882 *  Senevirathna D.M.S */
				rowUpdated = statement.executeUpdate() > 0;
			}
			return rowUpdated;
		}
	  //main exception handling
		private void printSQLException(SQLException ex) {
			for (Throwable e : ex) {
				if (e instanceof SQLException) {
					e.printStackTrace(System.err);
					System.err.println("SQLState: " + ((SQLException) e).getSQLState());
					System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
					System.err.println("Message: " + e.getMessage());
					Throwable t = ex.getCause();
					while (t != null) {
						System.out.println("Cause: " + t);
						t = t.getCause();
					}
				}
			}
		}
	}
	/*!-- IT19024882 *  Senevirathna D.M.S */
