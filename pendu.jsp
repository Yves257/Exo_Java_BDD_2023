<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>

<html>
<head>
    <title>Jeu du Pendu</title>
</head>
<body bgcolor="white">

<%! 
    String[] mots = {"JAVA", "PROGRAMME", "ORDINATEUR", "PENDU", "SERVEUR"};
%>

<%

    String mot = (String) session.getAttribute("mot");
    char[] motCache = (char[]) session.getAttribute("motCache");
    ArrayList<Character> lettres = (ArrayList<Character>) session.getAttribute("lettres");
    Integer essais = (Integer) session.getAttribute("essais");

    if (mot == null) {
        mot = mots[new Random().nextInt(mots.length)];
        motCache = new char[mot.length()];
        Arrays.fill(motCache, '_');
        lettres = new ArrayList<Character>();
        essais = 6;

        session.setAttribute("mot", mot);
        session.setAttribute("motCache", motCache);
        session.setAttribute("lettres", lettres);
        session.setAttribute("essais", essais);
    }

    String entree = request.getParameter("lettre");

    if (entree != null && entree.length() == 1) {
        char l = Character.toUpperCase(entree.charAt(0));
        if (!lettres.contains(l)) {
            lettres.add(l);
            boolean trouve = false;
            for (int i = 0; i < mot.length(); i++) {
                if (mot.charAt(i) == l) {
                    motCache[i] = l;
                    trouve = true;
                }
            }
            if (!trouve) {
                essais--;
            }
            session.setAttribute("motCache", motCache);
            session.setAttribute("lettres", lettres);
            session.setAttribute("essais", essais);
        }
    }

    boolean gagne = true;
    for (char c : motCache) {
        if (c == '_') {
            gagne = false;
            break;
        }
    }
%>

<h1>Jeu du Pendu</h1>

<p>
<%
    for (char c : motCache) {
        out.print(c + " ");
    }
%>
</p>

<p>Lettres proposées : 
<%
    for (char c : lettres) {
        out.print(c + " ");
    }
%>
</p>

<p>Essais restants : <%= essais %></p>

<%
    if (essais > 0 && !gagne) {
%>
    <form method="post">
        <input type="text" name="lettre" maxlength="1">
        <input type="submit" value="Proposer">
    </form>
<%
    } else if (gagne) {
%>
    <h2>Bravo ! Mot trouvé : <%= mot %></h2>
    <form method="post">
        <input type="submit" value="Rejouer">
        <% session.invalidate(); %>
    </form>
<%
    } else {
%>
    <h2>Perdu ! Le mot était : <%= mot %></h2>
    <form method="post">
        <input type="submit" value="Rejouer">
        <% session.invalidate(); %>
    </form>
<%
    }
%>

</body>
</html>
