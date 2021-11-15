WITH Ada.Text_IO; USE Ada.Text_IO;
WITH Ada.Integer_Text_IO; USE Ada.Integer_Text_IO;
WITH Pileprojet; USE Pileprojet;
WITH Ada.Numerics.Discrete_Random;
WITH Possible_Decale; USE Possible_Decale;
WITH Enregistrement_Score; USE Enregistrement_Score;
WITH Affichage; USE Affichage;
With Fin_de_jeux; use Fin_de_jeux;
WITH Deplacement; USE Deplacement;
WITH Demande_Touches; USE Demande_Touches;
WITH Variables; USE Variables;


PROCEDURE Jeux2048 IS


   -------------------------------------------------------
   --       Procedure et Générateur de Variable         --
   --       Définition du Tableau et ajout              --
   -------------------------------------------------------


   -- Sous-type de Probabilité
   SUBTYPE Probabilite IS Integer RANGE 1..100;
-- sous type pour definir les coordonée lors de la generation de G2
   SUBTYPE Cases IS Integer RANGE 1..Dimension;

-- Utilisation des Packages pour généré des valeurs aléatoire entre 1 et 100
PACKAGE ChiffreHasard IS NEW Ada.Numerics.Discrete_Random (Probabilite);                -- Package du Generateur de valeur aléatoire "Probabilité" qui est compris entre 1 et 100
      USE ChiffreHasard;
   G:ChiffreHasard.Generator;

-- Utilisation du Package pour généré une valeur qui correspondrat au position dans le tableau entre 1 et 4
   PACKAGE CaseHasard IS NEW Ada.Numerics.Discrete_Random(Cases);
      USE CASEHasard;
   G2:CaseHasard.Generator;

-- Fonction qui utilise le package et qui génère un chiffre entre 1 et 100
   FUNCTION Hasard (G: ChiffreHasard.Generator) RETURN Probabilite IS
   BEGIN
      RETURN Random(G);
   END Hasard;

-- Fonction qui utilise le package et qui génère un chiffre entre 1 et 4
   FUNCTION ChoixCase (G2: CaseHasard.Generator) RETURN Cases IS
   BEGIN
      RETURN Random(G2);
   END ChoixCase;



-- Fonction qui definit les pourcentage de chance d'avoir un 2 ou un 4
   FUNCTION Proba (G: ChiffreHasard.Generator) RETURN Integer is
      Begin
         Reset(G);                              -----------------------------------------------------------------------------
         Ligne:= random(G);                     -- On génère une valeur compris entre 1 et 100 ,Si elle est inferieur a 80 --
            IF Ligne<=80                        -- alors la veleur sera un 2                                               --
               THEN Var2:=2;                    -- le chiffre afficher sera un 4                                           --
               ELSE Var2:=4;                    -- selon la regle definit il y a 80% de chance que ce soit un 2            --
            END IF;                             --                                                                         --
         return Var2;                           -- On retourne donc la valeur de Var2                                      --
       end Proba;                               -----------------------------------------------------------------------------



--Definit des valeurs aleatoire et les affecte au tableau
   PROCEDURE Defini (T:  IN  OUT Tab1;G: in out ChiffreHasard.Generator) IS
   BEGIN
                                                --------------------------------------------------------------
      FOR I IN 1..Dimension LOOP                -- Si le chiffre generé est                                 --
         FOR J IN 1..Dimension LOOP             -- compris entre 1 et 80 alors le programme affichera un 2  --
            T(I,j):= 0;                         -- Qui apparaisse dans une case de la grille                --
         END LOOP;                              --------------------------------------------------------------
      END LOOP;

      FOR I IN 1..2 LOOP                        -- On répète ceci deux fois caar au début du jeu il y a uniquement 2 cases dans la grille
         Var:= 0;
         While Var /=1 loop
            Reset(G2);
            Ligne:= ChoixCase(G2);              -- on Génère une valuer entre 1 et4 qui sera la ligne
            reset(G2);
            Colonne:= ChoixCase(G2);
            reset(G);
               If T(Ligne,Colonne)=0 then       -- Si la case vaut 0 alors on lui génère une valeur en fonction de la probabilité
                  T(Ligne,Colonne):= Proba(G);
                  Var := Var+1;
               END IF;
         end loop;
      end loop;
         Sc:= 0;
   END Defini;

