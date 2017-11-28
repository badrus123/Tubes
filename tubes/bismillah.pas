program aplikasi_layanan_bem;
uses crt;

		{-------- TYPE RECORD--------}

Type Tabel_Mhs = Record
     nim : string;
     nama: String;
     tgl : string;
	 kls : string;
	 almt: string;
	 jk	 : string;
	 umur: integer;
  End;



Var
  Mhs  : Array[1..1000] of Tabel_Mhs;
  Angka: Real;
  nama,cari,search: string;
 u, k,s, i,c, n,m ,z,y,j,h,l,p: Integer;


  {---procedure loading---}

  procedure Loading;

var
   x, y, z      :integer;
   count        :integer;


begin
     clrscr;


     gotoxy(5, 5);
     write('[');

     gotoxy(30, 5);
     write(']');


     count := 0;
     repeat
     begin


          y := 0;
          z := 6;
          for x := 6 to 33 do
          begin
               delay(90);
               if(y > 3) then
               begin
                    gotoxy(z, wherey);
                    write(' ');
                    inc(z);
               end;

               if(x <= 29) then
               begin
                    gotoxy(x, wherey);
                    write('=');
                    inc(y);
               end;
          end;


          y := 0;
          z := 29;
          for x := 29 downto 2 do
          begin
               delay(90);
               if(y > 3) then
               begin
                    gotoxy(z, wherey);
                    write(' ');
                    dec(z);
               end;

               if(x >= 6) then
               begin
                    gotoxy(x, wherey);
                    write('=');
                    inc(y);
               end;
          end;
     end;

     inc(count);
     until count = 3;

     gotoxy(1, wherey+2);
     write('Press any key . . .');
     readkey;
end;

 {---PROCEDURE INPUT DATA MAHASISWA---}

     Procedure Mahasiswa;
     Begin
        clrscr;
	write('masukan berapa inputan data mahasiswa : ');
    readln(s);
      for i:=1 to s do
        Begin
          writeln;
          writeln('Input Data Mahasiswa');
          write('Nim Mahasiswa    : ');readln(mhs[i].nim);
          write('Nama Mahasiswa   : ');readln(mhs[i].nama);
          write('tgl lahir        : ');readln(mhs[i].tgl);
	  write('kelas		  : ');readln(mhs[i].kls);
	  write('alamat		  : ');readln(mhs[i].almt);
	  write('jenis kelamin	  : ');readln(mhs[i].jk);
	  write('umur	   	  : ');readln(mhs[i].umur);

        End;
	y:=s;
      End;

	  {---procedure urut data---}
procedure sortData(y:integer);
var
   temp:integer;
   tempS:string;

begin
    // menggunakan algoritma bubble sort
    for i:=1 to y-1 do
       begin
          for j:=y downto i+1 do
          begin
             if mhs[j].umur > mhs[j-1].umur then
                begin
                temp := mhs[j].umur;
                mhs[j].umur := mhs[j-1].umur;
                mhs[j-1].umur := temp;

                tempS := mhs[j].nama;
                mhs[j].nama := mhs[j-1].nama;
                mhs[j-1].nama := tempS;

                tempS := mhs[j].kls;
                mhs[j].kls := mhs[j-1].kls;
                mhs[j-1].kls := tempS;

                tempS := mhs[j].nim;
                mhs[j].nim := mhs[j-1].nim;
                mhs[j-1].nim := tempS;

		tempS := mhs[j].tgl;
                mhs[j].tgl := mhs[j-1].tgl;
                mhs[j-1].tgl := tempS;

		tempS := mhs[j].almt;
                mhs[j].almt := mhs[j-1].almt;
                mhs[j-1].almt := tempS;

		tempS := mhs[j].jk;
                mhs[j].jk := mhs[j-1].jk;
                mhs[j-1].jk := tempS;

                end;
          end;
       end;
end;


