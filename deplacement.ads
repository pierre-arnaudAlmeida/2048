WITH Ada.Text_IO; USE Ada.Text_IO;
WITH Ada.Integer_Text_IO; USE Ada.Integer_Text_IO;
WITH Pileprojet; USE Pileprojet;
With Variables; use Variables;

PACKAGE Deplacement IS

   -------------------
   -- Tri et fusion --
   -------------------
   PROCEDURE Tri_Haut (T: IN OUT Tab1);
   PROCEDURE Fusion_Haut (T: IN OUT Tab1);
   PROCEDURE Tri_Bas (T: IN OUT Tab1);
   PROCEDURE Fusion_Bas (T: IN OUT Tab1);
   PROCEDURE Tri_Gauche (T: IN OUT Tab1);
   PROCEDURE Fusion_Gauche (T: IN OUT Tab1);
   PROCEDURE Tri_Droite (T: IN OUT Tab1);
   PROCEDURE Fusion_Droite (T: IN OUT Tab1);

   ---------------------------------------------
   -- Procedure de synthèse des tri et fusion --
   ---------------------------------------------
   PROCEDURE Decallage_Vers_Haut (T: IN OUT Tab1);
   PROCEDURE Decallage_Vers_Bas (T: IN OUT Tab1);
   PROCEDURE Decallage_Vers_Gauche (T: IN OUT Tab1);
   PROCEDURE Decallage_Vers_Droite (T: IN OUT Tab1);
   PROCEDURE Retour (P: IN OUT Pile;T: IN OUT Tab1; Sc : in out Score);

end Deplacement;
