WITH Ada.Text_IO; USE Ada.Text_IO;
WITH Ada.Integer_Text_IO; USE Ada.Integer_Text_IO;
WITH Pileprojet; USE Pileprojet;
WITH Ada.Numerics.Discrete_Random;
with Possible_Decale; use Possible_Decale;


PROCEDURE Jeux2048 IS
   P: Pile;
   E: Tab1;
   o: boolean;
-- n: integer:= 4; -- permet de modifié la taille du tableau
A: integer; -- touches 1,2,3 ou 4
   D: Integer; -- coodornée du tableau
   X: Integer; -- coordonnée du tableau
   Subtype Score is integer; -- Sous type score qui a une taille qquasi ilimité
Subtype Probabilite is integer range 1..100; -- Sous-type de Probabilité
Subtype Cases is integer range 1..n; -- sous type pour definir les coordonée lors de la generation de G2

PACKAGE ChiffreHasard IS NEW Ada.Numerics.Discrete_Random (Probabilite);       -- Package du Generateur de valeur aléatoire "Probabilité" qui est compris entre 1 et 100
      USE ChiffreHasard;
   G:ChiffreHasard.Generator;
PACKAGE CaseHasard IS NEW Ada.Numerics.Discrete_Random(Cases);                 -- Package du Generateur de valeur aléatoire "Case" qui est compris entre 1 et 4
      USE CASEHasard;
   G2:CaseHasard.Generator;

   Sc: Score:=0;

                                   -- Fonction qui génère un chiffre entre 1 et 100
   FUNCTION Hasard (G: ChiffreHasard.Generator) RETURN Probabilite IS
   BEGIN
      RETURN Random(G);
   END Hasard;
                                   -- FOnction qui génère un chiffre entre 1 et 4
   FUNCTION ChoixCase (G2: CaseHasard.Generator) RETURN Cases IS
   BEGIN
      RETURN Random(G2);
   END ChoixCase;


                                   -- Definition de la taille du tableau a deux dimension
--   Type Tab1 IS ARRAY (1..n,1..n) OF integer;
   T: Tab1;
                            -- fonction qui definit les pourcentage de chance d'avoir un 2 ou un 4
   FUNCTION Proba (G: ChiffreHasard.Generator) RETURN Integer is
      Z: integer;
      Begin
      reset(G);
      D:= random(G);                 -- On génère une valeur compris entre 1 et 100
                                     -- Si elle est inferieur a 80
      IF D<=80                       -- alors la veleur sera un 2
         THEN Z:=2;                  -- le chiffre afficher sera un 4
         ELSE Z:=4;                  -- selon la regle definit il y a 80% de chance que ce soit un 2
      END IF;
         return Z;
         end Proba;

                                   -- Definit des valeurs aleatoire et les affecte au tableau
   PROCEDURE Defini (T:  IN  OUT Tab1;G: in out ChiffreHasard.Generator) IS
      X: Integer;
      D: integer;
   BEGIN
      FOR I IN 1..n LOOP                                  -- Si le chiffre generé est
         FOR J IN 1..n LOOP        -- compris entre 1 et 80 alors le programme
                                   -- affichera un 2
            T(I,j):= 0;            -- Qui apparaisse dans une case de la grille

         END LOOP;
      END LOOP;
      FOR I IN 1..2 LOOP
         <<debut>>
         Reset(G2);
         D:= ChoixCase(G2);              -- on Génère une valuer entre 1 et4 qui sera la ligne
            reset(G2);
         X:= ChoixCase(G2);
         reset(G);
         If T(D,X)=0 then
            T(D,X):= Proba(G);
            else Goto debut;
         END IF;
         end loop;

   END Defini;

-- Tri les valeur vers le Haut et supprime les espace si il y a un 0 entre deux chiffres
   PROCEDURE Tri_Haut (T: IN out Tab1) IS
      B: integer:=0;
   BEGIN
      For j in 1..n loop
      FOR I IN reverse 1..(n-1) LOOP
         FOR k IN 1..n LOOP
            B:= I+1;
            IF T(I,k)=0 THEN
               T(I,k):= T(B,K);
               T(B,K):= 0;
            END IF;
         END LOOP;
         end loop;
         end loop;
   END Tri_Haut;

-- Fusionne les valeur vers le haut qui sont egale
   PROCEDURE Fusion_Haut (T: IN OUT Tab1) IS
      B: integer :=0;
   BEGIN
      FOR I IN 1..(n-1) LOOP
         FOR K IN 1..n LOOP
            B:= I+1;
            IF T(b,k)=T(I,K) THEN
               T(i,K):= T(I,K)+T(B,K);
               T(b,K):=0;
               Sc:= T(i,k)+ Sc;
            END IF;
         END LOOP;
      END LOOP;
      end Fusion_Haut;

