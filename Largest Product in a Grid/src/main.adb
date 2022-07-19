with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Main is

   NumFile : File_Type;
   Num_List : constant String :="Number List.txt";
   subtype size is Positive range 1..20;
   type List_Type is array (size, size) of Long_Integer;
   list_array : list_type;
   tempProduct : Long_Integer;
   Answer : Long_Integer := 0;

begin
   --text file into array
   Open(NumFile, In_File, Num_List);
   for row in size'Range loop
      for col in size'Range loop
         if not End_Of_File(NumFile) then
            Get(File => NumFile, Item => Integer(list_array(col, row)));
         end if;
      end loop;
   end loop;
   Close(NumFile);

   --checking data was entered in the array correctly
--   for row in size'Range loop
  --    for col in size'Range loop
    --     Put(Integer'Image(list_array(col,row)));
      --end loop;
      --Put_Line("");
   --end loop;

   for row in size'Range loop
      for col in size'Range loop
         --vertical check
         if row >= 4 then
            tempProduct := list_array(col,row);
            for i in 1..3 loop

               tempProduct := tempProduct * list_array(col,row-i);

            end loop;

            if tempProduct > Answer then

               Answer := tempProduct;

            end if;

         end if;

         --horisontal check
         if col <= 16 then
            tempProduct := list_array(col,row);
            for i in 1..3 loop

               tempProduct := tempProduct * list_array(col+i,row);

            end loop;

            if tempProduct > Answer then

               Answer := tempProduct;

            end if;

         end if;

         --Diagonally up
         if (row >= 4) and (col <= 16) then
            tempProduct := list_array(col,row);
            for i in 1..3 loop

               tempProduct := tempProduct * list_array(col+i,row-i);

            end loop;

            if tempProduct > Answer then

               Answer := tempProduct;

            end if;

         end if;


         --Diagnal down
         if (row >= 4) and (col <= 16) then
            tempProduct := list_array(col,row);
            for i in 1..3 loop

               tempProduct := tempProduct * list_array(col+i,row-i);

            end loop;

            if tempProduct > Answer then

               Answer := tempProduct;

            end if;

         end if;
      end loop;
   end loop;

   Put_Line(Long_Integer'Image(Answer));




end Main;
