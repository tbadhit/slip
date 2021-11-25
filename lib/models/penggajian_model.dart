import 'gaji_model.dart';

// class PenggajianModel {
//   PenggajianModel({
//     required this.karyawan,
//   });
//   Karyawan karyawan;
  
//   factory PenggajianModel.fromJson(Map<String, dynamic> json){
//     return PenggajianModel(
//     karyawan : Karyawan.fromJson(json['karyawan'])
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return{
//     'karyawan' : karyawan.toJson()
//     };
//   }

//   void add(PenggajianModel penggajianModel) {}
// }

class Karyawan {
  Karyawan({
    required this.id,
    required this.idJabatan,
    required this.namaKaryawan,
    required this.status,
    required this.tanggalMasuk,
    required this.nomorHp,
    required this.username,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
    required this.gaji,
  });
  int id;
  String idJabatan;
  String namaKaryawan;
  String status;
  String tanggalMasuk;
  String nomorHp;
  String username;
  String password;
  String createdAt;
  String updatedAt;
  List<GajiModel> gaji;
  
  factory Karyawan.fromJson(Map<String, dynamic> json){
    return Karyawan (
    id:  json['id'],
    idJabatan:  json['id_jabatan'],
    namaKaryawan:  json['nama_karyawan'],
    status:  json['status'],
    tanggalMasuk:  json['tanggal_masuk'],
    nomorHp:  json['nomor_hp'],
    username:  json['username'],
    password:  json['password'],
    createdAt:  json['created_at'],
    updatedAt : json['updated_at'],
    gaji: json['gaji']
      .map<GajiModel>((e)=>GajiModel.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
    'id' : id,
    'id_jabatan' : idJabatan,
    'nama_karyawan' : namaKaryawan,
    'status' : status,
    'tanggal_masuk' : tanggalMasuk,
    'nomor_hp' : nomorHp,
    'username' : username,
    'password' : password,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'gaji' : gaji.map((e)=>e.toJson()).toList(),
  };
}
}
