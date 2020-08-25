	/*!-- IT19024882 *  Senevirathna D.M.S */
	//this is the flight class implementation
	package admin.flightdetailsmanagement.model;
	
	public class Flight {
		
		//variables
		protected int id;
		protected String flight_No;
		protected String from_;
		protected String to_;
		protected String arrivetime;
		protected String departtime;
		protected String price;
		protected String type_;
	
		//flight class constructors
		
	    public Flight(int id, String flight_No, String from_, String to_, String arrivetime, String departtime,
				String price, String type_) {
			super();
			this.id = id;
			this.flight_No = flight_No;
			this.from_ = from_;
			this.to_ = to_;
			this.arrivetime = arrivetime;
			this.departtime = departtime;
			this.price = price;
			this.type_ = type_;
		}

		 public Flight(String flight_No, String from_, String to_, String arrivetime, String departtime, String price,
				String type_) {
			super();
			this.flight_No = flight_No;
			this.from_ = from_;
			this.to_ = to_;
			this.arrivetime = arrivetime;
			this.departtime = departtime;
			this.price = price;
			this.type_ = type_;
		}


		//Flight class getters and setters

		public int getId() {
			return id;
		}


		public void setId(int id) {
			this.id = id;
		}


		public String getFlight_No() {
			return flight_No;
		}


		public void setFlight_No(String flight_No) {
			this.flight_No = flight_No;
		}


		public String getFrom_() {
			return from_;
		}


		public void setFrom_(String from_) {
			this.from_ = from_;
		}


		public String getTo_() {
			return to_;
		}


		public void setTo_(String to_) {
			this.to_ = to_;
		}


		public String getArrivetime() {
			return arrivetime;
		}


		public void setArrivetime(String arrivetime) {
			this.arrivetime = arrivetime;
		}


		public String getDeparttime() {
			return departtime;
		}


		public void setDeparttime(String departtime) {
			this.departtime = departtime;
		}


		public String getPrice() {
			return price;
		}


		public void setPrice(String price) {
			this.price = price;
		}


		public String getType_() {
			return type_;
		}


		public void setType_(String type_) {
			this.type_ = type_;
		}
	
		
		/*!-- IT19024882 *  Senevirathna D.M.S */
		
	}
