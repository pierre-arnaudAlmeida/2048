WITH Ada.Text_IO; USE Ada.Text_IO;
WITH Ada.Integer_Text_IO; USE Ada.Integer_Text_IO;
With Pileprojet; use Pileprojet;

PACKAGE Variables IS
                                  -------------------------------------------------
   Ligne: Integer;                -- coodornée du tableau                        --
   Colonne: Integer;              -- coordonnée du tableau                       --
   Victoire : Integer :=1;        -- variable permettant d'enregistrer le score  --
   Var : Integer;                 --                                             --
   C: Integer;                    -- Variable du menu démarrer                   --
   Var2: Integer;                 -- Variable dans les générateur de probabilité --
   Nbretour_Arriere: Integer;     -- Permet de compter et limiter les retour     --
   Rejoue : Integer:=1;           -- Permet de rejouer à la fin d'une partie     --
                                  -------------------------------------------------
end Variables;
