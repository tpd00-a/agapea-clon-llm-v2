// ---- MÓDULO DE USUARIO ----
// Gestiona el registro de usuarios con localStorage

export const Usuario = {

  // Devuelve el usuario que tiene la sesión activa (o null si no hay)
  obtener() {
    try {
      return JSON.parse(localStorage.getItem('agapea_usuario'));
    } catch {
      return null;
    }
  },

  // Registra un nuevo usuario en la "base de datos" local
  registrar(datos) {
    const usuarios = this.obtenerTodos();

    // Comprobar que el email no esté ya registrado
    if (usuarios.find(u => u.email === datos.email)) {
      return { ok: false, msg: 'Ya existe una cuenta con ese correo electrónico.' };
    }

    const nuevoUsuario = {
      id: Date.now(),
      nombre: datos.nombre,
      apellidos: datos.apellidos,
      email: datos.email,
      password: datos.password,
      newsletter: datos.newsletter || false,
      fechaRegistro: new Date().toISOString()
    };

    usuarios.push(nuevoUsuario);
    localStorage.setItem('agapea_usuarios', JSON.stringify(usuarios));

    return { ok: true };
  },

  // Devuelve todos los usuarios registrados
  obtenerTodos() {
    try {
      return JSON.parse(localStorage.getItem('agapea_usuarios')) || [];
    } catch {
      return [];
    }
  },

  // Actualiza el texto del nombre de usuario en la cabecera
  actualizarCabecera() {
    const el = document.getElementById('nombre-usuario');
    if (!el) return;
    const usuario = this.obtener();
    el.textContent = usuario ? usuario.nombre : 'Login';
  }

};

window.Usuario = Usuario;
