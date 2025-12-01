with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;
with Dial; use Dial;

procedure Day_01 is
   File : File_Type;
   Line : Unbounded_String;
   Current_Position : Node_Access;
   Counter : Integer := 0;
begin
   Current_Position := Initialize (99, 50);

   Open (File, In_File, "input");

   while not End_Of_File (File) loop
      Get_Line (File, Line);
      if Element (Line, 1) = 'R' then
         Line := Delete (Line, 1, 1);
         Next (Integer'Value (To_String (Line)), Current_Position);
         if Current_Position.Data = 0 then
            Counter := Counter + 1;
         end if;
      end if;
      if Element (Line, 1) = 'L' then
         Line := Delete (Line, 1, 1);
         Previous (Integer'Value (To_String (Line)), Current_Position);
         if Current_Position.Data = 0 then
            Counter := Counter + 1;
         end if;
      end if;
   end loop;
   Put_Line (Counter'Image);
   Close (File);
end Day_01;
