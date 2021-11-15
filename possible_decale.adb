PACKAGE BODY Possible_Decale IS

                          -----------------------------
   T2:TaB1;               -- Définition du tableau 2 --
                          -----------------------------

------------------------------------------------------------------------------------------
-- tri les valeur vers le Bas et supprime les espace si il y a un 0 entre deux chiffres --
------------------------------------------------------------------------------------------
PROCEDURE Tri_Haut_bis (T2: IN out Tab1) IS
      B: integer:=0;
   BEGIN
      For j in 1..Dimension loop
         FOR I IN reverse 1..(Dimension-1) LOOP
            FOR k IN 1..Dimension LOOP
                  B:= I+1;
                  IF T2(I,k)=0
                     then T2(I,k):= T2(B,K);
                          T2(B,K):= 0;
                  END IF;
            END LOOP;
         END LOOP;
      END LOOP;
   END Tri_Haut_Bis;

-----------------------------------------------------
-- Fusionne les valeur vers le haut qui sont egale --
-----------------------------------------------------
   PROCEDURE Fusion_Haut_bis (T2: IN OUT Tab1) IS
      B: integer :=0;
   BEGIN
      FOR I IN 1..(Dimension-1) LOOP
         FOR K IN 1..Dimension LOOP
            B:= I+1;
            IF T2(b,k)=T2(I,K)
               then T2(i,K):= T2(I,K)+T2(B,K);
                  T2(b,K):=0;
            END IF;
         END LOOP;
      END LOOP;
   end Fusion_Haut_bis;

------------------------------------------------------------------------------------------
-- tri les valeur vers le Bas et supprime les espace si il y a un 0 entre deux chiffres --
------------------------------------------------------------------------------------------
   PROCEDURE Tri_Bas_bis (T2: IN OUT Tab1) IS
   B: integer:= 0;
   BEGIN
       For j in 1..Dimension loop
            FOR I IN 1..(Dimension-1) LOOP
               FOR k IN 1..Dimension LOOP
                     B:= I+1;
                     IF T2(B,k)=0
                        then T2(B,k):= T2(i,K);
                             T2(i,K):= 0;
                     END IF;
               END LOOP;
            end loop;
      END LOOP;
   END Tri_Bas_Bis;

------------------------------------------------------
-- Fusionne les valeurs vers le Bas qui sont egales --
------------------------------------------------------
   PROCEDURE Fusion_Bas_bis (T2: IN OUT Tab1) IS
      B: Integer:=0;
      BEGIN
         FOR I IN 1..(Dimension-1) LOOP
            FOR K IN 1..Dimension LOOP
               B:= I+1;
               IF T2(I,K)= T2(B,K)
                  then T2(i,K):= T2(I,K)+T2(B,K);
                  T2(B,K):=0;
               END IF;
           END LOOP;
        END LOOP;
   END Fusion_Bas_bis;

-------------------------------------------------------------------------------------
-- Tri les valeur vers la Gauche et supprime les 0 entre deux chiffres s'il existe --
-------------------------------------------------------------------------------------
   PROCEDURE Tri_Gauche_bis (T2: IN OUT Tab1) IS
      B: Integer:=0;
   BEGIN
      For j in 1..dimension loop
         FOR I IN 1..dimension LOOP
            FOR k IN reverse 1..(dimension-1) LOOP
               B:= k+1;
               IF T2(I,k)=0
                  then T2(I,k):= T2(i,B);
                       T2(i,B):= 0;
               END IF;
            END LOOP;
         end loop;
      end loop;
   END Tri_Gauche_bis;

-------------------------------------------------------
-- fusionne les valeur vers la Gauche qui sont egale --
-------------------------------------------------------
   PROCEDURE Fusion_Gauche_bis (T2: IN OUT Tab1) IS
      B: Integer:=0;
   BEGIN
       FOR I IN 1..dimension LOOP
         FOR K IN 1..(dimension-1) LOOP
               B:= k+1;
               IF T2(I,K)= T2(i,b)
                  then T2(i,b):= T2(I,K)+T2(i,b);
                       T2(I,K):=0;
               END IF;
         END LOOP;
      END LOOP;
   END Fusion_Gauche_Bis;

--------------------------------------------------------------------------
-- tri les valeurs vers la droite et supprime les 0 entre deux chiffres --
--------------------------------------------------------------------------
   PROCEDURE Tri_Droite_bis (T2: IN OUT Tab1) IS
      B: Integer:=0;
   BEGIN
      For j in 1..dimension loop
         FOR I IN 1..dimension LOOP
            FOR k IN 1..(dimension-1) LOOP
               B:= k+1;
               IF T2(I,b)=0
                  then T2(I,b):= T2(i,k);
                       T2(i,k):= 0;
               END IF;
            END LOOP;
         end loop;
     end loop;
   END Tri_Droite_bis;

--------------------------------------------------------
-- fusionne les valeurs vers la droite qui sont egale --
--------------------------------------------------------
   PROCEDURE Fusion_Droite_bis (T2: IN OUT Tab1) IS
      B: Integer:=0;
   BEGIN
       FOR I IN 1..dimension LOOP
         FOR K IN reverse 1..(dimension-1) LOOP
            B:= k+1;
            IF T2(I,K)= T2(i,b)
               then T2(i,b):= T2(I,K)+T2(i,b);
                    T2(I,K):=0;
            END IF;
         END LOOP;
      END LOOP;
   END Fusion_Droite_bis;

