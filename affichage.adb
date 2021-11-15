PACKAGE BODY Affichage IS

      procedure Affiche (T : in out Tab1) is
      begin
            FOR I IN 1..Dimension LOOP                                  -------------------------------------------------------
               Put("                       +");                         -- Permet afficher un espace pour centrer le tableau --
                  for K in 1..Dimension loop                            -- Met des tirets et un plus a chaque fin de case    --
                     Put("-------+");                                   -- Cette opération ce répète pour chaque case        --
                  END LOOP;                                                   -------------------------------------------------------

                  IF I=2
                     then Put("          - Deplacement vers la Gauche : Flèche Gauche");         ----------------------------------------------------------------
                  END IF;                                                                        -- Affiche les deux phrase suivantes qui font références      --
                  IF I=3                                                                         -- aux touches que l'on doit préssé pour réalisé une mouvment --
                     THEN Put("          - La touche pour le retour arriere est : F5");          ----------------------------------------------------------------
                  END IF;
                  New_Line;

                  FOR J IN 1..Dimension LOOP                                             ------------------------------------------------------
                     IF J = 1                                                            -- Permet de centrer le tableau                     --
                        THEN Put("                       |");                         -- et de mettre un espace vide dans les lignes qui  --
                     END IF;                                                             -- se trouve au dessus et en dessous du chiffre     --
                     Put("       ");                                                     ------------------------------------------------------
                        Put("|");
                  END LOOP;

               IF I = 1                                                                              -------------------------------------------------
                  then Put("        Les Touches pour vous deplacer sont les suivants:");             -- phrase qui s'affiche pour donner les touche --
               END IF;                                                                               -- qui permettent de faire les mouvement       --
               IF  i=2                                                                               -------------------------------------------------
                  then Put("          - Deplacement vers la droite : Flèche Droite");
               end if;
                  New_Line;

               for J in 1..Dimension loop
	             if J = 1                                                    ---------------------------------------------------------
	                then Put("                       |");                    -- Permet de palcer un espace avant le tableau         --
	             end if;                                                     -- pour le centrer                                     --
	             if T(I,J) < 10                                              -- Condition qui centre la valeur au centre de la case --
	                then Put("   ");                                         ---------------------------------------------------------
	             elsif T(I,J) < 100
	                then Put("   ");
	             elsif T(I,J) < 1000
	                then Put("  ");
	             elsif T(I,J) > 1000
	                then Put("  ");
	             end if;
	             if T(I,J) > 0
	                then Put(T(I,J),0);
	             else
      	                Put(" ");
	             end if;
   	             if T(I,J) < 10
	                then Put("   ");
	             elsif T(I,J) < 100
	                then Put("  ");
	             elsif T(I,J) < 1000
	                then Put("  ");
	             elsif T(I,J) > 1000
	                then Put(" ");
	             end if;
                        Put("|");

                     IF J=4 and i=1                                                                   -------------------------------------------------
                        then Put("          - Deplacement vers le Haut : Flèche Haut");               -- Affiche la touche permettent un deplacement --
                     end if;                                                                          -------------------------------------------------
               end loop;
                  New_Line;

            for J in 1..Dimension loop                                                         ----------------------------------------------------
               IF J = 1                                                                        -- Permet de  recentrer le tableau                --
                     THEN Put("                       |");                                     -- Permet aussi de placer un espace en dessous et --
               END IF;                                                                         -- au dessus de la valeur dans la casea           --
               Put("       ");                                                                 ----------------------------------------------------
                    Put("|");
               IF J=4 and i=1
                    then Put("          - Deplacement vers le Bas : Flèche Bas");
               end if;
            END LOOP;
            New_Line;

         END LOOP;

         for L in 1..Dimension loop  -- derniere ligne affiche la fin du tableau avec les pointillet
               if L = 1
                  THEN Put("                       +-------+");                   --------------------------------------------
            ELSIF L = Dimension                                                   -- affiche la dernière ligne du tableau   --
                  THEN Put("-------");                                            --  avec unespace pour centrer le tableau --
            ELSe  Put("-------+");                                                --  et affiche aussi le score             --
            END IF;                                                               --------------------------------------------
         end loop;
               Put("+");
               New_Line;
               Put("                       Votre score :  ");
               Put(Sc);
               New_Line;
END Affiche;

end Affichage;
