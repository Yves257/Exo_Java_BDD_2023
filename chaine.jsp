<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Manipulation de chaînes</title>
</head>
<body bgcolor="white">
<h1>Exercice sur les chaînes de caractères</h1>

<form action="#" method="post">
    <p>Saisir une phrase : <input type="text" name="message">
    <p><input type="submit" value="Afficher les transformations">
</form>

<%
    String message = request.getParameter("message");

    if (message != null && !message.trim().isEmpty()) {
        // Affichage en majuscules
        String majuscules = message.toUpperCase();

        // Mise en majuscule de la première lettre uniquement
        String premiereMaj = message.substring(0, 1).toUpperCase() + message.substring(1);

%>
    <h2>Résultats :</h2>
    <p><strong>Original :</strong> <%= message %></p>
    <p><strong>Majuscules :</strong> <%= majuscules %></p>
    <p><strong>Première lettre en majuscule :</strong> <%= premiereMaj %></p>
<%
    }
%>

<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