-- procedure de verifiction si le deplacement est valide et si une case est vide pour permettre l'ajout d'une nouvelle valeur dans la grille du jeu
   PROCEDURE Verifie_Vide_et_Ajoute (T: in out Tab1; G2: CaseHasard.Generator) is
   BEGIN
      Var := 0;
            While Var /= 1 loop
               reset(G2);                                      --------------------------------------------------------------------------------------------------------------------------------
               Ligne:= ChoixCase(G2);                          -- on Génère une valuer entre 1 et4 qui sera la ligne                                                                         --
               Reset(G2);                                      --                                                                                                                            --
               Colonne:= ChoixCase(G2);                        -- on genère une valeur entre 1 et 4 qui sera la colonne                                                                      --
               Reset(G);                                       --                                                                                                                            --
                  IF T(Ligne,Colonne)= 0                       -- on verifie si la case aux coordonnées generé est vide                                                                      --
                     THEN T(Ligne,Colonne):= Proba(G);         -- si elle est vide, alors on affecte une valeur qui sera généré en fonction de la procedure de probabilité                   --
                       Var:= Var+1 ;                           -- si la case aux coordonnées generé n'est pas egale a zero alors le programme retourne au debut qui se trouve avant le begin --
                  END IF;                                      ---------------------------------------------------------------------------------------------------------------------------------
            end loop;
   END Verifie_Vide_Et_Ajoute;



   -------------------------------------------------------
   --       Procedure de mouvement et du demarage       --
   --                       du jeu                      --
   -------------------------------------------------------


-- Procedure qui regroupe l'ensemmble des procedure de déplacement et qui définit les touche qui seront affecter a chaque déplacement
   PROCEDURE Mouvement IS
   BEGIN                                        ----------------------------------------------------
      Reset(G);                                 -- Renitialise les générateurs de valeur nommé G  --
      Reset(G2);                                -- Renitialise les générateurs de valeur nommé G2 --
      Demande;                                  -- Demande la touche avec un get_immediate        --
                                                ----------------------------------------------------

-- Différentes procedures pour le mouvement vers le haut       -----------------------------------------------------------------------------------------------------
     IF Touche = Character'Val (16#48#)THEN                    -- Code touche => corespondant a la fleche vers le haut                                            --
         IF Possib_Décal_Haut(T) THEN                          -- On verifie si un décallage est possible                                                         --
            Decallage_Vers_Haut(T);                            -- On réalise un déplacement                                                                       --
            Verifie_Vide_Et_Ajoute (T,G2);                     -- On vérifie si une case libre est disponnible et ensuite on ajoute une valeur a chaque mouvement --
            Affiche (T);                                       -- A chaque déplacement on réalise un affichage                                                    --
            Ajouter(p,t,Sc);                                   -- On ajoute la grille au top de la pile (devient le nouveau sommet)                               --
                                                               -----------------------------------------------------------------------------------------------------
         END IF;

-- Différente procedures pour le mouvement vers le bas        ---------------------------------------------------------------------------------
      ELSIF Touche = Character'Val (16#50#)THEN               -- on reproduit les memes instructions et on les réalise pour les 4 directions --
         IF Possib_Décal_Bas(T) THEN                          ---------------------------------------------------------------------------------
            Decallage_Vers_Bas(T);
            Verifie_Vide_Et_Ajoute (T,G2);
            Affiche (T);
            AJouter(p,t,sc);
         END IF;

