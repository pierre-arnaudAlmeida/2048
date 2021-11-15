WITH Ada.Text_IO; use Ada.Text_IO;
WITH Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
WITH Ada.Characters.Handling; use Ada.Characters.Handling;
WITH Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Calendar; use Ada.Calendar;

PACKAGE BODY Enregistrement_Score is

   -----------------------------------
   -- Procedure de lecture du score --
   -----------------------------------
   procedure Lecture_du_score(Fichier : file_type) is
      Txt,Nom : unbounded_string;
      Taille : integer;
      Score : Integer := 0;
   begin
      while not end_of_file(Fichier) loop                                    ---------------------------------------------------------------------
            txt:=To_Unbounded_String(get_line(Fichier));                     -- La boucle parcoure tout le fichier et analyse toutes les lignes --
            Taille := length(txt) ;                                          -- La taille est le nombre de caractere surr chaque ligne          --
                                                                             --                                                                 --
         IF To_String(Txt)(1..6)="Nom = "                                    -- Du caractere 1 à 6 si il y a "Nom =" alors le Nom  présent dans --
            THEN Nom := To_Unbounded_String(To_String(Txt)(6..12));          -- sur la ligne au caractere 6 à 12 sera afficher ensuite          --
         END IF;                                                             ---------------------------------------------------------------------

                                                                              --------------------------------------------------------------------
         IF To_String(Txt)(30..35)="Score="                                   -- Donc meme principe si du caractere 30 à 35 si il y a Score=    --
               THEN Score := Integer'Value(To_String(Txt)(36..Taille));       -- On renvoie Score qui est présent du caracter 36 a la fin       --
            END IF ;                                                          --------------------------------------------------------------------

            Put(To_String(Nom));                                              ----------------------------------------------------------------------------
            Put(" : " & Integer'Image(Score) & " points"); New_Line;          -- Affiche le "Nom" ensuite ":" et affiche les "scores" suivi de "points" --
            DELAY 1.0;                                                        -- Donc cela permet d'afficher les 10 premieres lignes du fichier txt     --
      end loop;                                                               ----------------------------------------------------------------------------
   end Lecture_du_score;

   ------------------------------------------------------
   -- Ecriture du score et des noms sur le fichier txt --
   ------------------------------------------------------
   procedure ecrire_le_Score(Fichier : File_Type; Sc : in integer) is
         Txt : Unbounded_String;
   begin                                                              ---------------------------------------------------
         txt := to_unbounded_string(Get_Line);                        -- sauvegarde le Nom au debut du fichier         --
         Put(Fichier,"Nom = " & to_string(txt));                      --                                               --
         Set_Col(Fichier,30);                                         -- Le curseur se place au niveau du caractere 30 --
         Put_Line(Fichier,"Score=" & Integer'Image(Sc));              -- va ecrire le score sur le fichier txt         --
   end Ecrire_le_Score ;                                              ---------------------------------------------------

   --------------------------------------------
   -- Sauvegarde du score sur le fichier txt --
   --------------------------------------------
   procedure Sauvegarde (Sc : in Integer) is

      -------------------------
      -- Variable du fihcier --
      -------------------------
      Txt,Nom : Unbounded_String;
      Taille : integer;

      ----------------------------------
      -- Varaible pour le tri a bulle --
      ----------------------------------
      Cname,NomS : String (1..6);
      CScore,Score : Integer := 0;
      C : Integer := 1;
   begin
      Open(Fichier,In_File,NomFichier);

      ------------------------------------------------
      -- enregistrement des valeurs dans un tableau --
      ------------------------------------------------
      while not End_Of_File(Fichier) loop

            txt:=To_Unbounded_String(get_line(Fichier));
            Taille:= length(txt) ;                                           ------------------------------------------------------
         if To_String(txt)(1..6)="Nom = "                                    -- si dans le fichier txt il y a "Nom ="            --
               THEN Nom := To_Unbounded_String(To_String(Txt)(6..11));       -- alors le nom qui est au caractere de 6 à 11 sera --
            TNom(C) := To_String(Nom);                                       -- enregistrer dans le tableau TNom                 --
         END IF;                                                             --                                                  --
                                                                             -- Meme Principe pour le score                      --
         IF To_String(Txt)(30..35)="Score="                                  -- mais il est enregistrer sur le tableau TScore    --
               THEN Score := Integer'Value(To_String(Txt)(36..Taille));      ------------------------------------------------------
	         TScore(C) := Score;
	 end if ;
	    C := C+1;
      end loop;
            Close(Fichier);

      ----------------------------------
      -- Constatation de record Battu --
      ----------------------------------
      IF Sc > TScore(10) THEN                                                                  -------------------------------------------------------
         Put("Felicitation vous avez battu l'ancien record donc vous ete le meilleur!");       -- Si le score est supperieur au dernier score alors --
         New_Line;                                                                             -- Le Score prend la place du dernier                --
         TScore(10) := Sc;                                                                     -- Et on demande le nom du joueur (le pseudo)        --
      Put("Votre Pseudo doit contenir 6 Lettres n'y une de plus n'y une de moins : ");         -------------------------------------------------------
      Get(NomS);
      TNom(10) := NomS;

      -----------------
      -- Tri à Bulle --
      -----------------
      for I in TScore'Range loop                                     ---------------------------------------------------------------------
         for J in 1..TScore'Length-I loop                            -- Fait un tri et intervertit deux valeurs en l'occurence le score --
                                                                     -- si le premier est plus grande que le deuxiemme score observer   --
            IF TScore(J) > TScore(J+1)                               -- et fait de meme avec les noms des utilisateur                   --
               then CScore := TScore(J);                             ---------------------------------------------------------------------
                 TScore(J) := TScore(J+1);
                 TScore(J+1) := CScore;
                 CName := TNom(J);
                 TNom(J) := TNom(J+1);
                 TNom(J+1) := CName;
	    end if;
         end loop;
      end loop;

         Open(Fichier,Out_File,NomFichier);

      for I in reverse TScore'Range loop
         Put(Fichier,"Nom = " & TNom(I));
         Set_Col(Fichier,30);
         Put_Line(Fichier,"Score=" & Integer'Image(TScore(I)));
         END LOOP;

         Close(Fichier);
      end if;
   end Sauvegarde;

end Enregistrement_Score;
