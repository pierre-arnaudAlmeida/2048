WITH Ada.Text_IO; USE Ada.Text_IO;
With Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
WITH Pileprojet; USE Pileprojet;


PACKAGE Fin_De_Jeux IS

   ---------------
   -- Variables --
   ---------------
   ScoreMax : Integer;

   --------------
   -- Fonction --
   --------------
   FUNCTION Tab_Plein (T:Tab1) RETURN Boolean;
   FUNCTION Gagner(T: Tab1) RETURN Boolean;

   end Fin_de_jeux;
