<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Add Used Car - Solo Leveling Theme</title>
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@500&family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        /* Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: linear-gradient(135deg, #0a0a0a, #1c1c2e);
            color: #ddd;
            font-family: 'Roboto', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .container {
            background: #121217;
            border: 2px solid #3b3b6b;
            border-radius: 15px;
            max-width: 700px;
            width: 100%;
            padding: 40px 50px;
            box-shadow:
                    0 0 10px #551a8b,
                    0 0 20px #551a8b,
                    0 0 40px #8c43ff;
            backdrop-filter: blur(8px);
        }

        h2 {
            font-family: 'Orbitron', sans-serif;
            font-weight: 500;
            font-size: 2.8rem;
            color: #8c43ff;
            text-align: center;
            margin-bottom: 40px;
            letter-spacing: 3px;
            text-transform: uppercase;
            text-shadow: 0 0 10px #8c43ff;
        }

        form {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 25px 30px;
        }

        .form-group {
            position: relative;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 14px 15px;
            font-size: 1.1rem;
            border: 2px solid #3b3b6b;
            border-radius: 12px;
            background: #0e0e18;
            color: #ddd;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
            font-weight: 500;
            font-family: 'Roboto', sans-serif;
        }

        input[type="text"]::placeholder,
        input[type="number"]::placeholder {
            color: transparent; /* Hide placeholders for floating label effect */
        }

        input:focus {
            outline: none;
            border-color: #8c43ff;
            box-shadow: 0 0 8px #8c43ff;
            background: #1a1a2e;
        }

        label {
            position: absolute;
            top: 14px;
            left: 15px;
            color: #7777aa;
            font-size: 1.1rem;
            pointer-events: none;
            font-weight: 400;
            transition: all 0.25s ease;
            font-family: 'Roboto', sans-serif;
        }

        /* Floating label on input focus or filled */
        input:focus + label,
        input:not(:placeholder-shown) + label {
            top: -12px;
            left: 12px;
            font-size: 0.85rem;
            color: #8c43ff;
            background: #121217;
            padding: 0 6px;
            font-weight: 700;
            text-shadow: 0 0 5px #8c43ff;
            border-radius: 5px;
        }

        input[type="submit"] {
            grid-column: span 2;
            padding: 18px 0;
            font-size: 1.2rem;
            font-family: 'Orbitron', sans-serif;
            font-weight: 600;
            text-transform: uppercase;
            color: #fff;
            background: linear-gradient(90deg, #6f3eff, #b979ff);
            border: none;
            border-radius: 50px;
            cursor: pointer;
            box-shadow:
                    0 0 10px #8c43ff,
                    0 0 20px #b979ff;
            transition: background 0.3s ease, transform 0.3s ease;
        }

        input[type="submit"]:hover {
            background: linear-gradient(90deg, #b979ff, #6f3eff);
            transform: scale(1.05);
            box-shadow:
                    0 0 15px #b979ff,
                    0 0 30px #d0a0ff;
        }

        a.back-link {
            display: block;
            text-align: center;
            margin-top: 30px;
            color: #8c43ff;
            font-family: 'Orbitron', sans-serif;
            font-weight: 500;
            text-decoration: none;
            font-size: 1.1rem;
            letter-spacing: 1.5px;
            text-shadow: 0 0 5px #8c43ff;
            transition: color 0.3s ease;
        }

        a.back-link:hover {
            color: #b979ff;
            text-shadow: 0 0 10px #b979ff;
        }

        @media (max-width: 700px) {
            form {
                grid-template-columns: 1fr;
            }

            input[type="submit"] {
                grid-column: span 1;
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
    <a class="back-link" href="index.jsp">⬅ Back to Home</a>
</div>

</body>
</html>
