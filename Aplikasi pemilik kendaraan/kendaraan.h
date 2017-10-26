#ifndef KENDARAAN_H_INCLUDED
#define KENDARAAN_H_INCLUDED
#include <iostream>
#include <conio.h>
#include <stdlib.h>
#define info(P) (P)->info
#define next(P) (P)->next
#define prev(P) (P)->prev
#define nextpem(P) (P)->nextpem
#define nextken(P) (P)->nextken
#define last(L) L.last
#define first(L) L.first

using namespace std;

struct ken{  //tipe bentukan kendaraan
    int id; //no polisi/ no kendaraan
    char jenis[30];
    int Hitung;
};
typedef ken infoken;
typedef struct elmken *addken;
struct elmken{
    infoken info;
    addken next;
    addken prev;
};
struct lken{
    addken first;
    addken last;
};


#endif // KENDARAAN_H_INCLUDED