{--- show data ---}
 procedure show_data(y:integer);
 begin
 sortData(y);
		for z:=1 to y do
                begin
			writeln('nama 			 		 : ',mhs[z].nama);
			writeln('nim 		 			 : ',mhs[z].nim);
			writeln('tanggal lahir 		                 : ',mhs[z].tgl);
			writeln('kelas			  		 : ',mhs[z].kls);
			writeln('alamat			  		 : ',mhs[z].almt);
			writeln('jenis kelamin	  		         : ',mhs[z].jk);
			writeln('umur	   		  		 : ',mhs[z].umur);
                        writeln;
                        writeln;

		end;
         readln;
     end;


	{--- procedure edit data---}
	procedure edit(y:integer);
	var
		nemu:string;
	begin
		clrscr;
		write('cari nama yang mau di edit : ');readln(nemu);
		for i:=1 to y do
                     begin
			if (nemu=mhs[i].nama) then
			    write('nim 			 	       : ');readln(mhs[i].nim);
				write('nama 		 	       : ');readln(mhs[i].nama);
				write('tanggal lahir 		       : ');readln(mhs[i].tgl);
				write('kelas			       : ');readln(mhs[i].kls);
				write('alamat			       : ');readln(mhs[i].almt);
				write('jenis kelamin	               : ');readln(mhs[i].jk);
				write('umur	   		       : ');readln(mhs[i].umur);
	            end;
        end;

{--- procedure delete data ---}
procedure delete(y:integer);
begin
        clrscr;
        gotoxy(25,10);writeln('======================================================');
        gotoxy(25,11);writeln('cari data mahasiswa yang mau di hapus berdasarkan NIM ');
        gotoxy(25,12);writeln('======================================================');
        writeln;
         gotoxy(26,13);
        write('NIM = ');readln(cari);

	for i:=1 to y do
           begin
                clrscr;
		if (cari=mhs[i].nim) then
                begin
			mhs[i].nim :='';
			mhs[i].nama:='';
			mhs[i].tgl:='';
			mhs[i].almt:='';
			mhs[i].kls:='';
			mhs[i].umur:=0;
			mhs[i].jk:='';
            m:=i;
                end;
        end;
	for j:=m to 999 do
                        begin
				mhs[j].nim:=mhs[j+1].nim;
				mhs[j].nama:=mhs[j+1].nama;
	        	mhs[j].tgl:=mhs[j+1].tgl;
				mhs[j].kls:=mhs[j+1].kls;
				mhs[j].almt:=mhs[j+1].almt;
				mhs[j].jk:=mhs[j+1].jk;
				mhs[j].umur:=mhs[j+1].umur;
                end;
        write('                           ');
        write('                           ');
        write('                           ');


end;


        {--- menu input mahasiswa---}
procedure input;
var
        pilihan:char;
begin
        repeat
        clrscr;
        gotoxy(55,4);
        writeln('MENU INPUT DATA');
        gotoxy(40,6);
        writeln('==========================================');
        gotoxy(40,7);
        writeln('[                                        ]');
        gotoxy(40,8);
        writeln('[       1.INPUT DATA MAHASISWA           ]');
        gotoxy(40,9);
        writeln('[                                        ]');
        gotoxy(40,10);
        writeln('[========================================]');
        gotoxy(40,11);
        writeln('[                                        ]');
        gotoxy(40,12);
        writeln('[       2.keluar			  ]');
        gotoxy(40,13);
        writeln('[                                        ]');
        gotoxy(40,14);
        writeln('[========================================]');
        gotoxy(40,15);
        write('PILIHAN : ');readln(pilihan);
                if(pilihan='1') then
                        begin
                                mahasiswa;
                                readln;
                                input;
                        end
        until(pilihan='2');
end;

{--- procedure menu view---}
procedure view;
var
        pilih:char;
begin
        repeat
        clrscr;
        gotoxy(55,4);
        writeln('MENU VIEW DATA');
        gotoxy(40,6);
        writeln('==========================================');
        gotoxy(40,7);
        writeln('[                                        ]');
        gotoxy(40,8);
        writeln('[       1.VIEW DATA MAHASISWA            ]');
        gotoxy(40,9);
        writeln('[                                        ]');
        gotoxy(40,10);
        writeln('[========================================]');
        gotoxy(40,11);
        writeln('[                                        ]');
        gotoxy(40,12);
        writeln('[       2.keluar			  ]');
        gotoxy(40,13);
        writeln('[                                        ]');
        gotoxy(40,14);
        writeln('[========================================]');
        gotoxy(40,15);
        write('PILIHAN : ');readln(pilih);
                if(pilih='1') then
                        begin
                                show_data(y);
                                readln;
                                view;
                        end
        until(pilih='2');
end;







 {--- procedure menu admin ---}
