<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Add Used Car</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --primary-color: #1e3a8a;
            --secondary-color: #3b82f6;
            --accent-color: #facc15;
            --neutral-color: #f9fafb;
            --text-color: #333;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(30, 58, 138, 0.5)), url('https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80') no-repeat center center fixed;
            background-size: cover;
            background-attachment: fixed;
            color: #fff;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            max-width: 700px;
            margin: 20px;
            padding: clamp(20px, 5vw, 40px);
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            backdrop-filter: blur(10px);
        }

        h2 {
            font-family: 'Poppins', sans-serif;
            text-align: center;
            color: var(--primary-color);
            font-size: clamp(1.8rem, 5vw, 2.5rem);
            font-weight: 700;
            margin-bottom: 30px;
            text-transform: uppercase;
            letter-spacing: 1px;
            line-height: 1.2;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .form-group {
            position: relative;
            margin-bottom: 10px;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 12px;
            border-radius: 10px;
            border: 1px solid #ccc;
            font-size: 1.1em;
            background: var(--neutral-color);
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        input:focus {
            outline: none;
            border-color: var(--secondary-color);
            box-shadow: 0 0 8px rgba(59, 130, 246, 0.3);
        }

        label {
            position: absolute;
            top: 12px;
            left: 12px;
            color: #666;
            font-size: 1.1em;
            transition: all 0.2s ease;
            pointer-events: none;
        }

        input:focus + label,
        input:not(:placeholder-shown) + label {
            top: -10px;
            left: 10px;
            font-size: 0.9em;
            color: var(--secondary-color);
            background: #fff;
            padding: 0 5px;
        }

        input[type="submit"] {
            background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
            color: #fff;
            border: none;
            padding: 15px;
            font-family: 'Poppins', sans-serif;
            font-size: 1.1em;
            font-weight: 600;
            border-radius: 50px;
            cursor: pointer;
            text-transform: uppercase;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        input[type="submit"]:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
            background: linear-gradient(90deg, var(--secondary-color), var(--primary-color));
        }

        input[type="submit"]:focus {
            outline: 2px solid var(--secondary-color);
            outline-offset: 2px;
        }

        a.back-link {
            display: block;
            text-align: center;
            margin-top: 25px;
            color: var(--primary-color);
            text-decoration: none;
            font-family: 'Poppins', sans-serif;
            font-size: 1.1em;
            font-weight: 600;
            transition: color 0.3s ease;
        }

        a.back-link:hover {
            color: var(--secondary-color);
        }

        a.back-link:focus {
            outline: 2px solid var(--secondary-color);
            outline-offset: 2px;
        }

        a.back-link::before {
            content: '⬅';
            margin-right: 5px;
            display: inline-block;
            transition: transform 0.3s ease;
        }

        a.back-link:hover::before {
            transform: rotate(-10deg);
        }

        @media (prefers-reduced-motion: reduce) {
            body {
                background-attachment: scroll;
            }
            input[type="submit"], a.back-link {
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

            input[type="text"],
            input[type="number"],
            input[type="submit"] {
                padding: 10px;
                font-size: 1em;
            }

            label {
                font-size: 1em;
            }

            a.back-link {
                font-size: 1em;
            }
        }

        @media (min-width: 768px) {
            form {
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 20px;
            }
            input[type="submit"] {
                grid-column: span 2;
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
    <h2>Add Used Car</h2>
    <form action="add" method="post">
        <div class="form-group">
            <input type="text" name="brand" id="brand" placeholder=" " required>
            <label for="brand">Brand</label>
        </div>
        <div class="form-group">
            <input type="text" name="model" id="model" placeholder=" " required>
            <label for="model">Model</label>
        </div>
        <div class="form-group">
            <input type="number" name="year" id="year" min="1900" max="2025" placeholder=" " required
                   oninvalid="this.setCustomValidity('Please enter a valid year between 1900 and 2025')"
                   onchange="this.setCustomValidity('')">
            <label for="year">Year</label>
        </div>
        <div class="form-group">
            <input type="number" step="0.01" name="price" id="price" min="0" placeholder=" " required
                   oninvalid="this.setCustomValidity('Please enter a valid price')"
                   onchange="this.setCustomValidity('')">
            <label for="price">Price</label>
        </div>
        <input type="submit" value="Add Car">
    </form>
    <a class="back-link" href="index.jsp">Back to Home</a>
</div>

</body>
</html>
