with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;
procedure Task_01 is
   function Max_Joltage_From_Bank (Bank : String) return Integer is
      Max_Joltage : Integer := 0;
      Joltage : Integer;
   begin
      for I in Bank'First .. Bank'Last - 1 loop
         for J in I + 1 .. Bank'Last loop
            Joltage := 10 * Integer'Value ((1 => Bank (I))) + Integer'Value ((1 => Bank (J)));
            if Joltage > Max_Joltage then
               Max_Joltage := Joltage;
            end if;
         end loop;
      end loop;
      return Max_Joltage;
   end Max_Joltage_From_Bank;

   Banks :  array (1 .. 200) of String (1 .. 100);

   File : File_Type;
   Line : Unbounded_String;
   Total : Integer := 0;
   Counter : Integer := Banks'First;

begin
   --   Read Input
   Open (File, In_File, "input");

   while not End_Of_File (File) loop
      Get_Line (File, Line);
      Banks (Counter) := To_String (Line);
      Counter := Counter + 1;
   end loop;

   --  Process Input
   for Bank of Banks loop
      declare
         Max_J : Integer := Max_Joltage_From_Bank (Bank);
      begin
         Put_Line ("Max joltage for bank: " & Bank);
         Put_Line (Max_J'Image);
         Total := Total + Max_J;
      end;
   end loop;
   Close (File);

   Put_Line ("Total output joltage: " & Integer'Image (Total));
end Task_01;
