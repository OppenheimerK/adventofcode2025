package body Dial is

   function Initialize (Size : Integer; Start : Integer) return Node_Access is
      Cursor : Node_Access := new Node'(Data => 0, Head => null, Tail => null);
      Head_Node : Node_Access;
      Counter : Integer;
   begin
      for I in 1 .. Size loop
         Append (Cursor);
      end loop;
      Head_Node := Cursor;
      Previous (Size, Cursor, Counter);
      Cursor.Tail := Head_Node;
      Head_Node.Head := Cursor;
      Next (Start, Cursor, Counter);
      return Cursor;
   end Initialize;

   procedure Next (Steps : Integer; Current_Position : out Node_Access; Counter : in out Integer) is
   begin
      for I in 1 .. Steps loop
         if Current_Position.Data = 0 then
            Counter := Counter + 1;
         end if;
         Current_Position := Current_Position.Head;
      end loop;
   end Next;

   procedure Previous (Steps : Integer; Current_Position : out Node_Access; Counter : in out Integer) is
   begin
      for I in 1 .. Steps loop
         if Current_Position.Data = 0 then
            Counter := Counter + 1;
         end if;
         Current_Position := Current_Position.Tail;
      end loop;
   end Previous;

   procedure Append (Cursor : out Node_Access) is
      Next_Node : Node_Access := new Node'(Data => Cursor.Data + 1, Head => null, Tail => Cursor);
   begin
      Cursor.Head := Next_Node;
      Next_Node.Tail := Cursor;
      Cursor := Next_Node;
   end Append;

end Dial;
