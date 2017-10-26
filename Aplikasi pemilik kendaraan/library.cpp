#include "Pemilik.h"

addken findelmKen(lken L, int x){
    addken P = first(L);
    if(first(L)==NULL){
        return NULL;
    }
    else if(P==last(L)){
        if(info(P).id==x) {
                return P;
            }
    }
    else{
        do {
            if(info(P).id==x) {
                return P;
            }
            P = next(P);
        } while(P!=next(last(L)));
    }
    return NULL;
};
addken findelmKenTerbanyak(lken L){
    addken P = first(L);
    addken MAX=first(L);
    if(first(L)==NULL){
        return NULL;
    }
    else{
        do {
            if(info(P).Hitung>info(MAX).Hitung) {
                MAX=P;
            }
            P = next(P);
        } while(P!=next(last(L)));
        return MAX;
    }
    return NULL;
};

addpem findelmPenTerkecil(lpem L){
    addpem P = first(L);
    addpem MIN=first(L);
    if(first(L)==NULL){
        return NULL;
    }
    else{
        do {
            if(info(P).Hitung!=0 && info(P).Hitung<info(MIN).Hitung) {
                MIN=P;
            }
            P = next(P);
        } while(P!=next(last(L)));
        return MIN;
    }
    return NULL;
};


addpem findelmPem(lpem L, int x){
    addpem P = first(L);
    if(first(L)==NULL){
        return NULL;
    }
    else if(P==last(L)){
        if(info(P).id==x) {
                return P;
            }
    }
    else{
        do {
            if(info(P).id==x) {
                return P;
            }
            P = next(P);
        } while(P!=next(last(L)));
    }
    return NULL;
};



ken InputDataKendaraan(){
    ken x;
    cout<<"Input Data Kendaraan"<<endl;
    cout<<"Input Id              : "; cin>>x.id;
    cout<<"Input Jenis Kendaraan : "; cin>>x.jenis;
    cout<<"Input Berhasil!!!\n";
    getch();
    return x;
};
pem InputDataPemilik(){
    pem x;
    cout<<"Input Data Pemilik"<<endl;
    cout<<"Input Id   : "; cin>>x.id;
    cout<<"Input Nama : "; cin>>x.nama;
    cout<<"Input Umur : "; cin>>x.umur;
    cout<<"Input Berhasil!!!\n";
    getch();
    return x;
};


void CreateListKen(lken &L){
    first(L)=NULL;
    last(L)=NULL;
};
void CreateListPem(lpem &L){
    first(L)=NULL;
    last(L)=NULL;
};
void CreateListRel(lrel &L){
    first(L)=NULL;
    last(L)=NULL;
};


addken alokasiKen(infoken x){
    addken P=new elmken;
    info(P)=x;
    info(P).Hitung=0;
    return P;
};
addpem alokasiPem(infopem x){
    addpem P=new elmpem;
    info(P)=x;
    info(P).Hitung=0;
    return P;
};
addrel alokasirelasi(addken &P1, addpem &P2, lken &L1, lpem &L2){
    addrel x = new elmrel;
    nextken(x)=P1;
    nextpem(x)=P2;
    info(P1).Hitung+=1;
    info(P2).Hitung+=1;
    return x;
};

void insertLastKen(lken &L, addken P){
    if(first(L)==NULL){
        first(L)=P;
        last(L)=P;
    }
    else{
        next(last(L))=P;
        prev(P)=last(L);
        last(L)=P;
    }
};
void insertLastPem(lpem &L, addpem P){
    if(first(L)==NULL){
        first(L)=P;
        last(L)=P;
    }
    else{
        next(last(L))=P;
        prev(P)=last(L);
        last(L)=P;
    }
};
void insertRel(lrel &L, addrel P){
    if(first(L)==NULL){
        first(L)=P;
        last(L)=P;
    }
    else{
        next(last(L))=P;
        prev(P)=last(L);
        last(L)=P;
    }
    cout<<"Input Berhasil!!";
    getch();
};


void printInfoKen(lken L){
    addken P = first(L);
    if(P==NULL){
        cout<<"List Kosong"<<endl;
    } else{
        do {
            cout<<"Id              : "<<info(P).id<<"\n";
            cout<<"Jenis Kendaraan : "<<info(P).jenis<<"\n";
            cout<<"Hitung : "<<info(P).Hitung<<"\n";
            cout<<endl;
            P = next(P);
        } while(P!=next(last(L)));
        cout<<endl;
        cout<<endl;
        getch();
    }
};
void printInfoPem(lpem L){
    addpem P = first(L);
    if(P==NULL){
        cout<<" List Kosong"<<endl;
    } else{
        do {
            cout<<"Id   : "<<info(P).id<<"\n";
            cout<<"Nama : "<<info(P).nama<<"\n";
            cout<<"Umur : "<<info(P).umur<<"\n";
            cout<<"Hitung : "<<info(P).Hitung<<"\n";
            cout<<endl;
            P = next(P);
        } while(P!=next(last(L)));
        cout<<endl;
        cout<<endl;
        getch();
    }
};
void printInfoRel(lrel L, lken L1, lpem L2){
    addrel P = first(L);
    if(P==NULL){
        cout<<" List Kosong"<<endl;
        getch();
    } else{
        cout<<"=================================================================\n";
        do {
            cout<<"=Pemilik="<<"\n";
            cout<<"Id   : "<<info(nextpem(P)).id<<endl;
            cout<<"Nama : "<<info(nextpem(P)).nama<<endl;
            cout<<"Umur : "<<info(nextpem(P)).umur<<endl;
            cout<<"=Memiliki Jenis Kendaraan="<<endl;
            cout<<"Id    : "<<info(nextken(P)).id<<endl;
            cout<<"Nama  : "<<info(nextken(P)).jenis<<endl;
            cout<<"=================================================================\n";
            P = next(P);
        } while(P!=next(last(L)));
        cout<<endl;
        getch();
    }
};

