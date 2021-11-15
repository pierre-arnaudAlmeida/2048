PACKAGE BODY PileProjet IS

   PROCEDURE Init (P: OUT Pile) IS
   BEGIN
      P.Top := -1;
   END Init;

   PROCEDURE Ajouter (P :IN OUT Pile; T : IN Tab1) is
   BEGIN
      P.Tabpile(P.Top+1) := T;
      P.Top:=P.Top+1;
   END Ajouter;

   PROCEDURE Supprimer (P : IN OUT Pile) IS
   BEGIN
      P.Top := P.Top-1;
   END Supprimer ;

   FUNCTION Sommet (P : PILE ) RETURN tab1 IS
   BEGIN

      RETURN (P. Tabpile (P. Top )) ;
   END Sommet ;

   FUNCTION Vide (P : Pile ) RETURN Boolean IS

   BEGIN

      RETURN (P. Top=-1) ;
   END Vide ;

END PileProjet;
 