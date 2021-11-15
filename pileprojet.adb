PACKAGE BODY PileProjet IS

   ---------------------------
   -- initialise le tableau --
   ---------------------------
   PROCEDURE Init (P: OUT Pile) IS
   BEGIN
      P.Top := -1;
   END Init;

----------------------------------------------------------------
-- permet d'ajouter le tableau a la pile a chaque d�placement --
----------------------------------------------------------------
   PROCEDURE Ajouter (P :IN OUT Pile; T : IN Tab1; Sc : in out Score) is
   BEGIN
                                             ------------------------------------------------
      P.Tabpile(P.Top+1) := T;               -- Le top de la pile devient le tableau       --
      P.Top:=P.Top+1;                        --                                            --
      p.sco(p.top):= Sc;                     -- le score pr�c�dent devient le score actuel --
   END Ajouter;                              ------------------------------------------------

--------------------------------------------------------------
-- Procedure qui va permettre de faire un retour en arri�re --
--------------------------------------------------------------
   PROCEDURE Supprimer (P : IN OUT Pile) IS
   BEGIN
      P.Top :=(P.Top-1);
   END Supprimer ;

   -------------------------------------
   -- Fonction qui retourne le sommet --
   -------------------------------------
   FUNCTION Sommet (P : PILE ) RETURN tab1 IS
   BEGIN
      RETURN P. Tabpile (P. Top ) ;
   END Sommet ;

----------------------------------------------
-- fonction qui v�rifie si la pile est vide --
----------------------------------------------
   FUNCTION Vide (P : Pile ) RETURN Boolean IS
   BEGIN
      RETURN (P. Top=-1) ;
   END Vide ;

END PileProjet;
 