void deleteRelasi(lken &L1, lpem &L2, lrel &L, addpem &P){
    addrel Q;
    if(first(L)==NULL){
        cout<<"list Kosong";
    }
    else{
       Q=first(L);
       do{
        if(nextpem(Q)==P){
            //cout<<"NULL BERHASIL\n";
            if(Q==first(L)&&(Q==last(L))){
                //cout<<"1";
                first(L)=NULL;
                last(L)=NULL;
                //cout<<"1s\n";
            }
            else if(Q==first(L)){
                //cout<<"2";
                addrel Z=Q;
                first(L)=next(Z);
                prev(first(L))=NULL;
                next(Z)=NULL;
                Z=NULL;
                Q=first(L);
                //cout<<"2s\n";
            }
            else if(Q==last(L)){
                //cout<<"3";
                addrel Z=Q;
                last(L)=prev(Z);
                next(last(L))=NULL;
                prev(Z)=NULL;
                Z=NULL;
                Q=next(last(L));
                //cout<<"3s\n";
            }
            else{
               // cout<<"4";
                addrel Z=Q;
                next(prev(Z))=next(Z);
                prev(next(Z))=prev(Z);
                Q=prev(Z);
                next(Z)=NULL;
                prev(Z)=NULL;
                Z=NULL;
               // cout<<"4s\n";
            }
        }
        else{
            Q=next(Q);
            //cout<<"5\n";
        }
        //cout<<"6\n";
    }while((first(L)!=NULL)&&(Q!=next(last(L))));
    cout<<"Delete Berhasil!!!\n";
    getch();
    }
};

void deletePemilik(lpem &L, addpem &P){
    if(first(L)==NULL){
        cout<<"list Kosong";
    }
    else{
            if(P==first(L)&&(P==last(L))){
                first(L)=NULL;
                last(L)=NULL;
            }
            else if(P==first(L)){
                first(L)=next(P);
                prev(first(L))=NULL;
                next(P)=NULL;
                P=NULL;
            }
            else if(P==last(L)){
                last(L)=prev(P);
                next(last(L))=NULL;
                prev(P)=NULL;
                P=NULL;
            }
            else{
                next(prev(P))=next(P);
                prev(next(P))=prev(P);
                next(P)=NULL;
                prev(P)=NULL;
                P=NULL;
            }
        }
};
void deleteKendaraan(lken &L, addken &P){
    if(first(L)==NULL){
        cout<<"list Kosong";
    }
    else{
            if(P==first(L)&&(P==last(L))){
                first(L)=NULL;
                last(L)=NULL;
            }
            else if(P==first(L)){
                first(L)=next(P);
                prev(first(L))=NULL;
                next(P)=NULL;
                P=NULL;
            }
            else if(P==last(L)){
                last(L)=prev(P);
                next(last(L))=NULL;
                prev(P)=NULL;
                P=NULL;
            }
            else{
                next(prev(P))=next(P);
                prev(next(P))=prev(P);
                next(P)=NULL;
                prev(P)=NULL;
                P=NULL;
            }
        }
};


void showkenbypem(lken &L1, lpem &L2, lrel &L, addpem &P){
    addrel Q;
    bool F;
    if(first(L)==NULL){
        cout<<"Tidak Ada relasi";
    }
    else{
        Q=first(L);
        cout<<"====================================\n";
        cout<<"Pemilik dengan : \n";
        cout<<"Id   : "<<info(P).id<<"\n";
        cout<<"Nama : "<<info(P).nama<<"\n";
        cout<<"Umur : "<<info(P).umur<<"\n";
        cout<<"\n";
        cout<<"Memiliki Jenis Kendaraan\n";
        cout<<"-------------------------------------\n";
        do {
        if(nextpem(Q)==P){
            F=true;
            cout<<"Id   : "<<info(nextken(Q)).id<<"\n";
            cout<<"Nama : "<<info(nextken(Q)).jenis<<"\n";
            cout<<endl;
        }
        Q=next(Q);
        } while(Q!=next(last(L)));
        if(F==false){
            cout<<"Tidak Ada Relasi";
        }
    }
};

void showpembyken(lken &L1, lpem &L2, lrel &L, addken &P){
    addrel Q;
    bool F;
    if(first(L)==NULL){
        cout<<"Tidak Ada relasi";
    }
    else{
        Q=first(L);
        cout<<"====================================\n";
        cout<<"Jenis dengan : \n";
        cout<<"Id   : "<<info(nextken(Q)).id<<"\n";
        cout<<"Nama : "<<info(nextken(Q)).jenis<<"\n";
        cout<<"\n";
        cout<<"Dimiliki Oleh : \n";
        cout<<"-------------------------------------\n";
        do {
        if(nextken(Q)==P){
            F=true;
            cout<<"Id   : "<<info(nextpem(Q)).id<<"\n";
            cout<<"Nama : "<<info(nextpem(Q)).nama<<"\n";
            cout<<"Umur : "<<info(nextpem(Q)).umur<<"\n";
            cout<<endl;
        }
        Q=next(Q);
        } while(Q!=next(last(L)));
        if(F==false){
            cout<<"Tidak Ada Relasi";
        }
    }
};



