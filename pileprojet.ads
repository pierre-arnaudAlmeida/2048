PACKAGE PileProjet IS

-------------------------
-- Taille de la grille --
-------------------------
   Dimension : Integer:= 4 ; -- modifiable

-------------------------------------------------------
-- Definition du tableau et des sous type de la pile --
-------------------------------------------------------                ----------------------------------------------------
   TYPE Tab1 IS ARRAY (1..Dimension,1..Dimension) OF Integer;          -- Definition du tableau                          --
   Subtype Score is integer;                                           -- Sous type score qui a une taille quasi ilimité --
   TYPE Contenant IS ARRAY (Natural RANGE <>) OF Tab1;                 --                                                --
   Type Contenant2 is array (Natural Range <>) of Score;               -- permet un retour arrière du score              --
                                                                       ----------------------------------------------------
   Type Pile IS RECORD
      Tabpile : Contenant (0..100000);
      Top : Integer;
      Sco : Contenant2 (0..100000);
   END RECORD;
   P: Pile;
   Sc: Score:=0;
   T: Tab1;
   PROCEDURE Init (P :OUT Pile);

   PROCEDURE Ajouter (P : IN OUT Pile ; T : IN Tab1; Sc: in out Score);

   Procedure Supprimer (P: in out Pile);

   FUNCTION Sommet (P : Pile) RETURN Tab1;

   FUNCTION Vide (P : Pile) RETURN Boolean;

END PileProjet;