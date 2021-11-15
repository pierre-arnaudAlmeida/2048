PACKAGE BODY Deplacement IS

-------------------------------------------------------------------------------------------
-- Tri les valeur vers le Haut et supprime les espace si il y a un 0 entre deux chiffres --
-------------------------------------------------------------------------------------------
   PROCEDURE Tri_Haut (T: IN out Tab1) IS
      B: integer:=0;
   BEGIN
      For j in 1..dimension loop                              -----------------------------------------------
         FOR I IN reverse 1..(dimension-1) LOOP               -- si la case est egale a 0 alors il prendre --
            FOR k IN 1..dimension LOOP                        -- la valeur de l case suivante              --
               B:= I+1;                                       -----------------------------------------------
               IF T(I,k)=0
                  then T(I,k):= T(B,K);
                       T(B,K):= 0;
               END IF;
            END LOOP;
         end loop;
      end loop;
   END Tri_Haut;

-----------------------------------------------------
-- Fusionne les valeur vers le haut qui sont egale --
-----------------------------------------------------
   PROCEDURE Fusion_Haut (T: IN OUT Tab1) IS
      B: integer :=0;
   BEGIN
      FOR I IN 1..(dimension-1) LOOP               ----------------------------------------------
         FOR K IN 1..dimension LOOP                -- Si deux case sont egale alors elles      --
            B:= I+1;                               -- s'unifie et l'autre case se reinitialise --
            IF T(b,k)=T(I,K)                       ----------------------------------------------
               then T(i,K):= T(I,K)+T(B,K);
                    T(b,K):=0;
                    Sc:= T(i,k)+ Sc;
            END IF;
         END LOOP;
      END LOOP;
   end Fusion_Haut;

------------------------------------------------------------------------------------------
-- tri les valeur vers le Bas et supprime les espace si il y a un 0 entre deux chiffres --
------------------------------------------------------------------------------------------
   PROCEDURE Tri_Bas (T: IN OUT Tab1) IS
   B: integer:= 0;
   BEGIN
       For j in 1..dimension loop
            FOR I IN 1..(dimension-1) LOOP                     -----------------------------------------------
               FOR k IN 1..dimension LOOP                      -- si la case est egale a 0 alors il prendre --
                  B:= I+1;                                     -- la valeur de l case suivante              --
                     IF T(B,k)=0                               -----------------------------------------------
                        then T(B,k):= T(i,K);
                             T(i,K):= 0;
                     END IF;
               END LOOP;
            end loop;
      END LOOP;
   END Tri_Bas;

------------------------------------------------------
-- Fusionne les valeurs vers le Bas qui sont egales --
------------------------------------------------------
   PROCEDURE Fusion_Bas (T: IN OUT Tab1) IS
      B: Integer:=0;
   BEGIN
      FOR I IN 1..(dimension-1) LOOP                         ----------------------------------------------
         FOR K IN 1..dimension LOOP                          -- Si deux case sont egale alors elles      --
            B:= I+1;                                         -- s'unifie et l'autre case se reinitialise --
            IF T(I,K)= T(B,K)                                ----------------------------------------------
               then T(i,K):= T(I,K)+T(B,K);
                    T(B,K):=0;
                     Sc:= T(i,k)+ Sc;
            END IF;
         END LOOP;
      END LOOP;
   END Fusion_Bas;

-------------------------------------------------------------------------------------
-- Tri les valeur vers la Gauche et supprime les 0 entre deux chiffres s'il existe --
-------------------------------------------------------------------------------------
   PROCEDURE Tri_Gauche (T: IN OUT Tab1) IS
      B: Integer:=0;
   BEGIN
      For j in 1..dimension loop
         FOR I IN 1..dimension LOOP                              -----------------------------------------------
            FOR k IN reverse 1..(dimension -1) LOOP              -- si la case est egale a 0 alors il prendre --
               B:= k+1;                                          -- la valeur de l case suivante              --
               IF T(I,k)=0                                       -----------------------------------------------
                  then T(I,k):= T(i,B);
                       T(i,B):= 0;
               END IF;
            END LOOP;
        end loop;
     end loop;
   END Tri_Gauche;

-------------------------------------------------------
-- fusionne les valeur vers la Gauche qui sont egale --
-------------------------------------------------------
   PROCEDURE Fusion_Gauche (T: IN OUT Tab1) IS
      B: Integer:=0;
   BEGIN
       FOR I IN 1..dimension LOOP                               ----------------------------------------------
         FOR K IN 1..(dimension-1) LOOP                         -- Si deux case sont egale alors elles      --
            B:= k+1;                                            -- s'unifie et l'autre case se reinitialise --
            IF T(I,K)= T(i,b)                                   ----------------------------------------------
               then T(i,b):= T(I,K)+T(i,b);
                    T(I,K):=0;
                    Sc:= T(i,b)+ Sc;
            END IF;
         END LOOP;
      END LOOP;
   END Fusion_Gauche;