-- Différentes procudres pour le mouvement vers la gauche
      ELSIF Touche = Character'Val (16#4B#)THEN
         IF Possib_Décal_Gauche(T) THEN
            Decallage_Vers_Gauche(T);
            Verifie_Vide_Et_Ajoute (T,G2);
            Affiche (T);
            AJouter(p,t,sc);
         END IF;

-- DIfférentes procedure pour le mouvement vers la droite
      ELSIF Touche =  Character'Val (16#4D#)THEN
         IF Possib_Décal_Droit(T) THEN
            Decallage_Vers_Droite(T);
            Verifie_Vide_Et_Ajoute (T,G2);
            Affiche (T);
            Ajouter(p,t,sc);
         END IF;
      END IF;

-- Procedure pour le retour arrière                 -------------------------------------------------
   IF Touche =  Character'Val (16#3F#) THEN         -- Code touche => Correspondant a la touche F5 --
         retour(p,T,sc);                            -- effectue la procedure retour                --
         Affiche(T);                                -------------------------------------------------

-- Limite le nombre de retour arrière à 3
            IF Nbretour_Arriere = 3 THEN
               Put_Line("Vous ne pouvez plus faire de retour arrière le votre nombre de joker est epuiser");
            end if;
   end if;

-- Exception qui affiche une phrase quand il survient une CONSTRAINT_ERROR
   EXCEPTION
      WHEN CONSTRAINT_ERROR => Put("Retour arrière Impossible");
         New_Line;
   END Mouvement;


-- Procedure démarrer qui demande quel choix veut faire le l'utilisateur au lancement du jeu
   PROCEDURE Demarrer IS
   BEGIN
      LOOP                                                            -----------------------------------------------------------------------
         Get(C);                                                      -- demande une variable compris entre 1 et 2                         --
            IF C>2 THEN                                               --                                                                   --
               Put("Rentrez une valeur inferieur a 3"); New_line;     -- si la variable est suppérieur a 2 le programme renvoie une phrase --
         END IF;                                                      --                                                                   --
        exit when C=1 or C=2;                                         -- La procedure s'arrete quand C possède la valeur 1 ou 2            --
      END LOOP;                                                       -----------------------------------------------------------------------
   END Demarrer;


   -------------------------------------------------------
   --       Ddebut de la procedure Principale           --
   -------------------------------------------------------


BEGIN

   Put("                                        Bonjour et Bienvenue! le le jeux 2048"); New_Line; New_line;
   Delay 2.0;
   Put("                                        Que diriez vous d'une petite partie?"); New_Line;
   Delay 1.0;
   Put("                                        Deux choix s'offre a vous, ils sont les suivant :");New_Line;
   Delay 1.0;
   Put("                                           - Jouer en mode Normale, tapez 1"); New_Line;
   DELAY 1.0;
   Put("                                           - Quitter le Jeu, tapez 2");New_Line;
   DELAY 1.0;
   New_line;

   Demarrer;

   IF C=1 then                                -----------------------------------------------------------------------------------------------
      WHILE Rejoue = 1 LOOP                   -- Si en fin de partie la variable rejoue est toujour egale à 1 alors on rejoue une partie   --
         Nbretour_arriere := 0;               -- initialisation du nombre de retour à 0                                                    --
         ScoreMax:= 2048;                     -- Initialisation du palier a atteindre pour gagner il peut etre modulable                   --
         Init(P);                             -- Initalisation de la pile                                                                  --
         Defini(T,G);                         -- définition du tableau et apparition des deux valeurs dans le tableau                      --
         Ajouter(P,T,sc);                     -- ajoute ensuite celui-ci dans la pile                                                      --
         Affiche(T);                          -- et affiche le tableau (grille) à l'utilisateur                                            --
         New_Line;                            -----------------------------------------------------------------------------------------------

      --Boucle permettant de rejouer          ----------------------------------------------------------------------------------------------------------------------
            WHILE Victoire = 1 LOOP           -- Variable victoire qui permet de continuer la partie meme si l'on a atteint de scoreMax, en modifiant le scoreMax --
               LOOP                           ----------------------------------------------------------------------------------------------------------------------
                  Demande;
                  Mouvement;                             ----------------------------------------------------------------------------------
                     IF Gagner(T) THEN New_Line;         -- Verifie si le apres le mouvement, il exsite une case avec la valeur ScoreMax --
                        Put("Gagner");                   -- et renvoi une ligne Gagner                                                   --
                        New_line;                        ----------------------------------------------------------------------------------
               END IF;

         -- On sort de la boucle si les fonction suivante son réalisé     -----------------------------------------------
              EXIT WHEN  Gagner(T)                                        -- Si la fonction gagner est réalise ou bien --
                  OR(Tab_Plein(T) AND                                     -- le tableau est plein et il est            --
                  (NOT Possib_Décal_Haut(T) AND                           -- impossible de faire un mouvement          --
                     NOT Possib_Décal_Bas(T) AND                          -----------------------------------------------
                     NOT Possib_Décal_Droit(T) AND
                     NOT Possib_Décal_Gauche(T)));

              End loop;      -- fin du loop avec la demande de touche et le mouvement

      New_line;
      Put("La partie est finie");
            New_Line;

