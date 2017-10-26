#ifndef PEMILIK_H_INCLUDED
#define PEMILIK_H_INCLUDED
#include "kendaraan.h"

struct pem{  //tipe bentukan pemilik
    int id; //no ktp
    char nama[30]; // model kendaraan
    int umur;
    int Hitung;
};
typedef pem infopem;
typedef struct elmpem *addpem;
struct elmpem{
    infopem info;
    addpem next;
    addpem prev;
};
struct lpem{
    addpem first;
    addpem last;
};
typedef struct elmrel *addrel;
struct elmrel{
    addrel next;
    addrel prev;
    addpem nextpem;
    addken nextken;
};
struct lrel{
    addrel first;
    addrel last;
};

ken InputDataKendaraan();
pem InputDataPemilik();

void CreateListKen(lken &L);
void CreateListPem(lpem &L);
void CreateListRel(lrel &L);

addken alokasiKen(infoken x);
addpem alokasiPem(infopem x);
addrel alokasirelasi(addken &P1, addpem &P2, lken &L1, lpem &L2);

void dealokasiKen(infoken P);
void dealokasiPem(infopem P);

addken findelmKen(lken L, int x);
addken findelmKenTerbanyak(lken L);
addpem findelmPem(lpem L, int x);
addpem findelmPenTerkecil(lpem L);

void insertLastKen(lken &L, addken P);
void insertLastPem(lpem &L, addpem P);
void insertRel(lrel &L, addrel P);

void printInfoKen(lken L);
void printInfoPem(lpem L);
void printInfoRel(lrel L, lken L1, lpem L2);


void deleteRelasi(lken &L1, lpem &L2, lrel &L, addpem &P);
void deletePemilik(lpem &L, addpem &P);
void deleteKendaraan(lken &L, addken &P);

void showkenbypem(lken &L1, lpem &L2, lrel &L, addpem &P);
void showpembyken(lken &L1, lpem &L2, lrel &L, addken &P);

void insertAfterKen(lken &L, addken P, addken Prec);
void insertAfterPem(lpem &L, addpem &P, addpem Prec);
#endif // PEMILIK_H_INCLUDED
