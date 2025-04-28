<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les tableaux</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les tableaux</h1>
<form action="#" method="post">
    <p>Saisir au minimum 3 chiffres à la suite, exemple : 6 78 15 <input type="text" id="inputValeur" name="chaine">
    <p><input type="submit" value="Afficher">
</form>

<%-- Récupération des valeurs --%>
<% String chaine = request.getParameter("chaine"); %>

<% if (chaine != null) { %>

    <%-- Division de la chaîne de chiffres séparés par des espaces --%>
    <% String[] tableauDeChiffres = chaine.split("\\s+"); %>
    <p>Le tableau contient <%= tableauDeChiffres.length %> valeurs</br>
    Chiffre 1 : <%= Integer.parseInt(tableauDeChiffres[0]) %></br>
    Chiffre 2 : <%= Integer.parseInt(tableauDeChiffres[1]) %></br>
    Chiffre 3 : <%= Integer.parseInt(tableauDeChiffres[2]) %></p>

<h2>Exercice 1 : Le carré de la première valeur</h2>
<p>Ecrire un programme afin d'afficher le carré de la première valeur</p>

<%-- Calculer le carré de la première valeur --%>
<% int premierChiffre = Integer.parseInt(tableauDeChiffres[0]);
   int carrePremierChiffre = premierChiffre * premierChiffre; %>
<p>Le carré de la première valeur est : <%= carrePremierChiffre %></p>

<h2>Exercice 2 : La somme des 2 premières valeurs</h2>
<p>Ecrire un programme afin d'afficher la somme des deux premières valeurs</p>

<%-- Calculer la somme des deux premières valeurs --%>
<% int deuxiemeChiffre = Integer.parseInt(tableauDeChiffres[1]);
   int sommeDeuxPremieresValeurs = premierChiffre + deuxiemeChiffre; %>
<p>La somme des deux premières valeurs est : <%= sommeDeuxPremieresValeurs %></p>

<h2>Exercice 3 : La somme de toutes les valeurs</h2>
<p>L'utilisateur peut à présent saisir autant de valeurs qu'il le souhaite dans le champ de saisie.</br>
Ecrire un programme afin de faire la somme de toutes les valeurs saisies par l'utilisateur</p>

<%-- Calculer la somme de toutes les valeurs --%>
<% int sommeToutesValeurs = 0;
   for (String valeur : tableauDeChiffres) {
       sommeToutesValeurs += Integer.parseInt(valeur);
   } %>
<p>La somme de toutes les valeurs est : <%= sommeToutesValeurs %></p>

<h2>Exercice 4 : La valeur maximum</h2>
<p>Ecrire un programme pour afficher la valeur maximale saisie par l'utilisateur</p>

<%-- Trouver la valeur maximale --%>
<% int valeurMax = Integer.parseInt(tableauDeChiffres[0]);
   for (String valeur : tableauDeChiffres) {
       int intValeur = Integer.parseInt(valeur);
       if (intValeur > valeurMax) {
           valeurMax = intValeur;
       }
   } %>
<p>La valeur maximale est : <%= valeurMax %></p>

<h2>Exercice 5 : La valeur minimale</h2>
<p>Ecrire un programme pour afficher la valeur minimale saisie par l'utilisateur</p>

<%-- Trouver la valeur minimale --%>
<% int valeurMin = Integer.parseInt(tableauDeChiffres[0]);
   for (String valeur : tableauDeChiffres) {
       int intValeur = Integer.parseInt(valeur);
       if (intValeur < valeurMin) {
           valeurMin = intValeur;
       }
   } %>
<p>La valeur minimale est : <%= valeurMin %></p>

<h2>Exercice 6 : La valeur la plus proche de 0</h2>
<p>Trouvez la valeur la plus proche de 0 (chiffres positifs ou négatifs)</p>

<%-- Trouver la valeur la plus proche de 0 --%>
<% int valeurProcheDeZero = Integer.parseInt(tableauDeChiffres[0]);
   for (String valeur : tableauDeChiffres) {
       int intValeur = Integer.parseInt(valeur);
       if (Math.abs(intValeur) < Math.abs(valeurProcheDeZero)) {
           valeurProcheDeZero = intValeur;
       }
   } %>
<p>La valeur la plus proche de 0 est : <%= valeurProcheDeZero %></p>

<h2>Exercice 7 : La valeur la plus proche de 0 (2° version)</h2>
<p>Trouvez la valeur la plus proche de 0 (chiffres positifs ou négatifs)</p>
<p>En cas d'égalité entre un chiffre positif et négatif, affichez le chiffre positif</p>

<%-- Trouver la valeur la plus proche de 0 (2° version) --%>
<% int valeurProcheDeZero2 = Integer.parseInt(tableauDeChiffres[0]);
   for (String valeur : tableauDeChiffres) {
       int intValeur = Integer.parseInt(valeur);
       if (Math.abs(intValeur) < Math.abs(valeurProcheDeZero2) ||
           (Math.abs(intValeur) == Math.abs(valeurProcheDeZero2) && intValeur > valeurProcheDeZero2)) {
           valeurProcheDeZero2 = intValeur;
       }
   } %>
<p>La valeur la plus proche de 0 (2° version) est : <%= valeurProcheDeZero2 %></p>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
