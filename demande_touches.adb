PACKAGE BODY Demande_Touches IS

--------------------------------------------------------------------------------
-- Procedure pour uniquement taper sur une une touche sans appuyer sur entrer --
--------------------------------------------------------------------------------
Procedure Demande is
   BEGIN
      Get_Immediate(Touche);
   END Demande;

END Demande_Touches;
