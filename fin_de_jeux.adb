Package body Fin_De_Jeux IS

-------------------------------------
-- Verifie si le tableau est plein --
-------------------------------------
FUNCTION Tab_Plein (T:Tab1) RETURN Boolean IS
      Plein: Boolean;
   BEGIN                                    -------------------------------------
      FOR I IN 1..Dimension LOOP            -- Verifie si le tableau est plein --
         FOR J IN 1..Dimension LOOP         -- si il y a une case a zero alors --
            IF T(I,J)=0 THEN                -- la fonction renvoie false       --
               RETURN False;                -- cela permet aussi de posé une   --
            ELSE                            -- contidion dans les déplacement  --
               Plein:=True;                 -------------------------------------
            END IF;
         END LOOP;
      END LOOP;
      RETURN Plein;
   END Tab_Plein;

----------------------------------------------------------
-- Fonction gagner, défini une condition de fin de jeux --
----------------------------------------------------------
Function Gagner(T: Tab1) return Boolean is
      O: boolean;
   BEGIN                                        --------------------------------------------
          FOR I IN 1..Dimension LOOP            -- Si une case possède la valeur          --
         FOR J IN 1..DImension LOOP             -- de ScoreMax, alors cela veut dire      --
            IF T(I,J)=ScoreMax THEN             -- que le joueur a gagner, par défaut     --
               RETURN True;                     -- ScoreMax = 2048, et il evolue au cours --
            ELSE                                -- de la partie en fonction du choix de   --
               O:=False;                        -- l'utilisateur                          --
            END IF;                             --------------------------------------------
         END LOOP;
      END LOOP;
      RETURN O;
   END Gagner;

end Fin_de_Jeux;