--------------------------------------------------------------------------
-- tri les valeurs vers la droite et supprime les 0 entre deux chiffres --
--------------------------------------------------------------------------
   PROCEDURE Tri_Droite (T: IN OUT Tab1) IS
      B: Integer:=0;
   BEGIN
      For j in 1..dimension loop
         FOR I IN 1..dimension LOOP                  -----------------------------------------------
            FOR k IN 1..(dimension-1) LOOP           -- si la case est egale a 0 alors il prendre --
               B:= k+1;                              -- la valeur de l case suivante              --
               IF T(I,b)=0                           -----------------------------------------------
                  then T(I,b):= T(i,k);
                       T(i,k):= 0;
               END IF;
            END LOOP;
        end loop;
     end loop;
   END Tri_Droite;

--------------------------------------------------------
-- fusionne les valeurs vers la droite qui sont egale --
--------------------------------------------------------
   PROCEDURE Fusion_Droite (T: IN OUT Tab1) IS
      B: Integer:=0;
   BEGIN
       FOR I IN 1..dimension LOOP                            ----------------------------------------------
         FOR K IN reverse 1..(dimension-1) LOOP              -- Si deux case sont egale alors elles      --
            B:= k+1;                                         -- s'unifie et l'autre case se reinitialise --
            IF T(I,K)= T(i,b)                                ----------------------------------------------
               then T(i,b):= T(I,K)+T(i,b);
                    T(I,K):=0;
                    Sc:= T(i,b)+ Sc;
            END IF;
         END LOOP;
      END LOOP;
   END Fusion_Droite;

-------------------------------------------------------------------
-- decalage fini vers le haut avec le tri_haut et la fusion_haut --
-------------------------------------------------------------------
   PROCEDURE Decallage_Vers_Haut (T: IN out Tab1) Is
    BEGIN
                                               --------------------------------------------------------------
       Tri_Haut(T);                            -- tri le tableau une premiere fois et supp les zero        --
       Fusion_Haut(T);                         -- fusionne les chiffre qui sont égale qui sont cote à cote --
       Tri_Haut(T);                            -- tri une nouvelle fois                                    --
   END Decallage_Vers_Haut;                 --------------------------------------------------------------

-----------------------------------------------------------------
-- decalage fini vers le bas avec le tri_haut et la fusion_bas --
-----------------------------------------------------------------
   PROCEDURE Decallage_Vers_Bas (T: IN OUT Tab1) Is
   BEGIN
                                                  --------------------------------------------------------------
         Tri_Bas(T);                              -- tri le tableau une premiere fois et supp les zeroa       --
         Fusion_Bas(T);                           -- fusionne les chiffre qui sont égale qui sont cote à cote --
         Tri_Bas(T);                              -- tri une nouvelle fois                                    --
    END Decallage_Vers_Bas;                        --------------------------------------------------------------

-----------------------------------------------------------------------
-- decalage fini vers la gauche avec le tri_haut et la fusion_gauche --
-----------------------------------------------------------------------
   PROCEDURE Decallage_Vers_Gauche (T: IN OUT Tab1) Is
   BEGIN
                                                  --------------------------------------------------------------
       Tri_Gauche(T);                             -- tri le tableau une premiere fois et supp les zero        --
       Fusion_Gauche(T);                          -- fusionne les chiffre qui sont égale qui sont cote à cote --
       Tri_Gauche(T);                             -- tri une nouvelle fois                                    --
   END Decallage_Vers_Gauche;                     --------------------------------------------------------------

-----------------------------------------------------------------------
-- decalage fini vers la droite avec le tri_haut et la fusion_droite --
-----------------------------------------------------------------------
   PROCEDURE Decallage_Vers_Droite (T: IN OUT Tab1) Is
   BEGIN
                                               --------------------------------------------------------------
      Tri_Droite(T);                           -- tri le tableau une premiere fois et supp les zero        --
      Fusion_Droite(T);                        -- fusionne les chiffre qui sont égale qui sont cote à cote --
      Tri_Droite(T);                           -- tri une nouvelle fois                                    --
   END Decallage_Vers_Droite;                  --------------------------------------------------------------


----------------------
-- Procedure retour --
----------------------
   PROCEDURE Retour (P: IN OUT Pile;T: IN OUT Tab1; Sc : in out Score) IS
   BEGIN
      If nbretour_arriere <3                                  ---------------------------------------------------
         then Supprimer(P);                                   -- On applique la procedure supprimer de la pile --
              T:=P.Tabpile(P.Top);                            --                                               --
              Sc:= P.Sco(P.Top);                              -- et on affecte au score sa nouvelle valeur     --
              Nbretour_Arriere := Nbretour_Arriere +1;        ---------------------------------------------------
      end if;
   end Retour;

END Deplacement;