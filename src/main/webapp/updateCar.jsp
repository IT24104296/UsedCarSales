<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>🛠️ Update Car - Quest Log</title>
  <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@500;700&family=Rajdhani:wght@400;600&display=swap" rel="stylesheet">
  <style>
    body {
      margin: 0;
      padding: 0;
      background: linear-gradient(to bottom right, #0f0f1e, #081229, #0a2342);
      font-family: 'Rajdhani', sans-serif;
      color: #f8fafc;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .quest-container {
      background: rgba(255, 255, 255, 0.05);
      border: 2px solid #00bcd4;
      border-radius: 20px;
      padding: 40px;
      width: 90%;
      max-width: 500px;
      box-shadow: 0 0 25px rgba(0, 188, 212, 0.3);
      backdrop-filter: blur(15px);
    }

    h2 {
      text-align: center;
      font-family: 'Orbitron', sans-serif;
      font-size: 2rem;
      color: #00d9ff;
      margin-bottom: 30px;
    }

    label {
      display: block;
      margin-top: 15px;
      font-size: 1.1rem;
      color: #cbd5e1;
    }

    input[type="text"],
    input[type="number"] {
      width: 100%;
      padding: 10px 15px;
      margin-top: 8px;
      border-radius: 10px;
      border: 1px solid #00bcd4;
      background-color: rgba(255, 255, 255, 0.05);
      color: #f1f5f9;
      font-size: 1rem;
      transition: box-shadow 0.3s;
    }

    input[type="text"]:focus,
    input[type="number"]:focus {
      outline: none;
      box-shadow: 0 0 10px #00bcd4;
    }

    input[type="submit"] {
      margin-top: 25px;
      width: 100%;
      padding: 12px;
      background: linear-gradient(to right, #00c6ff, #0072ff);
      color: #fff;
      border: none;
      border-radius: 10px;
      font-size: 1.1rem;
      font-weight: bold;
      cursor: pointer;
      transition: background 0.3s ease, transform 0.2s ease;
    }

    input[type="submit"]:hover {
      background: linear-gradient(to right, #0072ff, #00c6ff);
      transform: scale(1.02);
    }

    a {
      display: block;
      text-align: center;
      margin-top: 20px;
      text-decoration: none;
      color: #00d9ff;
      font-weight: bold;
      transition: color 0.3s ease;
    }

    a:hover {
      color: #67e8f9;
    }
  </style>
</head>
<body>
<div class="quest-container">
  <h2>🔧 Update Car Quest</h2>
  <form action="updateCar" method="post">
    <input type="hidden" name="id" value="${car.id}" />

    <label>Brand:</label>
    <input type="text" name="brand" value="${car.brand}" required />

    <label>Model:</label>
    <input type="text" name="model" value="${car.model}" required />

    <label>Year:</label>
    <input type="number" name="year" value="${car.year}" required />

    <label>Price:</label>
    <input type="number" step="0.01" name="price" value="${car.price}" required />

    <input type="submit" value="✅ Update">
  </form>

  <a href="listCars.jsp">⬅ Return to Home</a>
</div>
</body>
</html>
