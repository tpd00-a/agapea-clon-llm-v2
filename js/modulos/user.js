export const UserModule = {

  KEY: "agapea_user",
  USERS_KEY: "agapea_users",

  get() {
    try {
      return JSON.parse(localStorage.getItem(this.KEY));
    } catch {
      return null;
    }
  },

  isLoggedIn() {
    return !!this.get();
  },

  register(data) {

    const users = this.getUsers();

    if (users.find(u => u.email === data.email)) {
      return { ok: false, msg: "Ya existe una cuenta con ese email" };
    }

    const user = {

      id: Date.now(),
      name: data.name,
      surname: data.surname,
      email: data.email,
      password: data.password,
      newsletter: data.newsletter || false,
      createdAt: new Date().toISOString()

    };

    users.push(user);

    localStorage.setItem(this.USERS_KEY, JSON.stringify(users));

    return { ok: true };

  },

  logout() {
    localStorage.removeItem(this.KEY);
  },

  getUsers() {

    try {
      return JSON.parse(localStorage.getItem(this.USERS_KEY)) || [];
    } catch {
      return [];
    }

  },

  updateHeader() {

    const el = document.getElementById("header-user-name");

    if (!el) return;

    const user = this.get();

    el.textContent = user ? user.name : "Login";

  }

};

window.UserModule = UserModule;