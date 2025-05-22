<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, com.vahinthan.usedcars.model.Car" %>
<html>
<head>
  <title>🚘 Used Car Quest Board</title>
  <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@500;700&family=Rajdhani:wght@400;600&display=swap" rel="stylesheet">
  <style>
    :root {
      --accent: #00d9ff;
      --danger: #ef4444;
      --safe: #10b981;
      --text-light: #e2e8f0;
    }

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Rajdhani', sans-serif;
      background: linear-gradient(to bottom right, #0f0f1e, #081229, #0a2342);
      color: var(--text-light);
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 40px 20px;
    }

    .container {
      width: 100%;
      max-width: 1200px;
      background: rgba(255, 255, 255, 0.05);
      border-radius: 20px;
      padding: clamp(20px, 5vw, 40px);
      box-shadow: 0 0 30px rgba(0, 217, 255, 0.2);
      backdrop-filter: blur(10px);
    }

    h2 {
      text-align: center;
      font-family: 'Orbitron', sans-serif;
      font-size: clamp(2rem, 5vw, 3rem);
      color: var(--accent);
      margin-bottom: 30px;
      text-shadow: 0 0 5px #00d9ff;
    }

    .car-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: 25px;
    }

    .car-card {
      background: rgba(255, 255, 255, 0.08);
      border: 2px solid #00bcd4;
      border-radius: 15px;
      padding: 20px;
      text-align: center;
      box-shadow: 0 0 20px rgba(0, 188, 212, 0.2);
      transition: transform 0.3s ease;
    }

    .car-card:hover {
      transform: translateY(-6px);
    }

    .car-card h3 {
      font-size: 1.5rem;
      font-weight: 600;
      color: var(--accent);
    }

    .car-card p {
      margin: 10px 0;
      font-size: 1rem;
      color: #cbd5e1;
    }

    a.action {
      display: inline-block;
      margin: 10px 5px 0 5px;
      padding: 10px 18px;
      border-radius: 30px;
      font-weight: bold;
      color: white;
      text-decoration: none;
      transition: all 0.3s ease;
    }

    a.update {
      background: linear-gradient(to right, #00c6ff, #0072ff);
    }

    a.update:hover {
      background: linear-gradient(to right, #0072ff, #00c6ff);
    }

    a.delete {
      background: linear-gradient(to right, #ef4444, #dc2626);
    }

    a.delete:hover {
      background: linear-gradient(to right, #dc2626, #b91c1c);
    }

    a.back-link {
      display: block;
      text-align: center;
      margin-top: 40px;
      color: var(--accent);
      font-weight: bold;
      text-decoration: none;
      font-size: 1rem;
      transition: color 0.3s ease;
    }

    a.back-link:hover {
      color: #67e8f9;
    }

    .no-cars {
      text-align: center;
      font-size: 1.2rem;
      color: #facc15;
    }
  </style>
</head>
<body>
<div class="container">
  <h2>🚘 Car List</h2>
  <div class="car-grid">
    <%
      List<Car> cars = (List<Car>)request.getAttribute("cars");
      if (cars != null && !cars.isEmpty()) {
        for (Car car : cars) {
    %>
    <div class="car-card">
      <h3><%= car.getBrand() %> <%= car.getModel() %></h3>
      <p>Year: <%= car.getYear() %></p>
      <p>Price: $<%= String.format("%.2f", car.getPrice()) %></p>
      <a class="action update" href="updateCar?id=<%= car.getId() %>">Update</a>
      <a class="action delete" href="delete?id=<%= car.getId() %>">Delete</a>
    </div>
    <%
      }
    } else {
    %>
    <p class="no-cars">⚠️ No cars available right now.</p>
    <% } %>
  </div>
  <a class="back-link" href="index.jsp">⬅ Back to Home</a>
</div>
</body>
</html>
