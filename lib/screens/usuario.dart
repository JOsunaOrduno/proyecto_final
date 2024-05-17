// usuario.dart

class Usuario {
  String nombre;
  String contrasena;
  String telefono;
  String fechaNacimiento;

  Usuario(this.nombre, this.contrasena, this.telefono, this.fechaNacimiento);

  @override
  String toString() {
    return 'Usuario{nombre: $nombre, contrasena: $contrasena, telefono: $telefono, fechaNacimiento: $fechaNacimiento}';
  }
}
