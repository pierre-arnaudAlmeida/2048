WITH Ada.Text_IO; USE Ada.Text_IO;
WITH Ada.Integer_Text_IO; USE Ada.Integer_Text_IO;
With Pileprojet; use Pileprojet;

PACKAGE Variables IS
                                  -------------------------------------------------
   Ligne: Integer;                -- coodorn�e du tableau                        --
   Colonne: Integer;              -- coordonn�e du tableau                       --
   Victoire : Integer :=1;        -- variable permettant d'enregistrer le score  --
   Var : Integer;                 --                                             --
   C: Integer;                    -- Variable du menu d�marrer                   --
   Var2: Integer;                 -- Variable dans les g�n�rateur de probabilit� --
   Nbretour_Arriere: Integer;     -- Permet de compter et limiter les retour     --
   Rejoue : Integer:=1;           -- Permet de rejouer � la fin d'une partie     --
                                  -------------------------------------------------
end Variables;
