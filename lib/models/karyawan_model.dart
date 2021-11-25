class KaryawanModel {
  int id;
  String idJabatan;
  String namaKaryawan;
  String status;
  String nomorHp;
  
  KaryawanModel({
      required this.id,
      required this.idJabatan,
      required this.namaKaryawan,
      required this.status,
      required this.nomorHp,
  });

  factory KaryawanModel.fromJson(Map<String, dynamic> json) {
    return KaryawanModel(
    id : json['id'],
    idJabatan : json['id_jabatan'],
    namaKaryawan : json['nama_karyawan'],
    status : json['status'],
    nomorHp : json['nomor_hp'],
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'id_jabatan' : idJabatan,
      'nama_karyawan' : namaKaryawan,
      'status' : status,
      'nomor_hp' : nomorHp,
    };
  }
}