procedure menuMHS();
	var
		opsi:char;
	begin
                repeat
			clrscr;
                        gotoxy(40,1);
			writeln('Menu Aplikasi Mahasiswa');
			writeln('========================================================================================================================');
                        writeln('[                 ]');
                        writeln('[=================]');
                        writeln('[                 ]');
			writeln('[ 1. input data   ]');
                        writeln('[                 ]');
                        writeln('[=================]');
                        writeln('[                 ]');
			writeln('[ 2. view data    ]');
                        writeln('[                 ]');
                        writeln('[=================]');
                        writeln('[                 ]');
			writeln('[ 3. edit data    ]');
                        writeln('[                 ]');
                        writeln('[=================]');
                        writeln('[                 ]');
			writeln('[ 4. delete data  ]');
                        writeln('[                 ]');
                        writeln('[=================]');
                        writeln('[                 ]');
			writeln('[ 5. keluar       ]');
                        writeln('[                 ]');
                        writeln('[=================]');
                        writeln('[                 ]');
			writeln('========================================================================================================================');
gotoXY(35,5);writeln ('�888888888888�');
delay (100);
gotoXY(32,6);writeln ('�888888822222228888�');
delay (100);
gotoXY(31,7);writeln ('�888888822222222288888�');
delay (100);
gotoXY(30,8); writeln ('�888888222222222228888822228888�');
delay (100);
gotoXY(30,9); writeln ('�888882222222222222288222222222888�');
delay (100);
gotoXY(30,10); writeln ('�88888222222222LUV22222222222222288�');
delay (100);
gotoXY(31,11); writeln ('�8888822222222222222222222222222_88�');
delay (100);
gotoXY(32,12); writeln ('�88888222222222222222U22222222__888�');
delay (100);
gotoXY(33,13); writeln ('�888822222222222222222222222___888�');
delay (100);
gotoXY(34,14); writeln ('�8888222222222222222222222____888�');
delay (100);
gotoXY(35,15); writeln ('�8888222222222222222222_____888�');
delay (100);
gotoXY(36,16); writeln ('�8882222222222222222_____8888�');
delay(100);
gotoXY(37,17); writeln ('�888822222222222______888888�');
delay(100);
gotoXY(38,18); writeln ('�8888882222______88888888�');
delay(100);
gotoXY(39,19); writeln ('�888888_____888888888�');
delay(100);
gotoXY(40,20); writeln ('�88888888888888�');
delay(100);
gotoXY(41,21); writeln ('�888888888�');
delay(100);
gotoXY(42,22); writeln ('�888888�');
delay(100);
gotoXY(43,23); writeln ('�8888');
delay(100);
gotoXY(44,24); writeln (' By: badh_rush');
delay(100);
gotoXY(45,25); writeln ('�8�');
delay(100);
gotoxy(45,28);
writeln(' @2016 world improssed,all right reserved ');
gotoxy(45,29);
writeln('       selamat datang di aplikasi kami    ');
gotoxy(45,30);
writeln('             semoga bermanfaat            ');
                        gotoxy(89,4);
                        writeln('====================');
                        gotoxy(89,5);
                        writeln('=                  =');
                        gotoxy(89,6);
                        writeln('=                  =');
                        gotoxy(89,7);
                        writeln('====================');
                        gotoxy(90,6);
			write('Pilihan : ');readln(opsi);

				 if (opsi='1') then
                                   begin
                                        writeln('selamat datang di input data');
                                        input;
					readln;
                                        menuMHS;
                                   end
                                else if (opsi='2') then
                                   begin
                                        clrscr;
                                        writeln('selamat datang di view data');
                                        view;
                                        readln;
                                        menuMHS;

                                   end
                                else if (opsi='3') then
                                   begin
                                        writeln('selamat datang di edit data');
                                        edit(s);
                                        readln;
                                        menuMHS;
                                   end
				else if (opsi='4') then
				   begin
					writeln('selamat datang di delete data');
					delete(y);
					readln;
					menuMHS;
				   end;
                        until(opsi='5');
	end;

        {--- procedure menu anggota---}

        procedure menu_anggota();
	var
		jokok:char;
	begin
			clrscr;
                        gotoxy(40,1);
			writeln('Menu Aplikasi Mahasiswa');
			writeln('========================================================================================================================');
                        writeln('[                 ]');
                        writeln('[=================]');
                        writeln('[                 ]');
			writeln('[ 1. INPUT DATA   ]');
                        writeln('[                 ]');
                        writeln('[=================]');
                        writeln('[                 ]');
			writeln('[                 ]');
                        writeln('[                 ]');
                        writeln('[=================]');
                        writeln('[                 ]');
                        writeln('[                 ]');
                        writeln('[                 ]');
                        writeln('[=================]');
                        writeln('[                 ]');
			writeln('[  2. VIEW DATA   ]');
                        writeln('[                 ]');
                        writeln('[=================]');
                        writeln('[                 ]');
			writeln('[                 ]');
                        writeln('[                 ]');
                        writeln('[=================]');
                        writeln('[                 ]');
			writeln('========================================================================================================================');
