<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    // Récupération ou initialisation du tableau stocké en session
    List<Integer> tableau = (List<Integer>) session.getAttribute("tableau");
    if (tableau == null) {
        tableau = new ArrayList<Integer>();
        session.setAttribute("tableau", tableau);
    }

    String message = "";
    String action = request.getParameter("action");
    String valeurStr = request.getParameter("valeur");

    if (action != null) {
        switch (action) {
            case "ajouter":
                if (tableau.size() >= 10) {
                    message = "⚠️ Impossible d'ajouter plus de 10 éléments.";
                } else {
                    try {
                        int valeur = Integer.parseInt(valeurStr);
                        tableau.add(valeur);
                        message = "✅ Valeur ajoutée : " + valeur;
                    } catch (NumberFormatException e) {
                        message = "❌ Veuillez entrer un entier valide.";
                    }
                }
                break;

            case "supprimer":
                if (!tableau.isEmpty()) {
                    int removed = tableau.remove(tableau.size() - 1);
                    message = "🗑️ Dernière valeur supprimée : " + removed;
                } else {
                    message = "⚠️ Le tableau est déjà vide.";
                }
                break;

            case "afficher":
                if (!tableau.isEmpty()) {
                    message = "📦 Contenu du tableau : " + tableau.toString();
                } else {
                    message = "📭 Le tableau est vide.";
                }
                break;

            case "vider":
                tableau.clear();
                message = "🧹 Le tableau a été vidé.";
                break;
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestion du Tableau d'Entiers</title>
</head>
<body>
    <h2>Manipulation d'un tableau d'entiers (max. 10 éléments)</h2>

    <form method="post">
        <label>Valeur à ajouter :</label>
        <input type="text" name="valeur" />
        <button type="submit" name="action" value="ajouter">Ajouter</button>
        <br><br>

        <button type="submit" name="action" value="supprimer">Supprimer la dernière valeur</button>
        <button type="submit" name="action" value="afficher">Afficher le tableau</button>
        <button type="submit" name="action" value="vider">Vider le tableau</button>
    </form>

    <hr>

    <p><strong>Message :</strong> <%= message %></p>

    <% if (!tableau.isEmpty()) { %>
        <p><strong>État actuel du tableau :</strong> <%= tableau.toString() %></p>
    <% } else { %>
        <p><strong>État actuel du tableau :</strong> Vide</p>
    <% } %>
</body>
</html>

