import 'dart:io';
import 'dart:math';
void Nhap (List<int>a, int n) {
  List <int> danhsach = [];
  Random random = Random();
  int count = 0;
  int tong = 0;

  for (int i = 0; i < n; i++) {
    int songuyen = 5 + random.nextInt(100);
    danhsach.add(songuyen);
  }
  for (int i in danhsach) {
    if (i % 2 != 0) {
      count ++;
      tong += i;
    }
  }
  print('${danhsach}');
  print('Trung binh cong so le = ${(tong) / count}');
  int check = 1;
  for (int i = 0; i < danhsach.length / 2; i++) {
    if (danhsach[i] != danhsach[danhsach.length - i - 1]) {
      check = 0;
      break;
    }
  }
  if (check == 1) {
    print('Doi xung');
  }
  else {
    print('Khong doi xung');
  }

  int ktr = 0;
  for (int i = 0; i < danhsach.length - 1; i++) {
    if (danhsach[i] > danhsach[i + 1]) {
      ktr = 0;
      break;
    }
  }
  if (ktr == 1) {
    print('Chuoi tang dan');
  }
  else {
    print('Chuoi ko tang dan');
  }

  int max = -10000;

  for (int i in danhsach) {
    if (i > max) {
      max = i;
    }
  }
  print('Phan tu lon nhat la ${max}');
  int max2 = -100000;
  int checkd = 0;
  for (int i in danhsach) {
    if (i % 2 == 0) {
      if (i > max2) {
        max2 = i;
        checkd ++;
      }
    }
  }
  if (checkd > 0)
  {
    print('Co phan tu chan');
  }
  else
  {
    print('Khong co phan tu chan');
  }
  print('Phan tu chan lon nhat la ${max2}');

  stdout.write('Hay nhap vao so can tim: ');
  int ktr1 = 1;
  int nhapkt = int.parse(stdin.readLineSync()!);
  for (int i = 0 ; i<danhsach.length; i++)
  {
    if (nhapkt == danhsach[i])
    {
      ktr1 = 1;
    }
    else
    {
      ktr = 0;
    }
  }
  if (ktr1 == 0)
  {
    print('Khong tim thay');
  }
  else
  {
    danhsach.remove(nhapkt);
    print('tim thay');
  }
  print('Danh sach sau cung ${danhsach}');
}
void Nhap2 ()
{
  String chuoi;
  stdout.write('Nhap vao chuoi: ');
  chuoi = stdin.readLineSync()!;

  print ('Chuoi vua nhap la: ${chuoi}');
  String nguyenam = "ueoai";
  int count = 0;
  int count2 = 0;
  for (int i=0; i<chuoi.length; i++)
  {
    String kytuhientai = chuoi[i].toLowerCase();
    if (nguyenam.contains(kytuhientai))
    {
      count ++;
    }
  }
  for (int i=0; i<chuoi.length; i++)
  {
    if (chuoi[i] != " ") {
      count2++;
    }
  }
  if (chuoi == chuoi.split('').reversed.join(''))
  {
    print ('chuoi doi xung');
  }
  else
  {
    print ('chuoi khong doi xung');
  }

  print ('Chuoi chua ${count} tu nguyen am');
  print ('Chuoi chua ${count2} ky tu');
  if (chuoi == chuoi.split('').reversed.join(''))
  {
    print ('chuoi doi xung');
  }
  else
  {
    print ('chuoi khong doi xung');
  }

  String chuoimoi = chuoi.split('').reversed.join('');
  print ('Chuoi dao nguoc ${chuoimoi}');
}


void main ()
{
  int chon;
  List <int>a = [];
  do{
    print ('==================================');
    print ('Menu');
    print ('Bai tap ve nha');
    print ('1. Bai 1: ');
    print ('2. Bai 2: ');
    print ('==================================');
    stdout.write ('Hay nhap lua chon cua ban: ');
    chon = int.parse(stdin.readLineSync()!);
    int n;
    switch (chon){
      case 1:
        do{
          stdout.write ('Hay nhap vao so n (n>0): ');
          n = int.parse(stdin.readLineSync()!);
        }while (n<=0);
        a = List.filled(n, 0);
        Nhap(a, n);
        break;
      case 2:
        Nhap2();
        break;

    }
  }
  while(chon!=0);
}
