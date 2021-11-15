PACKAGE PileProjet IS



   N: Integer:=4;

   TYPE Tab1 IS ARRAY (1..N,1..N) OF Integer;
   TYPE Contenant IS ARRAY (Natural RANGE <>) OF Tab1;

   Type Pile IS RECORD
      Tabpile : Contenant (0..255);
      Top : integer;
   END RECORD;

   PROCEDURE Init (P :OUT Pile);

   PROCEDURE Ajouter (P : IN OUT Pile ; T : IN Tab1);

Procedure Supprimer (P: in out Pile);

   FUNCTION Sommet (P : Pile) RETURN Tab1;

   FUNCTION Vide (P : Pile) RETURN Boolean;

END PileProjet;