-------------------------------------------------------------------
-- decalage fini vers le haut avec le tri_haut et la fusion_haut --
-------------------------------------------------------------------
 PROCEDURE Decallage_Vers_Haut_bis (T2: IN out Tab1) Is
 BEGIN
                                                    --------------------------------------------------------------
       Tri_Haut_BIS(T2);                            -- tri le tableau une premiere fois et supp les zero        --
       Fusion_Haut_bis(T2);                         -- fusionne les chiffre qui sont égale qui sont cote à cote --
       Tri_Haut_Bis(T2);                            -- tri une nouvelle fois                                    --
                                                    --------------------------------------------------------------
 END Decallage_Vers_Haut_Bis;

------------------------------------------------------------------
-- decalage fini vers le bas avec le tri_haut et la fusion_bas  --
------------------------------------------------------------------
PROCEDURE Decallage_Vers_Bas_bis (T2: IN OUT Tab1) Is
BEGIN
                                                       --------------------------------------------------------------
         Tri_Bas_bis(T2);                              -- tri le tableau une premiere fois et supp les zero        --
         Fusion_Bas_Bis(T2);                           -- fusionne les chiffre qui sont égale qui sont cote à cote --
         Tri_Bas_bis(T2);                              -- tri une nouvelle fois                                    --
                                                       --------------------------------------------------------------
END Decallage_Vers_Bas_Bis;


-----------------------------------------------------------------------
-- decalage fini vers la gauche avec le tri_haut et la fusion_gauche --
-----------------------------------------------------------------------
 PROCEDURE Decallage_Vers_Gauche_bis (T2: IN OUT Tab1) Is
 BEGIN
                                                    --------------------------------------------------------------
    Tri_Gauche_bis(T2);                             -- tri le tableau une premiere fois et supp les zero        --
    Fusion_Gauche_bis(T2);                          -- fusionne les chiffre qui sont égale qui sont cote à cote --
    Tri_Gauche_Bis(T2);                             -- tri une nouvelle fois                                    --
                                                    --------------------------------------------------------------
 END Decallage_Vers_Gauche_bis;

-----------------------------------------------------------------------
-- decalage fini vers la droite avec le tri_haut et la fusion_droite --
-----------------------------------------------------------------------
   PROCEDURE Decallage_Vers_Droite_bis (T2: IN OUT Tab1) Is
   BEGIN
                                                    --------------------------------------------------------------
      Tri_Droite_bis(T2);                           -- tri le tableau une premiere fois et supp les zero        --
      Fusion_Droite_bis(T2);                        -- fusionne les chiffre qui sont égale qui sont cote à cote --
      Tri_Droite_Bis(T2);                           -- tri une nouvelle fois                                    --
                                                    --------------------------------------------------------------
   END Decallage_Vers_Droite_bis;

-----------------------------------------------------
-- Verifie s'il est possible de faire un decallage --
-----------------------------------------------------
   FUNCTION Possib_Décal_Droit (T : Tab1) RETURN Boolean IS
      T2 :Tab1;
      Possib : Boolean;
   BEGIN
      FOR I IN 1..dimension LOOP
         FOR J IN 1..dimension LOOP
            T2(I,J) := T(I,J);
         END LOOP;
      END LOOP;

      Decallage_Vers_Droite_BIs(T2);

      FOR I IN 1..dimension LOOP
         FOR J IN 1..dimension LOOP
            IF T(I,J) /= T2(I,J) THEN
               RETURN True;
            ELSE
               Possib := False;
            END IF;
         END LOOP;
      END LOOP;
      RETURN Possib;
   END Possib_Décal_Droit;

-----------------------------------------------------
-- Verifie s'il est possible de faire un decallage --
-----------------------------------------------------
   FUNCTION Possib_Décal_Gauche (T : Tab1) RETURN Boolean IS
      T2 :Tab1;
      Possib : Boolean;
   BEGIN
      FOR I IN 1..dimension LOOP
         FOR J IN 1..dimension LOOP
            T2(I,J) := T(I,J);
         END LOOP;
      END LOOP;

      Decallage_Vers_Gauche_Bis(T2);

      FOR I IN 1..dimension LOOP
         FOR J IN 1..dimension LOOP
            IF T(I,J) /= T2(I,J) THEN
               RETURN True;
            ELSE
               Possib := False;
            END IF;
         END LOOP;
      END LOOP;
      RETURN Possib;
   END Possib_Décal_Gauche;

-----------------------------------------------------
-- Verifie s'il est possible de faire un decallage --
-----------------------------------------------------
   FUNCTION Possib_Décal_Haut (T : Tab1) RETURN Boolean IS
      T2 :Tab1;
      Possib : Boolean;
   BEGIN
      FOR I IN 1..dimension LOOP
         FOR J IN 1..dimension LOOP
            T2(I,J) := T(I,J);
         END LOOP;
      END LOOP;

      Decallage_Vers_Haut_bis(T2);
      FOR I IN 1..dimension LOOP
         FOR J IN 1..dimension LOOP
            IF T(I,J) /= T2(I,J) THEN
               RETURN True;
            ELSE
               Possib := False;
            END IF;
         END LOOP;
      END LOOP;
      RETURN Possib;
   END Possib_Décal_Haut;

-----------------------------------------------------
-- Verifie s'il est possible de faire un decallage --
-----------------------------------------------------
   FUNCTION Possib_Décal_Bas (T : Tab1) RETURN Boolean IS
      T2 :Tab1;
      Possib : Boolean;
   BEGIN
      FOR I IN 1..dimension LOOP
         FOR J IN 1..dimension LOOP
            T2(I,J) := T(I,J);
         END LOOP;
      END LOOP;

      Decallage_Vers_Bas_Bis(T2);

      FOR I IN 1..dimension LOOP
         FOR J IN 1..dimension LOOP
            IF T(I,J) /= T2(I,J) THEN
               RETURN True;
            ELSE
               Possib := False;
            END IF;
         END LOOP;
      END LOOP;
      RETURN Possib;
   END Possib_Décal_Bas;

END Possible_Decale;


