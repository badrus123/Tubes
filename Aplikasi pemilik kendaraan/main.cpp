#include <iostream>
#include "Pemilik.h"
#include "windows.h"
using namespace std;

int main()
{
    int menu;
    lken L1;
    lpem L2;
    lrel L3;
    CreateListKen(L1);
    CreateListPem(L2);
    CreateListRel(L3);
    do{
        system("CLS");


        cout<<"=================Menu================"<<endl;
        cout<<"=1.Tambah Pemilik Kendaraan         ="<<endl;
        cout<<"====================================="<<endl;
        cout<<"=2.Tambah Jenis Kendaraan           ="<<endl;
        cout<<"====================================="<<endl;
        cout<<"=3.Tambah Relasi                    ="<<endl;
        cout<<"====================================="<<endl;
        cout<<"=4.Hapus Pemilik Kendaraan          ="<<endl;
        cout<<"====================================="<<endl;
        cout<<"=5.Tampilkan List Pemilik Kendaraan ="<<endl;
        cout<<"====================================="<<endl;
        cout<<"=6.Tampilkan List Jenis Kendaraan   ="<<endl;
        cout<<"====================================="<<endl;
        cout<<"=7.Tampilkan List Relasi            ="<<endl;
        cout<<"====================================="<<endl;
        cout<<"=8.Tampilkan Berdasarkan            ="<<endl;
        cout<<"====================================="<<endl;
        cout<<"=0.Keluar                           ="<<endl;
        cout<<"====================================="<<endl;
        cout<<"Pilih Menu  : ";

        cin>>menu;
        cout<<endl;
        if(menu==2){
            system("cls");
            int c;
            cout<<"masukan jenis kendaraan  sebanyak : ";
            cin>>c;
            for(int i=1;i<=c;i++){
            insertLastKen(L1, alokasiKen(InputDataKendaraan()));
            cout<<endl;
            }
            cout<<endl;
        }
        else if(menu==1){
            system("CLS");
            int c;
            cout<<"masukan pemilik sebanyak : ";
            cin>>c;
            for(int i=1;i<=c;i++){
                insertLastPem(L2, alokasiPem(InputDataPemilik()));
            cout<<endl;
            }
            cout<<endl;
        }
        else if(menu==3){
            int s1,s2;
            cout<<"Masukan Id Pemilik : ";cin>>s1;
            cout<<"Masukan Id Jenis Kendaraan : ";cin>>s2;
            addken O = findelmKen(L1, s2);
            addpem P = findelmPem(L2, s1);
            if((P==NULL)||(O==NULL)){
                cout<<"Data Tidak Ditemukan \n";
                getch();
            }
            else{
                insertRel(L3, alokasirelasi(O, P, L1, L2));
            cout<<endl;
            }
        }
        else if(menu==4){
            int s1;
            cout<<"Masukan Id Pemilik Kendaraan : ";cin>>s1;
            addpem O = findelmPem(L2, s1);
            cout<<"hai1";
            if(O==NULL){
                cout<<"data tidak ditemukan \n";
                getch();
            }
            else{
                deleteRelasi(L1, L2, L3, O);
                cout<<"hai2";
                deletePemilik(L2, O);
            }
        }
        else if(menu==6){
            system("CLS");
            printInfoKen(L1);
        }
        else if(menu==5){
            system("CLS");
            printInfoPem(L2);
        }
        else if(menu==7){
            system("CLS");
            printInfoRel(L3, L1, L2);
        }
        else if(menu==8){
            system("CLS");
            cout<<"====================Sub Menu======================"<<endl;
            cout<<"1.Jenis Kendaraan Dengan Pemilik Tertentu"<<endl;
            cout<<"=================================================="<<endl;
            cout<<"2.Jenis Kendaraan Yang Paling Banyak Dimiliki"<<endl;
            cout<<"=================================================="<<endl;
            cout<<"3.Pemilik Dengan Jumlah Kendaraan Paling Sedikit"<<endl;
            cout<<"=================================================="<<endl;
            cout<<"Pilih Sub Menu  : ";
            cin>>menu;
            cout<<endl;
            if(menu==1){
                int s1;
                cout<<"Masukan Id Pemilik Kendaraan : ";cin>>s1;
                addpem O = findelmPem(L2, s1);
                if(O==NULL){
                    cout<<"data tidak ditemukan \n";
                    getch();
                }
                else{
                    showkenbypem(L1,L2,L3,O);
                    getch();
                }
            }
            else if(menu==2){
                addken O = findelmKenTerbanyak(L1);
                showpembyken(L1,L2,L3,O);
                getch();
            }
            else if(menu==3){
                addpem O = findelmPenTerkecil(L2);
                showkenbypem(L1,L2,L3,O);
                getch();
            }
            else{
                cout<<"menu salah\n";
            }
            menu=1;
        }
    }while(menu!=0);
}
