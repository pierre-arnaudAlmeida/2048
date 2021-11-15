with Ada.Text_IO; use Ada.Text_IO;
package Enregistrement_Score is

   ---------------------
   -- Tpye de fichier --
   ---------------------                                                              ------------------------
   Fichier : File_Type;                                                               -- Type de fichier    --
   NomFichier : constant string := "Liste des Meilleurs scores realiser.txt";         -- Nom du fichier txt --
                                                                                      ------------------------
   -----------------------------------------------------
   --Initialisation du Tableau des noms et des scores --
   -----------------------------------------------------                              ------------------------------------------------------------------------------------------
   type Tableau_de_Noms is array (Integer range 1..10) of String (1..6);              -- Tableau des Noms de taille 10 et un nombre de caracteres limiter a 6                 --
   type Tableau_de_Scores is array (Integer range 1..10) of Integer;                  -- Tableau des Scores de taille 10                                                      --
   TNom : Tableau_de_Noms := (others => "      ");                                    -- Si il n'ya pas de nom dans certainnes lignes alors cela est remplacer par un escpace --
   TScore : Tableau_de_Scores := (others => 0);                                       -- Si il n'y a pas de valeur dans le score chaque ligne sera remplcaer par un zero      --
                                                                                      ------------------------------------------------------------------------------------------
   --------------------------------------------------
   -- Procedure d'ecriture et d'affichage du score --
   --------------------------------------------------
   procedure Lecture_du_score(Fichier : file_type);
   procedure Ecrire_le_Score(Fichier : File_Type; Sc : in Integer);
   procedure Sauvegarde (Sc : in Integer);

end Enregistrement_Score;