gotoXY(35,5);writeln ('�888888888888�');
delay (100);
gotoXY(32,6);writeln ('�888888822222228888�');
delay (100);
gotoXY(31,7);writeln ('�888888822222222288888�');
delay (100);
gotoXY(30,8); writeln ('�888888222222222228888822228888�');
delay (100);
gotoXY(30,9); writeln ('�888882222222222222288222222222888�');
delay (100);
gotoXY(30,10); writeln ('�88888222222222LUV22222222222222288�');
delay (100);
gotoXY(31,11); writeln ('�8888822222222222222222222222222_88�');
delay (100);
gotoXY(32,12); writeln ('�88888222222222222222U22222222__888�');
delay (100);
gotoXY(33,13); writeln ('�888822222222222222222222222___888�');
delay (100);
gotoXY(34,14); writeln ('�8888222222222222222222222____888�');
delay (100);
gotoXY(35,15); writeln ('�8888222222222222222222_____888�');
delay (100);
gotoXY(36,16); writeln ('�8882222222222222222_____8888�');
delay(100);
gotoXY(37,17); writeln ('�888822222222222______888888�');
delay(100);
gotoXY(38,18); writeln ('�8888882222______88888888�');
delay(100);
gotoXY(39,19); writeln ('�888888_____888888888�');
delay(100);
gotoXY(40,20); writeln ('�88888888888888�');
delay(100);
gotoXY(41,21); writeln ('�888888888�');
delay(100);
gotoXY(42,22); writeln ('�888888�');
delay(100);
gotoXY(43,23); writeln ('�8888');
delay(100);
gotoXY(44,24); writeln (' By: badh_rush');
delay(100);
gotoXY(45,25); writeln ('�8�');
delay(100);
gotoxy(45,28);
writeln(' @2016 world improssed,all right reserved ');
gotoxy(45,29);
writeln('       selamat datang di aplikasi kami    ');
gotoxy(45,30);
writeln('             semoga bermanfaat            ');
                        gotoxy(89,4);
                        writeln('====================');
                        gotoxy(89,5);
                        writeln('=                  =');
                        gotoxy(89,6);
                        writeln('=                  =');
                        gotoxy(89,7);
                        writeln('====================');
                        gotoxy(90,6);
			write('Pilihan : ');readln(jokok);

				 if (jokok='1') then
                                   begin
                                        writeln('selamat datang di input data');
                                        input;
					readln;
                                        menuMHS;
                                   end
                                else if (jokok='2') then
                                   begin
                                        clrscr;
                                        writeln('selamat datang di view data');
                                        view;
                                        readln;
                                        menuMHS;

                                   end;
                        end;




    {--- login admin--- }
procedure login_admin;
var
   user,pass,u,p:string;
   x,j:integer;
begin
     clrscr;
     user:='admin';
     pass:= '123';
     x:=0;
     for j:=1 to 3 do
     begin
          gotoxy(40,11);writeln('==============================');
          gotoxy(45,13);writeln('LOGIN ADMIN Mahasiswa ');
          gotoxy(40,15);writeln('==============================');
          writeln;
          gotoxy(41,17);
          write('Nama     : ');readln(u);
          gotoxy(41,18);
          write('Password : ');readln(p);
          readln;
          if user=u then
          begin
               if p=pass then
               begin
                    x:= 1;
                    break;
               end;
          end;
          clrscr;
          writeln('Nama dan password tidak cocok');
          writeln;
     end;
     clrscr;
     if x=0 then
        writeln('Maaf akun anda di blokir')
     else if x=1 then
		loading;
		clrscr;
        writeln('Selamat datang di Aplikasi layanan Mahasiswa, ',user,'!');
	              menuMHS;
     readln;
end;

