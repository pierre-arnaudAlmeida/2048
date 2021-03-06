WITH Pileprojet; USE Pileprojet;
With Variables; use Variables;

PACKAGE Possible_Decale IS

----------------------------------------------
-- ensemble des procedures et des fonctions --
-----------------------------------------------------------------
-- fonction verifiant si il est possible de faire un d?callage --
-----------------------------------------------------------------
   FUNCTION Possib_D?cal_Droit (T : Tab1) RETURN Boolean;
   FUNCTION Possib_D?cal_Gauche (T : Tab1) RETURN Boolean;
   FUNCTION Possib_D?cal_Haut (T : Tab1) RETURN Boolean;
   FUNCTION Possib_D?cal_Bas (T : Tab1) RETURN Boolean;

--------------------------------
-- procedure de tri et fusion --
--------------------------------
   PROCEDURE Tri_Haut_Bis (T2: IN OUT Tab1);
   PROCEDURE Fusion_Haut_bis (T2: IN OUT Tab1);
   PROCEDURE Tri_Bas_bis (T2: IN OUT Tab1);
   PROCEDURE Fusion_Bas_bis (T2: IN OUT Tab1);
   PROCEDURE Tri_Gauche_Bis (T2: IN OUT Tab1);
   PROCEDURE Fusion_Gauche_Bis (T2: IN OUT Tab1);
   PROCEDURE Tri_Droite_bis (T2: IN OUT Tab1) ;
   PROCEDURE Fusion_Droite_Bis (T2: IN OUT Tab1);
   PROCEDURE Decallage_Vers_Haut_Bis (T2: IN OUT Tab1);
   PROCEDURE Decallage_Vers_Bas_Bis (T2: IN OUT Tab1);
   PROCEDURE Decallage_Vers_Gauche_Bis (T2: IN OUT Tab1);
   PROCEDURE Decallage_Vers_Droite_bis (T2: IN OUT Tab1);
            END Possible_Decale;

