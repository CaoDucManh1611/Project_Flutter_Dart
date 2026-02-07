import 'dart:io';
void Nhap (List<int>a, int n)
{
  for (int i=0; i<n; i++)
  {
    stdout.write ('a[${i+1}]= ');
    a[i] = int.parse(stdin.readLineSync()!);
  }
}
void Nhap1 (List<int>a, int n)
{
  for (int i=0; i<n; i++)
  {
    stdout.write ('Que ${i+1} có giá= ');
    a[i] = int.parse(stdin.readLineSync()!);
  }
}
void Xuat1 (List<int>a, int n)
{
  for (int i=0; i<n; i++)
  {
    stdout.writeln ('Que ${i+1} có giá= ${a[i]}');
  }
}
void Xuat (List<int>a, int n)
{
  for (int i=0; i<n; i++)
  {
    stdout.write ('${a[i]} ');
  }
}
void Tienkem (List<int>a, int n)
{
  double tong = 0;
  double giamgia = 1;
  double sotiengiamgia = 0;
  for (int gia in a)
  {
    tong += gia;
  }
  stdout.writeln('Tong tien que kem: ${tong}');
  if (n>10)
  {
    giamgia = 0.1;
  }
  else if (n>=5 && n<=10)
  {
    giamgia = 0.05;
  }
  else
  {
    giamgia = 1;
  }
  sotiengiamgia = tong*giamgia;
  stdout.writeln('Tong tien que kem giam: ${tong-sotiengiamgia}');
}
void Bai2 (var a, int n)
{
  int count = 0;
  int tong = 0;
  List<int> sole = [];
  for (int i in a)
  {
    if (i is int) {
      count ++;
      tong += i;
      if (i % 2 != 0) {
        sole.add(i);
      }
    }
  }
  print ('Co ${count} so nguyen.');
  print ('Tong so nguyen la ${tong}.');
  print ('So le la ${sole}.');
}
int snt (int n)
{
  if (n<2)
  {
    return 0;
  }
  for (int i = 2; i<n; i++)
  {
    if (n%i==0)
    {
      return 0;
    }
  }
  return 1;
}
void bai3 (var a , int n)
{
  int tong = 0;
  List<int> tongsnt = [];
  for (int i in a)
  {
    tong += i;
  }
  for (int i in a)
  {
    if (snt(i)==1)
    {
      tongsnt.add(i);
    }
  }
  print ('Tong so la ${tong}.');
  print ('So nguyen to la ${tongsnt}.');
  int vitri = -1;
  stdout.write('Nhap vao so can tim: ');
  int nhap = int.parse(stdin.readLineSync()!);
  for (int i = 0; i < a.length; i++)
  {
    if (nhap == a[i])
    {
      vitri = i;
      break;
    }
  }


  if (vitri != -1)
  {
    print ('Co trong danh sach tai vi tri ${vitri}');
  }
  else
  {
    print ('Khong co trong danh sach. Tien hanh them vao');
    a[0]=nhap;
  }
  print ('Danh sach sau cung: ${a}');

}

void main ()
{
  int chon;
  List <int>a = [];
  do{
    print ('==================================');
    print ('Menu');
    print ('Bai tap tai lop:');
    print ('1. Bai 1: ');
    print ('2. Bai 2: ');
    print ('3. Bai 3: ');
    print ('==================================');
    stdout.write ('Hay nhap lua chon cua ban: ');
    chon = int.parse(stdin.readLineSync()!);
    int n;
    switch (chon){
      case 1:
        do{
          stdout.write ('Hay nhap vao so luong que kem (n>0): ');
          n = int.parse(stdin.readLineSync()!);
        }while (n<=0);
        a = List.filled(n, 0);
        Nhap1(a, n);
        Tienkem(a, n);
        break;
      case 2:
        do{
          stdout.write ('Hay nhap vao so n (n>10): ');
          n = int.parse(stdin.readLineSync()!);
        }while (n<=10);
        a = List.filled(n, 0);
        Nhap(a, n);
        Bai2(a, n);
        break;
      case 3:
        do{
          stdout.write ('Hay nhap vao so n (n>0): ');
          n = int.parse(stdin.readLineSync()!);
        }while (n<=0);
        a = List.filled(n, 0);
        Nhap(a, n);
        Xuat(a, n);
        bai3(a, n);
        break;
    }
  }
  while(chon!=0);
}
