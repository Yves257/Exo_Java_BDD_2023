<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>ASCII Art</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .ascii-container {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            margin-top: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        pre {
            font-family: monospace;
            font-size: 16px;
            margin: 0;
        }
        input[type="text"] {
            font-size: 18px;
            padding: 5px;
            width: 300px;
        }
        button {
            padding: 6px 12px;
            font-size: 16px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h1>ASCII Art Generator</h1>

    <form method="post">
        <label for="inputText">Entrez un mot :</label>
        <input type="text" id="inputText" name="inputText" required />
        <button type="submit">Afficher</button>
    </form>

    <div class="ascii-container">
    <%
        String inputText = request.getParameter("inputText");
        if (inputText != null && !inputText.trim().isEmpty()) {
            String textToPrint = inputText.toUpperCase();

            int L = 4;
            int H = 5;

            String[] asciiAlphabet = {
                " #  ##   ## ##  ### ###  ## # # ###  ## # # #   # # ###  #  ##   #  ##   ## ### # # # # # # # # # # ### ### ",
                "# # # # #   # # #   #   #   # #  #    # # # #   ### # # # # # # # # # # #    #  # # # # # # # # # #   #   # ",
                "### ##  #   # # ##  ##  # # ###  #    # ##  #   ### # # # # ##  # # ##   #   #  # # # # ###  #   #   #   ## ",
                "# # # # #   # # #   #   # # # #  #  # # # # #   # # # # # # #    ## # #   #  #  # # # # ### # #  #  #       ",
                "# # ##   ## ##  ### #    ## # # ###  #  # # ### # # # #  #  #     # # # ##   #  ###  #  # # # #  #  ###  #  "
            };

            for (int row = 0; row < H; row++) {
                out.print("<pre>");
                for (char ch : textToPrint.toCharArray()) {
                    int index = (ch >= 'A' && ch <= 'Z') ? ch - 'A' : 26;
                    int start = index * L;
                    out.print(asciiAlphabet[row].substring(start, start + L));
                }
                out.println("</pre>");
            }
        }
    %>
    </div>
</body>
</html>