-- tri les valeur vers le Bas et supprime les espace si il y a un 0 entre deux chiffres
   PROCEDURE Tri_Bas (T: IN OUT Tab1) IS
   B: integer:= 0;
   BEGIN
       For j in 1..n loop
            FOR I IN 1..(n-1) LOOP
               FOR k IN 1..n LOOP
                  B:= I+1;
                     IF T(B,k)=0 THEN
                        T(B,k):= T(i,K);
                        T(i,K):= 0;
                     END IF;
               END LOOP;
            end loop;
      END LOOP;
   END Tri_Bas;

-- Fusionne les valeurs vers le Bas qui sont egales
   PROCEDURE Fusion_Bas (T: IN OUT Tab1) IS
      B: Integer:=0;
   BEGIN
      FOR I IN 1..(n-1) LOOP
         FOR K IN 1..n LOOP
            B:= I+1;
            IF T(I,K)= T(B,K) THEN
               T(i,K):= T(I,K)+T(B,K);
               T(B,K):=0;
               Sc:= T(i,k)+ Sc;
            END IF;
         END LOOP;
      END LOOP;
   END Fusion_Bas;

-- Tri les valeur vers la Gauche et supprime les 0 entre deux chiffres s'il existe
   PROCEDURE Tri_Gauche (T: IN OUT Tab1) IS
      B: Integer:=0;
   BEGIN
      For j in 1..n loop
      FOR I IN 1..n LOOP
         FOR k IN reverse 1..(n-1) LOOP
            B:= k+1;
            IF T(I,k)=0 THEN
               T(I,k):= T(i,B);
               T(i,B):= 0;
            END IF;
         END LOOP;
         end loop;
         end loop;
   END Tri_Gauche;

-- fusionne les valeur vers la Gauche qui sont egale
   PROCEDURE Fusion_Gauche (T: IN OUT Tab1) IS
      B: Integer:=0;
   BEGIN
       FOR I IN 1..n LOOP
         FOR K IN 1..(n-1) LOOP
            B:= k+1;
            IF T(I,K)= T(i,b) THEN
               T(i,b):= T(I,K)+T(i,b);
               T(I,K):=0;
               Sc:= T(i,b)+ Sc;
            END IF;
         END LOOP;
      END LOOP;
   END Fusion_Gauche;

   -- tri les valeurs vers la droite et supprime les 0 entre deux chiffres
   PROCEDURE Tri_Droite (T: IN OUT Tab1) IS
      B: Integer:=0;
   BEGIN
      For j in 1..n loop
      FOR I IN 1..n LOOP
         FOR k IN 1..(n-1) LOOP
            B:= k+1;
            IF T(I,b)=0 THEN
               T(I,b):= T(i,k);
               T(i,k):= 0;
            END IF;
         END LOOP;
         end loop;
         end loop;
   END Tri_Droite;

   -- fusionne les valeurs vers la droite qui sont egale
   PROCEDURE Fusion_Droite (T: IN OUT Tab1) IS
      B: Integer:=0;
   BEGIN
       FOR I IN 1..n LOOP
         FOR K IN reverse 1..(n-1) LOOP
            B:= k+1;
            IF T(I,K)= T(i,b) THEN
               T(i,b):= T(I,K)+T(i,b);
               T(I,K):=0;
               Sc:= T(i,b)+ Sc;
            END IF;
         END LOOP;
      END LOOP;
   END Fusion_Droite;

   -- decalage fini vers le haut avec le tri_haut et la fusion_haut
 PROCEDURE Decallage_Vers_Haut (T: IN out Tab1) Is
 BEGIN
       Tri_Haut(T);                            -- tri le tableau une premiere fois et supp les zero
       Fusion_Haut(T);                         -- fusionne les chiffre qui sont égale qui sont cote à cote
       Tri_Haut(T);                            -- tri une nouvelle fois
      END Decallage_Vers_Haut;

 -- decalage fini vers le bas avec le tri_haut et la fusion_bas
PROCEDURE Decallage_Vers_Bas (T: IN OUT Tab1) Is
BEGIN
         Tri_Bas(T);                              -- tri le tableau une premiere fois et supp les zero
         Fusion_Bas(T);                        -- fusionne les chiffre qui sont égale qui sont cote à cote
         Tri_Bas(T);                        -- tri une nouvelle fois
   END Decallage_Vers_Bas;

-- decalage fini vers la gauche avec le tri_haut et la fusion_gauche
 PROCEDURE Decallage_Vers_Gauche (T: IN OUT Tab1) Is
 BEGIN
    Tri_Gauche(T);                             -- tri le tableau une premiere fois et supp les zero
    Fusion_Gauche(T);                          -- fusionne les chiffre qui sont égale qui sont cote à cote
    Tri_Gauche(T);                             -- tri une nouvelle fois
 END Decallage_Vers_Gauche;

-- decalage fini vers la droite avec le tri_haut et la fusion_droite
   PROCEDURE Decallage_Vers_Droite (T: IN OUT Tab1) Is
   BEGIN
      Tri_Droite(T);                           -- tri le tableau une premiere fois et supp les zero
      Fusion_Droite(T);                        -- fusionne les chiffre qui sont égale qui sont cote à cote
      Tri_Droite(T);                           -- tri une nouvelle fois
   END Decallage_Vers_Droite;

