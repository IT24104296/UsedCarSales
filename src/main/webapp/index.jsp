<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Used Car Web App</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #1e3a8a;
            --secondary-color: #3b82f6;
            --accent-color: #facc15;
            --neutral-color: #f9fafb;
            --text-color: #333;
            --bg-color: #ffffff;
            --container-bg: rgba(255, 255, 255, 0.95);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(30, 58, 138, 0.5)), url('https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80') no-repeat center center fixed;
            background-size: cover;
            background-attachment: fixed;
            color: var(--text-color);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            max-width: 700px;
            margin: 20px;
            padding: clamp(20px, 5vw, 40px);
            background: var(--container-bg);
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            backdrop-filter: blur(10px);
        }

        h2 {
            font-family: 'Poppins', sans-serif;
            color: var(--primary-color);
            font-size: clamp(1.8rem, 5vw, 2.5rem);
            font-weight: 700;
            margin-bottom: 20px;
            text-transform: uppercase;
            letter-spacing: 1px;
            line-height: 1.2;
        }

        .tagline {
            font-size: clamp(1rem, 3vw, 1.2rem);
            margin-bottom: 30px;
        }

        .btn {
            text-decoration: none;
            color: #fff;
            background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
            padding: 15px 30px;
            border-radius: 50px;
            margin: 15px;
            display: inline-block;
            font-family: 'Poppins', sans-serif;
            font-size: 1.1em;
            font-weight: 600;
            text-transform: uppercase;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            animation: pulse 2s infinite;
        }

        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
            background: linear-gradient(90deg, var(--secondary-color), var(--primary-color));
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }

        @media (prefers-reduced-motion: reduce) {
            body {
                background-attachment: scroll;
            }
            .btn {
                animation: none;
                transition: none;
            }
        }

        @media (max-width: 600px) {
            .container {
                margin: 10px;
                padding: 20px;
            }

            h2 {
                font-size: 1.8rem;
            }

            .tagline {
                font-size: 1rem;
            }

            .btn {
                padding: 12px 25px;
                font-size: 1em;
                margin: 10px;
            }
        }

        @media (min-width: 1200px) {
            .container {
                display: grid;
                grid-template-columns: 1fr minmax(0, 700px) 1fr;
            }
            .container > * {
                grid-column: 2;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Welcome to Used Car Platform</h2>
    <p class="tagline">Discover your dream car or sell yours with ease!</p>
    <a href="list" class="btn" aria-label="View available cars">View Cars</a>
    <a href="addCar.jsp" class="btn" aria-label="Add a new car">Add Car</a>
</div>
</body>
</html>