{---procedure login anggota ---}
procedure login_anggota;
var
   user,pass,u,p:string;
   x,j:integer;

 begin
     clrscr;
     user:='anggota';
     pass:= '123';
     x:=0;
     for j:=1 to 3 do
     begin
          gotoxy(40,11);writeln('==============================');
          gotoxy(45,13);writeln('LOGIN ANGGOTA Mahasiswa');
          gotoxy(40,15);writeln('==============================');
          writeln;
          gotoxy(41,17);
          write('Nama     : ');readln(u);
          gotoxy(41,18);
          write('Password : ');readln(p);
          readln;
          if user=u then
          begin
               if p=pass then
               begin
                    x:= 1;
                    break;
               end;
          end;
          clrscr;
          writeln('Nama dan password tidak cocok');
          writeln;
     end;
     clrscr;
     if x=0 then
        writeln('Maaf akun anda di blokir')
     else if x=1 then
		loading;
		clrscr;
        writeln('Selamat datang di Aplikasi layanan Mahasiswa, ',user,'!');
	              menu_anggota;
     readln;
end;

{---procedure awal---}
procedure logo_telkom;
var
	ambil:string;
begin
clrscr;
         gotoxy(89,4);
                        writeln('====================');
                        gotoxy(89,5);
                        writeln('=                  =');
                        gotoxy(89,6);
                        writeln('=                  =');
                        gotoxy(89,7);
                        writeln('====================');
                        gotoxy(91,6);
			writeln('ANGGOTA');
	                gotoxy(11,4);
                        writeln('====================');
                        gotoxy(11,5);
                        writeln('=                  =');
                        gotoxy(11,6);
                        writeln('=                  =');
                        gotoxy(11,7);
                        writeln('====================');
                        gotoxy(13,6);
			writeln('ADMIN');

        gotoxy(47,2);
        writeln('APLIKASI LAYANAN MAHASISWA ');
        gotoxy(40,4); write('TELKOM UNIVERSI     LKOM UNIVERSITY');
        delay(100);
        gotoxy(40,5); write('TELKOM UNIVERSITY TELKOM UNIVERSITY');
        delay(100);
        gotoxy(40,6); write('TELKOM UNIVERSITY TELKOM UNIVERSITY');
        delay(100);
        gotoxy(40,7); write('                UNIV               ');
        delay(100);

        gotoxy(40,9); write('TELKOM UNI               UNIVERSITY');
        delay(100);
        gotoxy(40,10); write('UNIVERSITY               ITY TELKOM');
         delay(100);
        gotoxy(40,11); write('TELKOM UNI               UNIVERSITY');
         delay(100);
        gotoxy(40,12); write('UNIVERSITY               ITY TELKOM');
         delay(100);
        gotoxy(40,13); write('TELKOM UNI               UNIVERSITY');
         delay(100);
        gotoxy(40,14); write('UNIVERSITY               ITY TELKOM');
         delay(100);
        gotoxy(40,15); write('TELKOM UNI               UNIVERSITY');
         delay(100);
        gotoxy(40,16); write('UNIVERSITY               ITY TELKOM');
         delay(100);
        gotoxy(40,17); write('TELKOM UNI               UNIVERSITY');
         delay(100);
        gotoxy(40,18); write(' ELKOM UNIV        VERSITY TELKOM');
         delay(100);
        gotoxy(40,19); write('  LKOM UNIVER  IVERSITY  TELKOM');
         delay(100);
        gotoxy(40,20); write('   LKOM UNIVER VERSITY TELKOM');
         delay(100);
        gotoxy(40,21); write('    KOM UNIVERSITY TELKO UN');
         delay(100);
        gotoxy(40,22); write('        TELKOM UNIVERSITY ');
         delay(100);
        gotoxy(40,23); write('              TELKOM      ');
         delay(100);
         gotoxy(45,28);
writeln(' @2016 world improssed,all right reserved ');
gotoxy(45,29);
writeln('       selamat datang di aplikasi kami    ');
gotoxy(45,30);
writeln('             semoga bermanfaat            ');
                        gotoxy(89,10);
                        writeln('====================');
                        gotoxy(89,11);
                        writeln('=                  =');
                        gotoxy(89,12);
                        writeln('=                  =');
                        gotoxy(89,13);
                        writeln('====================');
                        gotoxy(91,12);
                        write('PILIHAN : ');readln(ambil);
			 if(ambil='admin') then
                        begin
                                clrscr;
				login_admin;

                        end
                else if (ambil='anggota')then
                        begin
                               clrscr;
			login_anggota;
                        end;


	readln;


end;

begin
        textbackground(red);
        textcolor(white);
        clrscr;


        logo_telkom;

        readln;
end.