-- procedure d'affichage de la forme du tableau
   PROCEDURE Affiche (T: Tab1)IS
   BEGIN
      New_line;
      FOR I IN 1..N LOOP
         Put("-----------------------------");New_line;
         FOR J IN 1..N LOOP
            Put("|");
            If T(i,j)=0 then put("      ");  else put(T(i,j),6); end if;
         END LOOP;
         Put("|");
         New_Line;
         end loop;
      Put("-----------------------------");
      New_line;New_line;
   END Affiche;



-- procedure de verifiction si le deplacement est valide et si une case est vide pour permettre l'ajout d'une nouvelle valeur dans la grille du jeu
   PROCEDURE Verifie_Vide_et_Ajoute (T: in out Tab1; G2: CaseHasard.Generator) is
      D: Integer;
      X: integer;
   BEGIN
            <<Debut>>
            reset(G2);
            D:= ChoixCase(G2);                     -- on Génère une valuer entre 1 et4 qui sera la ligne
            Reset(G2);
             X:= ChoixCase(G2);                     -- on genère une valeur entre 1 et 4 qui sera la colonne
            Reset(G);
                  IF T(D,X)= 0                        -- on verifie si la case aux coordonnées generé est vide
                     THEN T(D,X):= Proba(G);        -- si elle est vide, alors on affecte une valeur qui sera généré en fonction de la procedure de probabilité
        ELSE GOTO Debut   ;                        -- si la case aux coordonnées generé n'est pas egale a zero alors le programme retourne au debut qui se trouve avant le begin
         END IF;
   END Verifie_Vide_Et_Ajoute;

Touche : Character;
   PROCEDURE Demande IS
   BEGIN
      Get_Immediate(Touche);
   END Demande;



   PROCEDURE Mouvement IS
   BEGIN
      Reset(G);
      Reset(G2);
      Demande;

      IF Touche = Character'Val (16#48#)THEN
         IF Possib_Décal_Haut(T) THEN
            Decallage_Vers_Haut(T);
            Verifie_Vide_Et_Ajoute (T,G2);
            Affiche (T);
            Put("Votre score :  "); Put(Sc);

         END IF;

      ELSIF Touche = Character'Val (16#50#)THEN
         IF Possib_Décal_Bas(T) THEN
            Decallage_Vers_Bas(T);
            Verifie_Vide_Et_Ajoute (T,G2);
            Affiche (T);
            Put("Votre score :  "); Put(Sc);
         END IF;

      ELSIF Touche = Character'Val (16#4B#)THEN
         IF Possib_Décal_Gauche(T) THEN
            Decallage_Vers_Gauche(T);
            Verifie_Vide_Et_Ajoute (T,G2);
            Affiche (T);Put("Votre score :  "); Put(Sc);
         END IF;

      ELSIF Touche =  Character'Val (16#4D#)THEN
         IF Possib_Décal_Droit(T) THEN
            Decallage_Vers_Droite(T);
            Verifie_Vide_Et_Ajoute (T,G2);
            Affiche (T);Put("Votre score :  "); Put(Sc);
         END IF;
                  END IF;

   END Mouvement;


Function Gagner(T: Tab1) return Boolean is
      O: boolean;
   BEGIN
          FOR I IN 1..N LOOP
         FOR J IN 1..N LOOP
            IF T(I,J)=2048 THEN
               RETURN True;
            ELSE
               O:=False;
            END IF;
         END LOOP;
      END LOOP;
      RETURN O;
   END Gagner;


   FUNCTION Tab_Plein (T:Tab1) RETURN Boolean IS
      Plein: Boolean;
   BEGIN
      FOR I IN 1..N LOOP
         FOR J IN 1..N LOOP
            IF T(I,J)=0 THEN
               RETURN False;
            ELSE
               Plein:=True;
            END IF;
         END LOOP;
      END LOOP;
      RETURN Plein;
   END Tab_Plein;

C: integer;

BEGIN

   Put("Bonjour et Bienvenue!"); New_Line;
   Put("Que diriez vous d'une petite partie?"); New_Line;
   Put("                                        1- Lancer le jeu "); New_Line;
   new_line;
   Put("                                        2-Quitter le jeu ");  New_line;
   WHILE C>2 LOOP
      Get(C);
      iF C>2 then
      Put("Rentrez une valeur inferieur a 2"); New_line;
      end if;
      exit when C<2;
   END LOOP;

   IF C=1
      then
   init(P);
   Defini(T,G);
   Ajouter(P,T);
   Affiche(T);
   New_line;
   Put("Votre score :  "); Put(Sc);New_Line;
      New_Line;
      LOOP

         Mouvement;

         IF Gagner(T) THEN New_Line;
         Put("Gagner");
         New_line;
         END IF;
         EXIT WHEN  Gagner(T) or(Tab_plein(T) and (not Possib_Décal_Haut(T) and not Possib_Décal_bas(T) and not Possib_Décal_Droit(T) and not Possib_Décal_gauche(T)));
      END LOOP;
    Put("La partie est finie");

   ELSE

      Put("Au revoir! :)");

   END IF;




end Jeux2048;


