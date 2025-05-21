<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, com.vahinthan.usedcars.model.Car" %>
<html>
<head>
  <title>Used Car Listings</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&family=Inter:wght@400;600&display=swap" rel="stylesheet">
  <style>
    :root {
      --primary-color: #1e3a8a;
      --secondary-color: #3b82f6;
      --accent-color: #facc15;
      --neutral-color: #f9fafb;
      --text-color: #333;
      --bg-color: #ffffff;
      --card-bg: #ffffff;
    }

    body.dark {
      --primary-color: #93c5fd;
      --secondary-color: #60a5fa;
      --accent-color: #facc15;
      --neutral-color: #1f2937;
      --text-color: #f9fafb;
      --bg-color: #111827;
      --card-bg: #1e293b;
    }

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Inter', sans-serif;
      background: var(--bg-color);
      color: var(--text-color);
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      transition: background 0.3s ease, color 0.3s ease;
    }

    .container {
      max-width: 1200px;
      margin: 20px;
      padding: clamp(20px, 5vw, 40px);
      background: rgba(255, 255, 255, 0.95);
      background-color: var(--card-bg);
      border-radius: 15px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
      backdrop-filter: blur(10px);
      transition: background-color 0.3s ease;
    }

    h2 {
      font-family: 'Poppins', sans-serif;
      text-align: center;
      color: var(--primary-color);
      font-size: clamp(1.8rem, 5vw, 2.5rem);
      font-weight: 700;
      margin-bottom: 30px;
    }

    .theme-toggle {
      text-align: center;
      margin-bottom: 20px;
    }

    .theme-toggle button {
      background: var(--accent-color);
      border: none;
      color: var(--bg-color);
      font-weight: bold;
      padding: 10px 20px;
      border-radius: 20px;
      cursor: pointer;
      transition: background 0.3s ease;
    }

    .car-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: 20px;
    }

    .car-card {
      background: var(--card-bg);
      border-radius: 10px;
      padding: 20px;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
      text-align: center;
      transition: transform 0.3s ease, box-shadow 0.3s ease, background-color 0.3s ease;
    }

    .car-card h3 {
      font-family: 'Poppins', sans-serif;
      font-size: 1.5em;
      font-weight: 600;
      color: var(--primary-color);
    }

    .car-card p {
      color: var(--text-color);
    }

    a.action {
      display: inline-block;
      color: #fff;
      background: linear-gradient(90deg, #dc2626, #ef4444);
      text-decoration: none;
      font-weight: 600;
      padding: 8px 16px;
      border-radius: 50px;
      margin-top: 10px;
      transition: transform 0.3s ease;
    }

    .no-cars {
      font-size: 1.2em;
      text-align: center;
    }

    a.back-link {
      display: block;
      text-align: center;
      margin-top: 30px;
      color: var(--primary-color);
      font-weight: 600;
      text-decoration: none;
    }

    @media (prefers-reduced-motion: reduce) {
      .car-card, a.action, a.back-link {
        transition: none;
      }
    }
  </style>
  <script>
    function toggleTheme() {
      const body = document.body;
      body.classList.toggle('dark');
      localStorage.setItem('theme', body.classList.contains('dark') ? 'dark' : 'light');
    }

    window.addEventListener('DOMContentLoaded', () => {
      if (localStorage.getItem('theme') === 'dark') {
        document.body.classList.add('dark');
      }
    });
  </script>
</head>
<body>
<div class="container">
  <div class="theme-toggle">
    <button onclick="toggleTheme()">Toggle Dark Mode</button>
  </div>
  <h2>Used Car Listings</h2>
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
      <a class="action" style="background: linear-gradient(90deg, #16a34a, #22c55e); margin-right: 8px;"
         href="updateCar?id=<%= car.getId() %>">Update</a>
      <a class="action" href="delete?id=<%= car.getId() %>">Delete</a>
    </div>
    <%      }
    } else { %>
    <p class="no-cars">No cars listed yet.</p>
    <% } %>
  </div>
  <a class="back-link" href="index.jsp">⬅ Back to Home</a>
</div>
</body>
</html>