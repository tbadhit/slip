class GajiModel {
  GajiModel({
    required this.id,
    required this.idKaryawan,
    required this.idTunjangan,
    required this.tanggalGajian,
    required this.potongan,
    required this.totalGaji,
    required this.totalTunjangan,
    required this.createdAt,
    required this.updatedAt,
  });
  int id;
  String idKaryawan;
  String idTunjangan;
  String tanggalGajian;
  String potongan;
  String totalGaji;
  String totalTunjangan;
  String createdAt;
  String updatedAt;
  
  factory GajiModel.fromJson(Map<String, dynamic> json){
    return GajiModel(
    id : json['id'],
    idKaryawan : json['id_karyawan'],
    idTunjangan : json['id_tunjangan'],
    tanggalGajian : json['tanggal_gajian'],
    potongan : json['potongan'],
    totalGaji : json['total_gaji'],
    totalTunjangan : json['total_tunjangan'],
    createdAt : json['created_at'],
    updatedAt : json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
   'id' : id,
   'id_karyawan' : idKaryawan,
   'id_tunjangan' : idTunjangan,
   'tanggal_gajian' : tanggalGajian,
   'potongan' : potongan,
   'total_gaji' : totalGaji,
   'total_tunjangan' : totalTunjangan,
   'created_at' : createdAt,
   'updated_at' : updatedAt
    };
  }
}