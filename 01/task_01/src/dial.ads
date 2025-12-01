package Dial is
   type Node;
   type Node_Access is access all Node;
   type Node is record
      Data : Integer;
      Head : Node_Access;
      Tail : Node_Access;
   end record;

   function Initialize (Size : Integer; Start : Integer) return Node_Access;
   procedure Next (Steps : Integer; Current_Position : out Node_Access);
   procedure Previous (Steps : Integer; Current_Position : out Node_Access);
   procedure Append (Cursor : out Node_Access);
end Dial;