-- Condition d'affichage si les deux condition sont réunis
            If (Gagner(T) and Victoire=1) or (Tab_Plein(T) AND
                  (NOT Possib_Décal_Haut(T) AND
                     NOT Possib_Décal_Bas(T) AND
                     NOT Possib_Décal_Droit(T) AND
                     NOT Possib_Décal_Gauche(T))) then
                     Put("Voulez vous enregistrer votre score ou quitter");
                     New_Line;
                     Put_Line("Tapez 1 pour quittez et 2 pour enregistrer votre score");
                     Get(Victoire);
            END IF;

         END LOOP;    -- fin du while Victoire = 1

-- Mais si Victoire est egale a 2 alors
If Victoire =2 then                                              -------------------------------------------------------
  Enregistrement_du_score : begin                                -- on debute la procedure d'enregistrement des score --
      Sauvegarde(Sc);                                            -------------------------------------------------------
         Open(Fichier,In_File,NomFichier);
            Put_Line("Top 10 des meilleurs scores");             -------------------------------------------------------------------------------------------
               Lecture_du_Score(Fichier);                        -- Lecture_du_score permet l'affichage des 10 meilleur score contenu dans le fichier txt --
                  Close(Fichier);                                -------------------------------------------------------------------------------------------
            EXIT;

-- Si l'erreur suivant est afficher c'est que le fichier n'existe pas donc l'exception le crée
   Exception
      when NAME_ERROR => Create (Fichier,Out_File,NomFichier); Close(Fichier);
      when others =>  Put("Une Petite Erreur est survenu veulliez recommencer la Partie et encore une fois désoler votre score ne sera pas enregistrer");
            END Enregistrement_Du_Score;

end if; -- fin de la condition victoire =2

         Put("Voulez vous rejouer une Partie si oui tapez 1 sinon tapez 2");
         New_Line;
         Get(Rejoue);       -- demande si l'on veut rejouer une partie

      END LOOP;      -- fin du while rejoue =1

   END IF;

   -----------------------------------------------------
   -- Affiche la fin du jeu et le nom des concepteurs --
   -----------------------------------------------------
      New_line;
   Put("Au revoir!");New_Line;
   delay 2.0;
   Put_Line("Vous venez de jouer a 2048");
   Delay 1.0;
   Put_Line("Réalisé par Pierre-Arnaud Almeida");
   Delay 1.0;
   Put_Line("Clément Azevedo Risetti");
   Delay 1.0;
   Put_Line("Alexandre Venet");
   delay 5.0;



end Jeux2048;


